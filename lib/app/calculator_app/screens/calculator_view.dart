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

  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    firstValueController.text = x.toString();
    secondValueController.text = y.toString();
    _listener = AppLifecycleListener(
      onShow: _onShow,
      onHide: _onHide,
      onPause: _onPause,
      onResume: _onResume,
      onRestart: _onRestart,
      onStateChange: _onStateChanged,
      onDetach: _onDetach,
    );
  }

  void _onShow() => print("On show called");

  void _onHide() => print("On hide called");

  void _onPause() => print("On pause called");

  void _onResume() => print("On resume called");

  void _onRestart() => print("On restart called");

  void _onStateChanged(AppLifecycleState state) =>
      print("On state changed State called $state");

  void _onDetach() => print("On detach called");
  @override
  void dispose() {
    super.dispose();
    firstValueController.dispose();
    secondValueController.dispose();
    _listener.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalculatorDisplay(
          key: Key("DisplayOne"),
          controller: firstValueController,
          hintText: "Please first number value",
        ),
        SizedBox(height: 10),
        CalculatorDisplay(
          key: Key("DisplayTwo"),
          controller: secondValueController,
          hintText: "Please second number value",
        ),
        SizedBox(height: 20),
        Text(
          key: Key("Result"),
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
}

class CalculatorDisplay extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;

  const CalculatorDisplay({super.key, this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
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
          hintText: hintText!.isEmpty ? "Enter a number" : hintText,
        ),
      ),
    );
  }
}
