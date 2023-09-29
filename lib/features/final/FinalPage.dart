import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:quiz_computacao/common/constants/AppColors.dart';

class FinalPage extends StatefulWidget {
  const FinalPage({super.key, required this.acertos});

  final int acertos;

  @override
  State<StatefulWidget> createState() {
    return FinalPageState();
  }
}

class FinalPageState extends State<FinalPage> {
  Future<void> _launchUrl(link) async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;

    return Scaffold(
        body: Column(
      children: [
        Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("\nParabéns, você concluiu o quiz!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.color1,
                            fontSize: 38.0,
                            fontFamily: 'Upheavtt')),
                    Text("\nVocê acertou ${widget.acertos} de 10 perguntas!\n",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: AppColors.color1,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'CodeNewRoman')),
                    Image.asset("assets/images/trofeu.jpg",
                        width: mediaSize.width * 0.8,
                        height: mediaSize.height * 0.4),
                    const Text("Developed by: Yalle Rocha",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(255, 224, 224, 224),
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'CodeNewRoman')),
                  ],
                ),
              ),
            )),
        Expanded(
            child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: AppColors.gradientColors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Conheça mais sobre o\nPET Computação:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: 1.2,
                          color: Colors.white,
                          fontSize: 25.0,
                          fontFamily: 'Upheavtt')),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FloatingActionButton(
                            onPressed: () {
                              _launchUrl(
                                  "https://www.computacao.ufcg.edu.br/graduacao/pet-computa%C3%A7%C3%A3o");
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              "assets/images/google.png",
                              width: 45,
                              height: 45,
                            )),
                        FloatingActionButton(
                            onPressed: () {
                              _launchUrl(
                                  "https://www.youtube.com/@grupopetcomputacaoufcg");
                            },
                            backgroundColor: Colors.white,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child:
                                    Image.asset("assets/images/youtube.png"))),
                        FloatingActionButton(
                            onPressed: () {
                              _launchUrl(
                                  "https://www.instagram.com/petcomputacaoufcg");
                            },
                            backgroundColor: Colors.white,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                    "assets/images/instagram.png"))),
                      ]),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/onboarding');
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.color1,
                          minimumSize: Size(
                              mediaSize.width * 0.78, mediaSize.height * 0.06),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0))),
                      child: const Text('Voltar para o início',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontFamily: 'Upheavtt'))),
                ],
              ),
            ),
          ),
        ))
      ],
    ));
  }
}
