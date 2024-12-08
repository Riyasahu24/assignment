import 'package:assignment/helper/session_helper.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _fontSizeAnimation;
  @override
  void initState() {
    super.initState();
    _checkSession();
     _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true); 

   
    _fontSizeAnimation = Tween<double>(begin: 20,end: 80).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,

    ));
  }

  Future<void> _checkSession() async {
    await Future.delayed(const Duration(seconds: 3)); // Simulate loading
    final isLoggedIn = await SessionHelper.isLoggedIn();
    if (isLoggedIn) {
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

   @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _fontSizeAnimation,
          builder: (context, child) {
            return Text(
              'विशिष्ट',
              style: TextStyle(fontSize: _fontSizeAnimation.value,color: Colors.deepPurple),
            );
          },
        ),
      ),
    );
  }
}
