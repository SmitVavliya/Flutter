// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:zoom_app/controllers/auth_controller.dart';
import 'package:zoom_app/views/screens/home_screen.dart';
import 'package:zoom_app/views/screens/utils/show_message.dart';
import 'package:zoom_app/views/screens/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController _authController = AuthController();
  bool _isLoading = false;

  void onLogin(BuildContext context) async {
    setState(() => _isLoading = true);
    try {
      final User? user = await _authController.signInWithGoogle();

      if (user != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) {
            return const HomeScreen();
          }),
        );
        return;
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        showMessage(context, e.message!);
      }
    }
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !_isLoading
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Start or join a meeting.",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  child: Image.asset("assets/images/onboarding.jpg"),
                ),
                CustomButton(
                  text: "Google Sign In",
                  onPressed: () => onLogin(context),
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
