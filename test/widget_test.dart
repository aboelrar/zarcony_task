// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:zarcony_task/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(
      child: MyApp(),
    ));

    expect(find.text('Mustafa st'), findsOneWidget);
    expect(find.text('search in thousands of products'), findsOneWidget);
    expect(find.text('Explore By Category'), findsOneWidget);
    expect(find.text('See All(5)'), findsOneWidget);
    expect(find.text('Deals of the day'), findsOneWidget);

    await tester.tap(find.byKey(Key("nanKey3")));
    await tester.pump();

    expect(find.text('Mustafa st'), findsOneWidget);
    expect(find.text('Cart'),findsNWidgets(2));


    for(int index =0;index<3;index++)
      {
        await tester.tap(find.byKey(const Key("plus0")));
        await tester.pump();
      }

    expect(find.text('4'),findsNWidgets(1));

    await tester.tap(find.byKey(const Key("minus0")));
    await tester.pump();

    expect(find.text('3'),findsNWidgets(1));


    await tester.tap(find.byKey(Key("nanKey0")));
    await tester.pump();

    expect(find.text('Mustafa st'), findsOneWidget);
    expect(find.text('search in thousands of products'), findsOneWidget);
    expect(find.text('Explore By Category'), findsOneWidget);
    expect(find.text('See All(5)'), findsOneWidget);
    expect(find.text('Deals of the day'), findsOneWidget);


  });
}
