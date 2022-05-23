import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_test_drive/models/transfer.dart';

void main() {
  test('should return instance of transfer with corret values', () {
    final double value = 300;
    final int accountNumber = 10;

    final Transfer transfer = Transfer(value, accountNumber);
    expect(transfer, isA<Transfer>());
    expect(transfer.value, value);
    expect(transfer.accountNumber, accountNumber);
  });
}
