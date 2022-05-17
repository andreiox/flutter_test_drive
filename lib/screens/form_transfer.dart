import 'package:flutter/material.dart';
import 'package:flutter_test_drive/components/input.dart';
import 'package:flutter_test_drive/models/transfer.dart';

class TransferForm extends StatelessWidget {
  final TextEditingController controllerAccountNumber = TextEditingController();
  final TextEditingController controllerValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Making a transfer'),
      ),
      body: Column(
        children: <Widget>[
          Input(
            controller: controllerAccountNumber,
            label: 'Account number',
            hint: '1010',
          ),
          Input(
            controller: controllerValue,
            label: 'Value',
            hint: '150.25',
            icon: Icon(Icons.monetization_on),
          ),
          ElevatedButton(
              onPressed: () => _makeTransfer(context), child: Text('Confirm')),
        ],
      ),
    );
  }

  void _makeTransfer(BuildContext context) {
    final double? value = double.tryParse(controllerValue.text);
    final accountNumber = int.tryParse(controllerAccountNumber.text);

    if (value != null && accountNumber != null) {
      Transfer transfer = Transfer(value, accountNumber);
      Navigator.pop(context, transfer);
    }
  }
}
