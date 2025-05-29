import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final Future<String> Function(int id) _fetchPokemonName;

  PokemonBloc(
    { required Future<String> Function(int id) fetchPokemon}
  ) : 
  _fetchPokemonName = fetchPokemon,
  super(const PokemonState()) {
    on<PokemonAdded>((event, emit) {
      /// This method is called when a new Pokemon is added. It is inmutable
      /// so we create a new instance of the state with the updated pokemons.
      /// We use Map.from to create a new map from the existing pokemons and
      /// add the new pokemon to it.
      final updatedPokemons = Map<int, String>.from(state.pokemons);
      updatedPokemons[event.id] = event.name;

      /// Emit the new state with the updated pokemons.
      emit(state.copyWith(pokemons: updatedPokemons));
    });
  }

  Future fetchPokemonName(int id) async {

    if(state.pokemons.containsKey(id)) {
      return state.pokemons[id]!;
    }

    try {
      final pokemonName = await _fetchPokemonName(id); // Example name
      add(PokemonAdded(id, pokemonName));
      return pokemonName;
    } catch (e) {
      throw Exception('Error fetching Pokemon name: $e');
    }
  }
}
