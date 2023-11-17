import 'package:flutter/material.dart';

import 'features/quiz/quiz_page.dart';
import 'features/splash/splash_page.dart';
import 'features/onboarding/onboarding_page.dart';
import 'features/final/final_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        debugShowCheckedModeBanner: false,
        title: 'Quiz PET Computação',
        initialRoute: '/splash',
        routes: {
          '/onboarding': (context) => const OnboardingPage(),
          '/splash': (context) => const SplashPage(),
          '/quiz': (context) => const QuizPage(),
          '/final': (context) {
              final acertos = ModalRoute.of(context)!.settings.arguments as int;
              return FinalPage(acertos: acertos);
            }
        });
  }
}
