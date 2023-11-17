
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_computacao/common/constants/app_colors.dart';
import 'dados.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return QuizPageState();
  }
}

class QuizPageState extends State<QuizPage> {
  @override
  void initState() {
    super.initState();
  }

  bool _isButtonEnabled = true;

  int perguntaNumero = 1;
  int acertos = 0;

  Color corBotao0 = Colors.white;
  Color corBotao1 = Colors.white;
  Color corBotao2 = Colors.white;
  Color corBotao3 = Colors.white;

  Color corTexto0 = AppColors.color2;
  Color corTexto1 = AppColors.color2;
  Color corTexto2 = AppColors.color2;
  Color corTexto3 = AppColors.color2;

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;

    void respondeu(alternativa) {
      setState(() {
        _isButtonEnabled = false;
        bool acertou = false;
        int respostaCerta = quiz[perguntaNumero - 1]["resposta"];
        if (alternativa == respostaCerta) {
          acertou = true;
          acertos++;
        }

        if (acertou) {
          if (alternativa == 0) {
            corBotao0 = Colors.green;
            corTexto0 = Colors.white;
          } else if (alternativa == 1) {
            corBotao1 = Colors.green;
            corTexto1 = Colors.white;
          } else if (alternativa == 2) {
            corBotao2 = Colors.green;
            corTexto2 = Colors.white;
          } else if (alternativa == 3) {
            corBotao3 = Colors.green;
            corTexto3 = Colors.white;
          }
        } else {
          if (alternativa == 0) {
            corBotao0 = Colors.red;
            corTexto0 = Colors.white;
          } else if (alternativa == 1) {
            corBotao1 = Colors.red;
            corTexto1 = Colors.white;
          } else if (alternativa == 2) {
            corBotao2 = Colors.red;
            corTexto2 = Colors.white;
          } else if (alternativa == 3) {
            corBotao3 = Colors.red;
            corTexto3 = Colors.white;
          }
          if (respostaCerta == 0) {
            corBotao0 = Colors.green;
            corTexto0 = Colors.white;
          } else if (respostaCerta == 1) {
            corBotao1 = Colors.green;
            corTexto1 = Colors.white;
          } else if (respostaCerta == 2) {
            corBotao2 = Colors.green;
            corTexto2 = Colors.white;
          } else if (respostaCerta == 3) {
            corBotao3 = Colors.green;
            corTexto3 = Colors.white;
          }
        }

        if (perguntaNumero == 10) {
          Timer(
              const Duration(seconds: 2),
              () => Navigator.pushReplacementNamed(context, '/final',
                  arguments: acertos));
          Timer(const Duration(milliseconds: 500), () => quiz.shuffle());
        }
        Timer(const Duration(seconds: 2), () {
          if (perguntaNumero < 10) {
            setState(() {
              perguntaNumero++;
              corBotao0 = Colors.white;
              corTexto0 = AppColors.color2;
              corBotao1 = Colors.white;
              corTexto1 = AppColors.color2;
              corBotao2 = Colors.white;
              corTexto2 = AppColors.color2;
              corBotao3 = Colors.white;
              corTexto3 = AppColors.color2;
              _isButtonEnabled = true;
            });
          }
        });
      });
    }

    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.gradientColors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Text("Pergunta $perguntaNumero de 10                ",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontFamily: 'Upheavtt')),
          ),
          Container(
            width: mediaSize.width * 0.78,
            height: mediaSize.height * 0.37,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              color: Colors.white,
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(quiz[perguntaNumero - 1]["imagem"])),
          ),
          Text("$perguntaNumero. ${quiz[perguntaNumero - 1]["pergunta"]}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  height: 1.2,
                  color: Colors.white,
                  fontSize: 20.0,
                  fontFamily: 'Upheavtt')),
          Center(
            child: ElevatedButton(
                onPressed: _isButtonEnabled
                    ? () {
                        respondeu(0);
                      }
                    : () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: corBotao0,
                    minimumSize:
                        Size(mediaSize.width * 0.78, mediaSize.height * 0.06),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0))),
                child: Text(quiz[perguntaNumero - 1]["alternativas"][0],
                    style: TextStyle(
                        color: corTexto0,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'CodeNewRoman'))),
          ),
          Center(
            child: ElevatedButton(
                onPressed: _isButtonEnabled
                    ? () {
                        respondeu(1);
                      }
                    : () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: corBotao1,
                    minimumSize:
                        Size(mediaSize.width * 0.78, mediaSize.height * 0.06),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0))),
                child: Text(quiz[perguntaNumero - 1]["alternativas"][1],
                    style: TextStyle(
                        color: corTexto1,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'CodeNewRoman'))),
          ),
          Center(
            child: ElevatedButton(
                onPressed: _isButtonEnabled
                    ? () {
                        respondeu(2);
                      }
                    : () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: corBotao2,
                    minimumSize:
                        Size(mediaSize.width * 0.78, mediaSize.height * 0.06),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0))),
                child: Text(quiz[perguntaNumero - 1]["alternativas"][2],
                    style: TextStyle(
                        color: corTexto2,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'CodeNewRoman'))),
          ),
          Center(
            child: ElevatedButton(
                onPressed: _isButtonEnabled
                    ? () {
                        respondeu(3);
                      }
                    : () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: corBotao3,
                    minimumSize:
                        Size(mediaSize.width * 0.78, mediaSize.height * 0.06),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0))),
                child: Text(quiz[perguntaNumero - 1]["alternativas"][3],
                    style: TextStyle(
                        color: corTexto3,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'CodeNewRoman'))),
          )
        ],
      ),
    ));
  }
}
