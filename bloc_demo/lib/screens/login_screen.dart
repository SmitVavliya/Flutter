// ignore_for_file: prefer_const_constructors
import 'package:bloc_demo/bloc/login_bloc.dart';
import 'package:bloc_demo/screens/register_screen.dart';
import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    LoginBloc().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginBloc = Provider.of<LoginBloc>(context, listen: false);

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                StreamBuilder<String>(
                  stream: loginBloc.loginEmail,
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    return TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        labelText: "Email Address",
                        hintText: "Please enter your email address",
                        errorText: snapshot.error?.toString(),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.blue,
                        ),
                      ),
                      onChanged: (value) {
                        loginBloc.changeLoginEmail(value);
                      },
                    );
                  },
                ),
                SizedBox(height: 30),
                StreamBuilder<String>(
                  stream: loginBloc.loginPassword,
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    return TextField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        labelText: "Password",
                        hintText: "Please enter your password",
                        errorText: snapshot.error?.toString(),
                        prefixIcon: Icon(
                          Icons.password,
                          color: Colors.blue,
                        ),
                      ),
                      onChanged: (value) {
                        loginBloc.changeLoginPassword(value);
                      },
                    );
                  },
                ),
                SizedBox(height: 30),
                _buildButton(),
                SizedBox(height: 30),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Need an account?",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      WidgetSpan(child: SizedBox(width: 5)),
                      TextSpan(
                        text: "Register",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    RegisterScreen(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton() {
    final loginBloc = Provider.of<LoginBloc>(context, listen: false);

    return StreamBuilder<bool>(
      stream: loginBloc.isValid,
      builder: (context, snapshot) {
        return ElevatedButton(
          onPressed: () => snapshot.hasError || !snapshot.hasData
              ? null
              : () => loginBloc.submit(),
          child: Text("Login"),
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              TextStyle(fontSize: 18),
            ),
            fixedSize: MaterialStateProperty.all(
              Size(100, 50),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            backgroundColor: snapshot.hasError || !snapshot.hasData
                ? MaterialStateProperty.all(Colors.grey)
                : MaterialStateProperty.all(Colors.blue),
          ),
        );
      },
    );
  }
}
