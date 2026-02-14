import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haify/main.dart'; // Imports your HaifyApp

void main() {
  testWidgets('Haify app smoke test', (WidgetTester tester) async {
    // 1. Pump the app (Wrapped in ProviderScope for Riverpod support)
    await tester.pumpWidget(const ProviderScope(child: HaifyApp()));

    // 2. Wait for animations to settle
    await tester.pumpAndSettle();

    // 3. Verify that our specific text is found
    expect(find.text('Haify Reset Successful'), findsOneWidget);

    // 4. Verify that the old counter "0" is NOT found
    expect(find.text('0'), findsNothing);
  });
}
