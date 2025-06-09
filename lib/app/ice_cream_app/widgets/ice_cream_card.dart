import 'package:flutter/material.dart';
import 'package:flutter_app_demo/app/ice_cream_app/model/ice_cream_model.dart';

class IceCreamCard extends StatelessWidget {
  const IceCreamCard({super.key, required this.iceCreams, required this.index});

  final List<IceCream>? iceCreams;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              iceCreams?[index].image ?? "",
              fit: BoxFit.cover,
              color: Colors.deepOrange.withOpacity(0.5),
              colorBlendMode: BlendMode.color,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(iceCreams?[index].name ?? ""),
                    Text(
                      "\$${iceCreams?[index].price}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
