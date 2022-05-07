import "package:flutter/material.dart";
import 'package:login_bloc/src/blocs/bloc.dart';
import 'package:login_bloc/src/blocs/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          emailField(bloc),
          passwordField(bloc),
          loginButtonField(bloc),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder<String>(
      stream: bloc.email,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: TextField(
            // controller: null,
            textAlignVertical: TextAlignVertical.center,
            keyboardType: TextInputType.emailAddress,
            enableInteractiveSelection: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.blue),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.blue),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.red),
              ),
              hintText: "Please Enter your email address",
              labelText: "Email Address",
              errorText: snapshot.error?.toString(),
              prefixIcon: const Icon(Icons.email, color: Colors.blue),
            ),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder<String>(
      stream: bloc.password,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: TextField(
            // controller: null,
            textAlignVertical: TextAlignVertical.center,
            keyboardType: TextInputType.text,
            obscureText: true,
            enableInteractiveSelection: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.blue),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.blue),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.red),
              ),
              hintText: "Please Enter your password",
              labelText: "Password",
              errorText: snapshot.error?.toString(),
              prefixIcon: const Icon(Icons.password, color: Colors.blue),
            ),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget loginButtonField(Bloc bloc) {
    return StreamBuilder<bool>(
      stream: bloc.isValid,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: snapshot.hasData ? () {} : null,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Login",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        );
      },
    );
  }
}
