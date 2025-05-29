import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/presentation/blocs/01-simple_cubit/username_cubit.dart';
import 'package:blocs_app/presentation/blocs/02-counter/counter_cubit.dart';
import 'package:blocs_app/presentation/blocs/03-theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MultipleCubitScreen extends StatelessWidget {
  const MultipleCubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>();
    final username = context.watch<UsernameCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple Cubits'),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(flex: 1,),

            IconButton(
              icon: themeCubit.state.isDarkMode
                  ? const Icon( Icons.dark_mode_outlined, size: 100 )
                  : const Icon( Icons.light_mode_outlined, size: 100 ),
              onPressed: () {
                themeCubit.toggleTheme();
              },
            ),

            Text(username.state, style: const TextStyle(fontSize: 25 )),

            TextButton.icon(
              icon: const Icon( Icons.add, size: 50,),
              label: Text(username.state, style: const TextStyle(fontSize: 100)),
              onPressed: () {
                context.read<CounterCubit>().increment();
              },
            ),
            
            const Spacer( flex: 2 ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Nombre aleatorio'),
        icon: const Icon( Icons.refresh_rounded ),
        onPressed: () {username.setUsername(RandomGenerator.getRandomName());}

      ),
    );
  }
}