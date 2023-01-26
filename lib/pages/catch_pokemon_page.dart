import 'package:flutter/material.dart';

class CatchPokemonPage extends StatefulWidget {
  const CatchPokemonPage({super.key});

  @override
  State<CatchPokemonPage> createState() => _CatchPokemonPageState();
}

class _CatchPokemonPageState extends State<CatchPokemonPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation =
        CurvedAnimation(parent: controller, curve: Curves.easeInOutCirc);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catch Pokemon'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotationTransition(
                turns: animation,
                child: SizedBox(
                  height: 90,
                  width: 90,
                  child: Image.asset('assets/images/pokeball.png'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  controller.repeat();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xfff00000),
                    foregroundColor: const Color(0xffee1515),
                    surfaceTintColor: Colors.white,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                child: const Text(
                  'Catch Pokemon',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
