import 'package:flutter/material.dart';
import 'package:quiz_computacao/common/constants/AppColors.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return OnboardingPageState();
  }
}

class OnboardingPageState extends State<OnboardingPage> {
  @override
  void initState() {
    super.initState();
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
                gradient: LinearGradient(
                  colors: AppColors.gradientColors,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/logoPet.png",
                        width: mediaSize.width * 0.25,
                        height: mediaSize.height * 0.15),
                    Image.asset("assets/images/dev.png",
                        width: mediaSize.width * 0.7,
                        height: mediaSize.height * 0.4)
                  ],
                ),
              ),
            )),
        Expanded(
            child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Quiz PET Computação',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.color1,
                          fontSize: 50.0,
                          fontFamily: 'Upheavtt')),
                  const Text(
                      'Teste os seus conhecimetos em\nCiência da Computação!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.color1,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          fontFamily: 'CodeNewRoman')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/quiz');
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.color1,
                          minimumSize: Size(mediaSize.width * 0.78, mediaSize.height * 0.06),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0))),
                      child: const Text('Iniciar Quiz',
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
