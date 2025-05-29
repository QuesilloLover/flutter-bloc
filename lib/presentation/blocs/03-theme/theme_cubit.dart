import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(
  {required bool isDarkMode}
  ) : super(ThemeState( isDarkMode: isDarkMode));

  void toggleTheme() {
    emit(ThemeState(isDarkMode: !state.isDarkMode));
  }

  void lightTheme() {
    emit(const ThemeState(isDarkMode: false));
  }

  void darkTheme() {
    emit(const ThemeState(isDarkMode: true));
  }
}
