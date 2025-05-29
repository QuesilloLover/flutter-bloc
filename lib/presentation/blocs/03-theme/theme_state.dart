part of 'theme_cubit.dart';

/// Equatable is used to compare the state, if the state is the same, it will not emit a new state
class ThemeState extends Equatable {
  final bool isDarkMode;

  const ThemeState({
   required this.isDarkMode,
  });

  @override

  /// Override the equality operator to compare the state
  List<Object> get props => [ isDarkMode]; 
}
