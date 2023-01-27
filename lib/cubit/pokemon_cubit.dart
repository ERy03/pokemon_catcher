import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokemon_catcher/model/pokemon.dart';
import 'package:pokemon_catcher/repositories/pokemon_repository.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  final PokemonRepository _pokemonRepository;
  PokemonCubit(this._pokemonRepository) : super(const PokemonInitial());

  void getPokemon() async {
    emit(const PokemonLoading());
    _fetchPokemon();
  }

  _fetchPokemon() async {
    final result = await _pokemonRepository.getPokemon();
    result.fold(
      (l) => emit(PokemonError(l.toString())),
      (r) => emit(PokemonLoaded(r)),
    );
  }
}
