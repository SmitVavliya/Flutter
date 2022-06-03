// ignore_for_file: must_be_immutable

import 'dart:typed_data';

import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/controllers/blocs/signup_bloc.dart';
import "package:flutter/material.dart";
import 'package:ecommerce_app/size_config.dart';
import 'package:ecommerce_app/views/components/account_text.dart';
import 'package:ecommerce_app/views/components/custom_suffix_icon.dart';
import 'package:ecommerce_app/views/components/default_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = "/signup";
  bool isLoading = false;
  Uint8List? _image;

  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController _fullNameController;
  late TextEditingController _userNameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _userNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    SignUpBloc().dispose();
    _fullNameController.dispose();
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  selectImage() async {
    Uint8List? image = await AuthController().pickImgage(ImageSource.gallery);
    setState(() {
      widget._image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
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
                  SizedBox(height: getHeight(context) * 0.015),
                  Text(
                    "Register Account",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(context, 28),
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(context, 5)),
                  const Text(
                    "Complete your details",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: getProportionateScreenHeight(context, 10)),
                  Stack(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 64,
                        backgroundColor: ePrimaryColor,
                        backgroundImage: widget._image == null
                            ? const NetworkImage(defaultUserImage)
                            : MemoryImage(widget._image!) as ImageProvider,
                      ),
                      Positioned(
                        right: 8,
                        bottom: 10,
                        child: InkWell(
                          child: const Icon(Icons.add_a_photo),
                          onTap: selectImage,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: getHeight(context) * 0.015),
                  buildFullNameField(context),
                  SizedBox(height: getProportionateScreenHeight(context, 30)),
                  buildUserNameField(context),
                  SizedBox(height: getProportionateScreenHeight(context, 30)),
                  buildEmailField(context),
                  SizedBox(height: getProportionateScreenHeight(context, 30)),
                  buildPasswordField(context),
                  SizedBox(height: getProportionateScreenHeight(context, 30)),
                  buildSignUpButton(context),
                  SizedBox(height: getHeight(context) * 0.015),
                  AccountText(
                    accountText: "Already have an account? ",
                    text: "Sign In",
                    onTap: () {
                      Navigator.pushReplacementNamed(context, "/signin");
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

  StreamBuilder<String> buildFullNameField(BuildContext context) {
    final SignUpBloc _signUpBloc =
        Provider.of<SignUpBloc>(context, listen: false);

    return StreamBuilder<String>(
      stream: _signUpBloc.signupFullName,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return TextField(
          controller: _fullNameController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: "Full Name",
            hintText: "Enter your Full Name",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            errorText: snapshot.error?.toString(),
          ),
          onChanged: (String value) {
            _signUpBloc.setSignUpFullName(value);
          },
        );
      },
    );
  }

  StreamBuilder<String> buildUserNameField(BuildContext context) {
    final SignUpBloc _signUpBloc =
        Provider.of<SignUpBloc>(context, listen: false);

    return StreamBuilder<String>(
      stream: _signUpBloc.signupUserName,
      builder: (context, snapshot) {
        return TextField(
          controller: _userNameController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: "User Name",
            hintText: "Enter your User Name",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            errorText: snapshot.error?.toString(),
          ),
          onChanged: (String value) {
            _signUpBloc.setSignUpUserName(value);
          },
        );
      },
    );
  }

  StreamBuilder<String> buildEmailField(BuildContext context) {
    final SignUpBloc _signUpBloc =
        Provider.of<SignUpBloc>(context, listen: false);

    return StreamBuilder<String>(
      stream: _signUpBloc.signupEmail,
      builder: (context, snapshot) {
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
            _signUpBloc.setSignUpEmail(value);
          },
        );
      },
    );
  }

  StreamBuilder<String> buildPasswordField(BuildContext context) {
    final SignUpBloc _signUpBloc =
        Provider.of<SignUpBloc>(context, listen: false);

    return StreamBuilder<String>(
      stream: _signUpBloc.signupPassword,
      builder: (context, snapshot) {
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
            _signUpBloc.setSignUpPassword(value);
          },
        );
      },
    );
  }

  StreamBuilder<bool> buildSignUpButton(BuildContext context) {
    final SignUpBloc _signUpBloc =
        Provider.of<SignUpBloc>(context, listen: false);

    void clearAllFields() {
      _fullNameController.clear();
      _userNameController.clear();
      _emailController.clear();
      _passwordController.clear();
      widget._image!.clear();
    }

    void handleSignUp() async {
      setState(() {
        widget.isLoading = true;
      });
      String res = await _signUpBloc.signUp(widget._image);
      setState(() {
        widget.isLoading = false;
      });
      if (res != "Success") {
        AuthController().showSnackbar(context, res);
      } else {
        Navigator.of(context).pushReplacementNamed("/mainscreen");
        clearAllFields();
      }
    }

    return StreamBuilder<bool>(
      stream: _signUpBloc.isValid,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        bool isNotValid = snapshot.hasError || !snapshot.hasData;

        return DefaultButton(
          text: "Continue",
          backgroundColor: isNotValid ? Colors.grey : ePrimaryColor,
          isLoading: widget.isLoading,
          onPressed: isNotValid ? null : handleSignUp,
        );
      },
    );
  }
}
