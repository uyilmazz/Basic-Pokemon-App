import 'package:basicpokemonapp/utils/extension.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: context.dynamicHeight(0.4),
          width: context.dynamicHeight(0.3),
          child: Lottie.asset('assets/splash_lottie.json'),
        ),
      ),
    );
  }
}
