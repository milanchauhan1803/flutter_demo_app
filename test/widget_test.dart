import 'package:flutter/cupertino.dart';
import 'package:flutter_app_demo/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Calcualtor view", () {
    testWidgets("Calculator test", (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      expect(find.byKey(Key("Result")), findsOneWidget);
      expect(find.byKey(Key("DisplayOne")), findsOneWidget);
      expect(find.byKey(Key("DisplayTwo")), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.add), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.minus), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.multiply), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.divide), findsOneWidget);
    });

    testWidgets("Operation test", (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      await tester.pump();
      await tester.enterText(find.byKey(Key("DisplayOne")), "10");
      await tester.enterText(find.byKey(Key("DisplayTwo")), "20");

      await tester.tap(find.byIcon(CupertinoIcons.add));

      await tester.pump();

      expect(find.text("30"), findsOneWidget);
    });
  });
}
