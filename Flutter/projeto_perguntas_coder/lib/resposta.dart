import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() qunadoSelecionado;

  Resposta(this.texto, this.qunadoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue),),
        onPressed: qunadoSelecionado,
        child: Text(texto, style: TextStyle(color: Colors.white)),


      ),
    );
  }
}
