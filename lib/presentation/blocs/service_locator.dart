import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/config/router/app_router.dart';
import 'package:blocs_app/presentation/blocs/blocs.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit(){

  /// Registering all the Cubits as singletons
  /// This way, they can be accessed throughout the app without needing to create new instances.
  /// This is useful for state management, as it allows the same instance of a Cubit to be used across different parts of the app.
  getIt.registerSingleton(UsernameCubit());
  getIt.registerSingleton(CounterCubit());
  getIt.registerSingleton(ThemeCubit(isDarkMode: false));
  getIt.registerSingleton(RouterSimpleCubit());
  getIt.registerSingleton(GuestsBloc());
  getIt.registerSingleton(PokemonBloc( fetchPokemon: PokemonInformation.getPokemonName));
}