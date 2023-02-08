import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PeguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'Texto': 'Qual sua cor Favorita?',
      'resposta': [
  {'texto': 'Preto', 'pontuacao': 10},
  {'texto': 'Vermelho', 'pontuacao': 5},
  {'texto': 'Verde', 'pontuacao': 3},
  {'texto': 'Branco', 'pontuacao': 1},
      ],
    },
    {
      'Texto': 'Qual é o seu animal favorito?',
      'resposta': [
    {'texto': 'Leão', 'pontuacao': 10},
    {'texto': 'Coelho', 'pontuacao': 5},
    {'texto': 'Elefante', 'pontuacao': 3},
    {'texto': 'Urubu', 'pontuacao': 10},
      ],
    },
    {
      'Texto': 'Qual a sua tecnologia favorita?',
      'resposta': [
    {'texto': 'Flutter', 'pontuacao': 10},
    {'texto': 'Go', 'pontuacao': 5},
    {'texto': 'Css', 'pontuacao': 3},
    {'texto': 'C++', 'pontuacao': 1},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0 ;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Perguntas'),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  responder: _responder)
              : Resultado(_pontuacaoTotal,_reiniciarQuestionario),),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PeguntaAppState createState() {
    return _PeguntaAppState();
  }
}
