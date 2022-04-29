// ignore_for_file: prefer_const_constructors
import 'package:bloc_demo/bloc/register_bloc.dart';
import 'package:bloc_demo/screens/login_screen.dart';
import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isVisible = false;

  @override
  void dispose() {
    RegisterBloc().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final registerBloc = Provider.of<RegisterBloc>(context);

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
                  "Register",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                StreamBuilder<String>(
                  stream: registerBloc.registerName,
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
                        labelText: "Name",
                        hintText: "Please enter your name",
                        errorText: snapshot.error?.toString(),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                      ),
                      onChanged: (value) {
                        registerBloc.changeRegisterName(value);
                      },
                    );
                  },
                ),
                SizedBox(height: 30),
                StreamBuilder<String>(
                  stream: registerBloc.registerEmail,
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
                        registerBloc.changeRegisterEmail(value);
                      },
                    );
                  },
                ),
                SizedBox(height: 30),
                StreamBuilder<String>(
                  stream: registerBloc.registerPhoneNumber,
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
                        labelText: "Phone  Number",
                        hintText: "Please enter your phone number",
                        errorText: snapshot.error?.toString(),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.blue,
                        ),
                      ),
                      onChanged: (value) {
                        registerBloc.changeRegisterPhoneNumber(value);
                      },
                    );
                  },
                ),
                SizedBox(height: 30),
                StreamBuilder<String>(
                  stream: registerBloc.registerPassword,
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    return TextField(
                      keyboardType: TextInputType.emailAddress,
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
                        registerBloc.changeRegisterPassword(value);
                      },
                    );
                  },
                ),
                SizedBox(height: 30),
                StreamBuilder<String>(
                  stream: registerBloc.registerConfirmPassword,
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    return TextField(
                      keyboardType: TextInputType.emailAddress,
                      obscureText: isVisible ? false : true,
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
                        labelText: "Confirm Password",
                        hintText: "Please confirm your password",
                        errorText: snapshot.error?.toString(),
                        prefixIcon: Icon(
                          Icons.confirmation_num,
                          color: Colors.blue,
                        ),
                        suffixIcon: IconButton(
                          icon: isVisible
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                          onPressed: () => setState(() {
                            isVisible = !isVisible;
                          }),
                        ),
                      ),
                      onChanged: (value) {
                        registerBloc.changeRegisterConfirmPassword(value);
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
                        text: "Already have an account?",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      WidgetSpan(child: SizedBox(width: 5)),
                      TextSpan(
                        text: "Login",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    LoginScreen(),
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
    final registerBloc = Provider.of<RegisterBloc>(context, listen: false);

    return StreamBuilder<bool>(
      stream: registerBloc.isValid,
      builder: (context, snapshot) {
        return ElevatedButton(
          onPressed: () => snapshot.hasError || !snapshot.hasData
              ? null
              : () => registerBloc.submit(),
          child: Text("Register"),
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
