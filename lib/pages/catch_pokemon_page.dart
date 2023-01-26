import 'package:flutter/material.dart';

class CatchPokemonPage extends StatefulWidget {
  const CatchPokemonPage({super.key});

  @override
  State<CatchPokemonPage> createState() => _CatchPokemonPageState();
}

class _CatchPokemonPageState extends State<CatchPokemonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catch Pokemon'),
      ),
      body: const SafeArea(
        child: Center(
          child: Text('Catch Pokemon'),
        ),
      ),
    );
  }
}
