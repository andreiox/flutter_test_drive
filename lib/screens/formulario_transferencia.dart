import 'package:flutter/material.dart';
import 'package:flutter_test_drive/components/input.dart';
import 'package:flutter_test_drive/models/transferencia.dart';

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController controllerNumeroConta = TextEditingController();
  final TextEditingController controllerValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferência'),
      ),
      body: Column(
        children: <Widget>[
          Input(
            controller: controllerNumeroConta,
            label: 'Numero da conta',
            hint: '1010',
          ),
          Input(
            controller: controllerValor,
            label: 'Valor',
            hint: '150.25',
            icon: Icon(Icons.monetization_on),
          ),
          ElevatedButton(
              onPressed: () => _criaTransferencia(context),
              child: Text('Confirmar')),
        ],
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final double? valor = double.tryParse(controllerValor.text);
    final numeroConta = int.tryParse(controllerNumeroConta.text);

    if (valor != null && numeroConta != null) {
      Transferencia transferencia = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferencia);
    }
  }
}
