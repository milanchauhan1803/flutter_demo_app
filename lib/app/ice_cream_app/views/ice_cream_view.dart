import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_demo/app/ice_cream_app/model/ice_cream_model.dart';
import 'package:flutter_app_demo/app/ice_cream_app/widgets/ice_cream_card.dart';
import 'package:google_fonts/google_fonts.dart';

class IceCreamView extends StatelessWidget {
  Future<List<IceCream>?> loadData() async {
    final rawIceCreams = await rootBundle.loadString("assets/ice_cream.json");
    await Future.delayed(Duration(seconds: 1));
    final iceCreamData = jsonDecode(rawIceCreams);

    List<IceCream> iceCreamsListData =
        (iceCreamData['iceCreams'] as List)
            .map((e) => IceCream.fromJson(e))
            .toList();
    return iceCreamsListData;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Icecreams",
            style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "We have something yummy for you",
            style: GoogleFonts.poppinsTextTheme().bodySmall,
          ),
          SizedBox(height: 20),
          Expanded(
            child: Column(
              children: [
                FutureBuilder(
                  future: loadData(),
                  builder: (context, sanpshot) {
                    if (sanpshot.connectionState == ConnectionState.done) {
                      final iceCreams = sanpshot.data;
                      return Center(
                        child: SizedBox(
                          height: MediaQuery.sizeOf(context).height / 1.9,
                          width: MediaQuery.sizeOf(context).width,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: iceCreams?.length,
                            itemBuilder: (context, index) {
                              return IceCreamCard(
                                iceCreams: iceCreams,
                                index: index,
                              );
                            },
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
