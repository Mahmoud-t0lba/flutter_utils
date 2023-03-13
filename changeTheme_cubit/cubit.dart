import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Cubit
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(themeMode: ThemeMode.system));
  static ThemeCubit get(context) => BlocProvider.of(context);

  void toggleTheme() async {
    final themeMode = state.themeMode;
    if (themeMode == ThemeMode.system) {
      setThemeMode(ThemeMode.dark);
    } else if (themeMode == ThemeMode.dark) {
      setThemeMode(ThemeMode.light);
    } else if (themeMode == ThemeMode.light) {
      setThemeMode(ThemeMode.system);
    }
  }

  /// save theme to local
  Future<void> setThemeMode(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme_mode', themeMode.toString());
    emit(ThemeState(themeMode: themeMode));
  }

  Future<void> loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeModeString = prefs.getString('theme_mode');
    if (themeModeString != null) {
      final themeMode = ThemeMode.values.firstWhere(
        (e) => e.toString() == themeModeString,
        orElse: () => ThemeMode.system,
      );
      emit(ThemeState(themeMode: themeMode));
    }
  }
}

/// State
class ThemeState extends Equatable {
  final ThemeMode themeMode;

  const ThemeState({required this.themeMode});

  @override
  List<Object?> get props => [themeMode];
}

/// BlocObserver to follow current state
class ThemeObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    if (kDebugMode) {
      print('${bloc.runtimeType} $change');
    }
    super.onChange(bloc, change);
  }
}
