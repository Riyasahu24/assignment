import 'package:assignment/bloc/auth/auth_bloc.dart';
import 'package:assignment/bloc/posts/post_bloc.dart';
import 'package:assignment/bloc/theme/theme_bloc.dart';
import 'package:assignment/bloc/theme/theme_event.dart';
import 'package:assignment/bloc/theme/theme_state.dart';
import 'package:assignment/model/post.dart';
import 'package:assignment/screen/dashboard_screen.dart';
import 'package:assignment/screen/login_screen.dart';
import 'package:assignment/screen/post_detail_screen.dart';
import 'package:assignment/screen/splash_screen.dart';
import 'package:assignment/services/api_services.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  ApiService apiService = ApiService();
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) {
      return MyApp(apiService: apiService);
    }
  ));
}

class MyApp extends StatelessWidget {
  final ApiService apiService;

  const MyApp({super.key, required this.apiService});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc()),
        BlocProvider(create: (_) => PostsBloc(apiService: apiService)),
        BlocProvider(create: (context) => ThemeBloc()..add(LoadTheme())),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'विशिष्ट',
          theme: state.isDarkMode ? ThemeData.dark() : ThemeData.light(),
            initialRoute: '/',
            routes: {
              '/': (context) => SplashScreen(),
              '/login': (context) => LoginScreen(),
              '/dashboard': (context) => DashboardScreen(),
              '/postDetails': (context) => PostDetailsScreen(
                    post: ModalRoute.of(context)!.settings.arguments as PostModel,
                  ),
            },
          );
        },
      ),
    );
  }
}
