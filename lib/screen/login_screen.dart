import 'package:assignment/bloc/auth/auth_bloc.dart';
import 'package:assignment/bloc/auth/auth_event.dart';
import 'package:assignment/bloc/auth/auth_state.dart';
import 'package:assignment/helper/validator_helper.dart';
import 'package:assignment/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/ui_helper.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late AnimationController _controller;
  late Animation<double> _fontSizeAnimation;

  bool isPasswordVisible = false;
  bool isLoading = false; // Track loading state

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true); // Automatically repeat the animation

    // Define a tween for font size
    _fontSizeAnimation = Tween<double>(begin: 40, end: 60).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            setState(() {
              isLoading = false; // Stop loading when error occurs
            });
            UIHelper.showSnackbar(context, state.message, Colors.red);
          } else if (state is Authenticated) {
            setState(() {
              isLoading = false; // Stop loading when authenticated
            });
            Navigator.pushReplacementNamed(context, '/dashboard');
          } else if (state is AuthLoading) {
            setState(() {
              isLoading = true; // Show loading when authentication starts
            });
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'LOGIN WITH',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 100,
                  child: AnimatedBuilder(
                    animation: _fontSizeAnimation,
                    builder: (context, child) {
                      return Text(
                        'विशिष्ट',
                        style: TextStyle(
                          fontSize: _fontSizeAnimation.value,
                          color: Colors.deepPurple,
                        ),
                      );
                    },
                  ),
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'Enter Email',
                                        hintStyle: TextStyle(color: Colors.grey),

                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  validator: ValidatorHelper.validateEmail,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.password_outlined),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: isPasswordVisible
                          ? Icon(Icons.visibility_outlined)
                          : Icon(Icons.visibility_off_outlined),
                    ),
                  ),
                  obscureText: isPasswordVisible ? false : true,
                  validator: ValidatorHelper.validatePassword,
                ),
                const SizedBox(height: 40),
               ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          fixedSize: Size.fromWidth(
                            MediaQuery.of(context).size.width * .7,
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<AuthBloc>(context).add(
                              LoginEvent(
                                _emailController.text.trim(),
                                _passwordController.text.trim(),
                              ),
                            );
                            
                          }
                        },
                        child: isLoading ? CircularProgressIndicator(color:Colors.white ,) : const Text(
                          'Login',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.white),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
