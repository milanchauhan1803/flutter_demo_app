import 'package:flutter/material.dart';
import 'package:flutter_app_demo/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Hello world Test", (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.byType(Container), findsOneWidget);
  });
}
