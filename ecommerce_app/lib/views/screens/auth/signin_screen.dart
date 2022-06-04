import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/controllers/blocs/signin_bloc.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:ecommerce_app/views/components/account_text.dart';
import 'package:ecommerce_app/views/components/custom_suffix_icon.dart';
import 'package:ecommerce_app/views/components/default_button.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  static String routeName = "/signin";
  bool _isLoading = false;

  SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    SignInBloc().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(context, 20),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: getHeight(context) * 0.04),
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(context, 28),
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(context, 5)),
                  const Text(
                    "Sign in with your email and password",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: getHeight(context) * 0.08),
                  buildEmailField(context),
                  SizedBox(height: getProportionateScreenHeight(context, 30)),
                  buildPasswordField(context),
                  SizedBox(height: getProportionateScreenHeight(context, 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed("/forgot_password");
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(context, 30)),
                  buildSignInButton(context),
                  SizedBox(height: getHeight(context) * 0.08),
                  AccountText(
                    accountText: "Don’t have an account? ",
                    text: "Sign Up",
                    onTap: () {
                      Navigator.pushReplacementNamed(context, "/signup");
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  StreamBuilder<String> buildEmailField(BuildContext context) {
    final SignInBloc _signInBloc =
        Provider.of<SignInBloc>(context, listen: false);

    return StreamBuilder<String>(
      stream: _signInBloc.signinEmail,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: "Email",
            hintText: "Enter your Email",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: const CustomSuffixIcon(
              svgIcon: "assets/icons/Mail.svg",
            ),
            errorText: snapshot.error?.toString(),
          ),
          onChanged: (String value) {
            _signInBloc.setSignInEmail(value);
          },
        );
      },
    );
  }

  StreamBuilder<String> buildPasswordField(BuildContext context) {
    final SignInBloc _signInBloc =
        Provider.of<SignInBloc>(context, listen: false);

    return StreamBuilder<String>(
      stream: _signInBloc.signinPassword,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return TextField(
          controller: _passwordController,
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
            labelText: "Password",
            hintText: "Enter your Password",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: const CustomSuffixIcon(
              svgIcon: "assets/icons/Lock.svg",
            ),
            errorText: snapshot.error?.toString(),
          ),
          onChanged: (String value) {
            _signInBloc.setSignInPassword(value);
          },
        );
      },
    );
  }

  StreamBuilder<bool> buildSignInButton(BuildContext context) {
    final SignInBloc _signInBloc =
        Provider.of<SignInBloc>(context, listen: false);

    void clearAllFields() {
      _emailController.clear();
      _passwordController.clear();
    }

    void handleSignIn() async {
      setState(() {
        widget._isLoading = true;
      });
      String res = await _signInBloc.signIn();
      setState(() {
        widget._isLoading = false;
      });
      if (res != "Success") {
        AuthController().showSnackbar(context, res);
      } else {
        Navigator.of(context).pushReplacementNamed("/mainscreen");
        clearAllFields();
      }
    }

    return StreamBuilder<bool>(
      stream: _signInBloc.isValid,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        bool isNotValid = snapshot.hasError || !snapshot.hasData;

        return DefaultButton(
          text: "Continue",
          isLoading: widget._isLoading,
          backgroundColor: isNotValid ? Colors.grey : ePrimaryColor,
          onPressed: isNotValid ? null : handleSignIn,
        );
      },
    );
  }
}
