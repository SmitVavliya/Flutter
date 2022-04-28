import "package:flutter/material.dart";

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          emailField(),
          passwordField(),
          loginButtonField(),
        ],
      ),
    );
  }

  Widget emailField() {
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
          prefixIcon: const Icon(Icons.email, color: Colors.blue),
        ),
      ),
    );
  }

  Widget passwordField() {
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
          prefixIcon: const Icon(Icons.password, color: Colors.blue),
        ),
      ),
    );
  }

  Widget loginButtonField() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () => print("button pressed!!!"),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            "Login",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
