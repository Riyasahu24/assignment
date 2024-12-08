import 'package:assignment/bloc/auth/auth_event.dart';
import 'package:assignment/bloc/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(const Duration(seconds: 1)); // Simulate delay
      if (event.email == 'test@example.com' && event.password == 'password123') {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        await prefs.setString('email', event.email);
        emit(Authenticated(event.email));
      } else {
        emit(AuthError('Invalid credentials'));
      }
    });

    on<LogoutEvent>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      emit(AuthInitial());
    });
  }
}
