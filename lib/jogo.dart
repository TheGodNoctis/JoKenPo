import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage('imagens/padrao.png');
  var _mensagem = 'Escolha uma opção abaixo!!';

  final Map<String, AssetImage> _opcoesImagens = {
    'pedra': AssetImage('imagens/pedra.png'),
    'papel': AssetImage('imagens/papel.png'),
    'tesoura': AssetImage('imagens/tesoura.png'),
  };

  void _opcaoSelecionada(String escolhaUsuario) {
    final opcoes = ['pedra', 'papel', 'tesoura'];
    var numero = Random().nextInt(3); // Gerando número aleatório entre 0 e 2
    var escolhaApp = opcoes[numero];

    print('Escolha do App: ' + escolhaApp);
    print('Escolha do Usuário: ' + escolhaUsuario);

    setState(() {
      _imagemApp = _opcoesImagens[escolhaApp]!;
    });

    if (escolhaUsuario == escolhaApp) {
      setState(() {
        _mensagem = 'Empate!';
      });
    } else if (
      (escolhaUsuario == 'papel' && escolhaApp == 'pedra') ||
      (escolhaUsuario == 'tesoura' && escolhaApp == 'papel') ||
      (escolhaUsuario == 'pedra' && escolhaApp == 'tesoura')
    ) {
      setState(() {
        _mensagem = 'Você ganhou!';
      });
    } else {
      setState(() {
        _mensagem = 'Você perdeu!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(221, 0, 0, 0),
        title: Text('Jokenpo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              selectionColor: Colors.white,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(image: _imagemApp), // Exibe a imagem escolhida pelo app
          Padding(
            padding: EdgeInsets.only(top: 16, bottom: 16),
            child: Text(
              _mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada('pedra'),
                child: Image.asset('imagens/pedra.png', height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada('papel'),
                child: Image.asset('imagens/papel.png', height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada('tesoura'),
                child: Image.asset('imagens/tesoura.png', height: 100),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(221, 0, 0, 0),
    );
  }
}