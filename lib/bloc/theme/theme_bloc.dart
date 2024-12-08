import 'package:assignment/helper/theme_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(isDarkMode: false)) {
    on<LoadTheme>((event, emit) async {
      // Load theme from local storage
      final isDarkMode = await ThemeHelper.isDarkMode();
      emit(ThemeState(isDarkMode: isDarkMode));
    });

    on<ToggleTheme>((event, emit) async {
      final newTheme = !state.isDarkMode;
      await ThemeHelper.setDarkMode(newTheme);
      emit(ThemeState(isDarkMode: newTheme));
    });
  }
}
