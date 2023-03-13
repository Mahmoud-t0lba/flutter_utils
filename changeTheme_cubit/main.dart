import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/cubit.dart';

void main() {
  Bloc.observer = ThemeObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit()..loadThemeMode(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: state.themeMode,
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        var cubit = ThemeCubit.get(context);
        return Scaffold(
          appBar: AppBar(elevation: 0),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Dark Mode'),
              ElevatedButton(
                onPressed: () => cubit.toggleTheme(),
                child: const Text('Toggle Theme'),
              ),
              SwitchListTile(
                title: const Text('Dark Mode'),
                value: cubit.state.themeMode == ThemeMode.dark,
                onChanged: (value) {
                  if (value) {
                    cubit.setThemeMode(ThemeMode.dark);
                  } else {
                    cubit.setThemeMode(ThemeMode.light);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
