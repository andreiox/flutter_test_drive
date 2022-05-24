import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_drive/main.dart';
import 'package:flutter_test_drive/screens/list_transfers.dart';

void main() {
  testWidgets('should make a transfer', (tester) async {
    await tester.pumpWidget(MyApp());

    final addTransferButton =
        find.widgetWithIcon(FloatingActionButton, Icons.add);
    expect(addTransferButton, findsOneWidget);

    await tester.tap(addTransferButton);
    await tester.pumpAndSettle();

    final titleText = find.text('Making a transfer');
    expect(titleText, findsOneWidget);

    final accountNumberInput = find.byKey(new Key('accountNumberInput'));
    await tester.enterText(accountNumberInput, '1000');

    final valueInput = find.byKey(new Key('valueInput'));
    await tester.enterText(valueInput, '150.15');

    final button = find.widgetWithText(ElevatedButton, 'Confirm');
    await tester.tap(button);

    await tester.pumpAndSettle();

    final transferItem = find.widgetWithText(TransferItem, '150.15');
    expect(transferItem, findsOneWidget);
  });
}
