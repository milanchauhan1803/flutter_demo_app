import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_demo/app/ice_cream_app/model/calculator.dart';
import 'package:google_fonts/google_fonts.dart';

class IceCreamView extends StatelessWidget {
  Future<List<IceCream>?> loadData() async {
    final rawIceCreams = await rootBundle.loadString("assets/ice_cream.json");
    Future.delayed(Duration(seconds: 1));
    final iceCreamData = jsonDecode(rawIceCreams);

    print(iceCreamData);
    return iceCreamData;
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
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FutureBuilder(
                    future: loadData(),
                    builder: (context, sanpshot) {
                      if (sanpshot.connectionState == ConnectionState.done) {
                        // final IceCream = snapshot.data;
                        final iceCreams = sanpshot.data;
                        return Center(child: Text(iceCreams?[0].name ?? ""));
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
          ),
        ],
      ),
    );
  }
}
