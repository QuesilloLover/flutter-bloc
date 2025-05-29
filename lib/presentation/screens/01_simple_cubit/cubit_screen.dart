import 'package:blocs_app/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/01-simple_cubit/username_cubit.dart';


class CubitScreen extends StatelessWidget {
  const CubitScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // Access the UsernameCubit by using context.watch, it will rebuild the widget
    // whenever the state of the cubit changes.
    // If you want to access the cubit without rebuilding the widget, use context.read

    // Use context.watch<UsernameCubit>().state to access the current state of the cubit
    //final usernameCubit = context.watch<UsernameCubit>();



    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit'),
      ),
      body: Center(

        /// we use BlocBuilder to listen to the state changes of the UsernameCubit
        /// BlocBuilder is a widget that rebuilds itself when the state of the cubit changes
        /// he builder function receives the current state of the cubit as an argument
        child: BlocBuilder<UsernameCubit, String>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            print('CubitScreen: build() called with state: $state');
            return Text(state);
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // When the button is pressed, emit a new state to the cubit
          // This will trigger a rebuild of the widget that is listening to the cubit
          context.read<UsernameCubit>().setUsername(RandomGenerator.getRandomName());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}