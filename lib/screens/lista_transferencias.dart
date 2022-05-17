import 'package:flutter/material.dart';
import 'package:flutter_test_drive/models/transferencia.dart';
import 'package:flutter_test_drive/screens/formulario_transferencia.dart';

class ListaTransferencia extends StatefulWidget {
  final List<Transferencia> transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transferencia?> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));

          future.then((transferencia) {
            if (transferencia != null) {
              setState(() {
                widget.transferencias.add(transferencia);
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: widget.transferencias.length,
          itemBuilder: (context, indice) {
            final transferencia = widget.transferencias[indice];
            return ItemTransferencia(
                key: UniqueKey(), transferencia: transferencia);
          }),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia transferencia;

  const ItemTransferencia({Key? key, required this.transferencia})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(this.transferencia.valor.toString()),
        subtitle: Text(this.transferencia.numeroConta.toString()),
      ),
    );
  }
}
