import 'package:basicpokemonapp/view_model/poke_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view/landing_page.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (context) => PokeViewModel(),
      child: const MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: LandingPage(),
    );
  }
}
