import 'package:flutter_bloc/flutter_bloc.dart';

class UsernameCubit extends Cubit<String>{
  
  // no-username is the initial state
  // This is the state that will be emitted when the cubit is created
  UsernameCubit(): super('no-username');

  // Method to change the username
  void setUsername(String newUsername) {
    // Emit a new state with the new username
    emit(newUsername);
  }
  
}