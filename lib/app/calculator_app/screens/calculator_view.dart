import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class CalculatorView extends StatefulWidget {
  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  int x = 0;
  int y = 0;
  num z = 0;

  TextEditingController firstValueController = TextEditingController();
  TextEditingController secondValueController = TextEditingController();

  @override
  void initState() {
    super.initState();
    firstValueController.text = x.toString();
    secondValueController.text = y.toString();
  }

  @override
  void dispose() {
    super.dispose();
    firstValueController.dispose();
    secondValueController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        calculatorDisplay(
          context: context,
          controller: firstValueController,
          hintText: "Please first number value",
        ),
        SizedBox(height: 10),
        calculatorDisplay(
          context: context,
          controller: secondValueController,
          hintText: "Please second number value",
        ),
        SizedBox(height: 20),
        Text(
          z.toString(),
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        x = int.tryParse(firstValueController.text) ?? 0;
                        y = int.tryParse(secondValueController.text) ?? 0;
                        z = x + y;
                      });
                    },
                    child: Icon(CupertinoIcons.add),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        x = int.tryParse(firstValueController.text) ?? 0;
                        y = int.tryParse(secondValueController.text) ?? 0;
                        z = x - y;
                      });
                    },
                    child: Icon(CupertinoIcons.minus),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        x = int.tryParse(firstValueController.text) ?? 0;
                        y = int.tryParse(secondValueController.text) ?? 0;
                        z = x * y;
                      });
                    },
                    child: Icon(CupertinoIcons.multiply),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        x = int.tryParse(firstValueController.text) ?? 0;
                        y =
                            int.tryParse(secondValueController.text) ??
                            1; // avoid divide by zero
                        z = x / y;
                      });
                    },
                    child: Icon(CupertinoIcons.divide),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    x = 0;
                    y = 0;
                    z = 0;

                    firstValueController.clear();
                    secondValueController.clear();
                  });
                },
                child: Text("Clear all"),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget calculatorDisplay({
    required BuildContext context,
    required TextEditingController controller,
    required String hintText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.black, width: 3),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.black),
          ),
          hintText: hintText.isEmpty ? "Enter a number" : hintText,
        ),
      ),
    );
  }
}
