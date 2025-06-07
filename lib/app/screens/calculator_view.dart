import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class CalculatorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: TextFormField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: Colors.black, width: 3),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: Colors.black),
              ),
              hintText: "Enter a number",
            ),
          ),
        ),
      ],
    );
  }

  Widget calculatorDisplay({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: TextFormField(
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.black, width: 3),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.black),
          ),
          hintText: "Enter a number",
        ),
      ),
    );
  }
}
