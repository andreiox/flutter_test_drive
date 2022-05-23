import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_drive/screens/form_transfer.dart';

void main() {
  testWidgets('Form transfer has title, 2 inputs and a button', (tester) async {
    await tester.pumpWidget(MaterialApp(home: new TransferForm()));

    final titleFinder = find.text('Making a transfer');
    final accountNumberInput = find.byKey(new Key('accountNumberInput'));
    final valueInput = find.byKey(new Key('valueInput'));
    final buttonTextFinder = find.text('Confirm');

    expect(titleFinder, findsOneWidget);
    expect(accountNumberInput, findsOneWidget);
    expect(valueInput, findsOneWidget);
    expect(buttonTextFinder, findsOneWidget);
  });
}
