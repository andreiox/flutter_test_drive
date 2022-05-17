import 'package:flutter/material.dart';
import 'package:flutter_test_drive/models/transfer.dart';
import 'package:flutter_test_drive/screens/form_transfer.dart';

class TransferList extends StatefulWidget {
  final List<Transfer> transfers = [];

  @override
  State<StatefulWidget> createState() {
    return TransferListState();
  }
}

class TransferListState extends State<TransferList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfers'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transfer?> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferForm();
          }));

          future.then((transfer) {
            if (transfer != null) {
              setState(() {
                widget.transfers.add(transfer);
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: widget.transfers.length,
          itemBuilder: (context, indice) {
            final transfer = widget.transfers[indice];
            return TransferItem(key: UniqueKey(), transfer: transfer);
          }),
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transfer transfer;

  const TransferItem({Key? key, required this.transfer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(this.transfer.value.toString()),
        subtitle: Text(this.transfer.accountNumber.toString()),
      ),
    );
  }
}
