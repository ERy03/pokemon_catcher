import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_catcher/constants/text.dart' as text;
import 'package:pokemon_catcher/cubit/pokemon_cubit.dart';
import 'package:pokemon_catcher/model/pokemon.dart';
import 'package:pokemon_catcher/view/widgets/buttons/colored_button.dart';
import 'package:pokemon_catcher/repositories/pokemon_repository.dart';
import 'package:pokemon_catcher/services/rest_api_service.dart';

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
    return BlocProvider(
      create: (_) => PokemonCubit(PokemonRepositoryImpl(
        RestApiService(Dio()),
      )),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Catch Pokemon'),
        ),
        body: SafeArea(
          child: BlocConsumer<PokemonCubit, PokemonState>(
            listener: (context, state) => {
              if (state is PokemonLoading)
                {controller.repeat()}
              else if (state is PokemonLoaded)
                {controller.stop()},
            },
            builder: (context, state) {
              if (state is PokemonInitial) {
                return _buildInitialView(animation, state);
              } else if (state is PokemonLoading) {
                return _buildInitialView(animation, state);
              } else if (state is PokemonLoaded) {
                return CatchPokemonPageLoaded(
                    pokemon: state.pokemon, state: state);
              } else {
                return _buildErrorView(state);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildInitialView(Animation<double> animation, PokemonState state) {
    return CatchPokemonPageInitial(animation: animation, state: state);
  }

  Widget _buildErrorView(PokemonState state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            state is PokemonError ? state.message : 'error',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ColoredButton(
            text: 'retry',
            onPressed: () => context.read<PokemonCubit>().getPokemon(),
          ),
        ],
      ),
    );
  }
}

class CatchPokemonPageLoaded extends StatelessWidget {
  const CatchPokemonPageLoaded({
    required this.state,
    required this.pokemon,
    super.key,
  });

  final PokemonState state;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    bool r = Random().nextDouble() <= 0.9975;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: r
                ? Image.network(
                    pokemon.sprites.other.officialArtwork.frontDefault)
                : Image.network(
                    pokemon.sprites.other.officialArtwork.frontShiny),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                pokemon.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Visibility(
                  visible: !r,
                  child: const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Id: ${pokemon.id}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                'Height: ${pokemon.height}',
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                'Weight: ${pokemon.weight}',
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          ColoredButton(
            text: text.catchPokemon,
            onPressed: () {
              state is PokemonLoading ? null : _getPokemon(context);
            },
          ),
        ],
      ),
    );
  }

  void _getPokemon(BuildContext context) {
    final pokemonCubit = context.read<PokemonCubit>();
    pokemonCubit.getPokemon();
  }
}

class CatchPokemonPageInitial extends StatefulWidget {
  const CatchPokemonPageInitial({
    required this.animation,
    required this.state,
    super.key,
  });

  final PokemonState state;
  final Animation<double> animation;

  @override
  State<CatchPokemonPageInitial> createState() =>
      _CatchPokemonPageInitialState();
}

class _CatchPokemonPageInitialState extends State<CatchPokemonPageInitial> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RotationTransition(
            turns: widget.animation,
            child: SizedBox(
              height: 90,
              width: 90,
              child: Image.asset('assets/images/pokeball.png'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ColoredButton(
            text: text.catchPokemon,
            onPressed: () {
              widget.state is PokemonLoading ? null : _getPokemon(context);
            },
          ),
        ],
      ),
    );
  }

  void _getPokemon(BuildContext context) {
    final pokemonCubit = context.read<PokemonCubit>();
    pokemonCubit.getPokemon();
  }
}
