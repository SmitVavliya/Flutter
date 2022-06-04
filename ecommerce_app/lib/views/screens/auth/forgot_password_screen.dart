import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/routes.dart';
import 'package:ecommerce_app/views/components/account_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/auth_controller.dart';
import '../../../controllers/blocs/forgot_password_bloc.dart';
import '../../../size_config.dart';
import '../../components/custom_suffix_icon.dart';
import '../../components/default_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static String routeName = "/forgot_password";
  bool _isLoading = false;

  ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    ForgetPasswordBloc().dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(context, 20)),
            child: Column(
              children: [
                SizedBox(height: getHeight(context) * 0.04),
                Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(context, 28),
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Please enter your email and we will send \nyou a link to return to your account",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: getHeight(context) * 0.1),
                Column(
                  children: [
                    buildEmailField(context),
                    SizedBox(height: getProportionateScreenHeight(context, 30)),
                    SizedBox(height: getHeight(context) * 0.1),
                    buildForgetPasswordButton(context),
                    SizedBox(height: getHeight(context) * 0.1),
                    AccountText(
                      accountText: "Don’t have an account? ",
                      text: "Sign Up",
                      onTap: () {
                        Navigator.pushReplacementNamed(context, "/signup");
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  StreamBuilder<String> buildEmailField(BuildContext context) {
    final ForgetPasswordBloc _forgetPasswordBloc =
        Provider.of<ForgetPasswordBloc>(context, listen: false);

    return StreamBuilder<String>(
      stream: _forgetPasswordBloc.forgetPasswordEmail,
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
            _forgetPasswordBloc.setForgetPasswordEmail(value);
          },
        );
      },
    );
  }

  StreamBuilder<String> buildForgetPasswordButton(BuildContext context) {
    final ForgetPasswordBloc _forgetPasswordBloc =
        Provider.of<ForgetPasswordBloc>(context, listen: false);

    void clearAllFields() {
      _emailController.clear();
    }

    void handleForgetPassword() async {
      setState(() {
        widget._isLoading = true;
      });
      String res = await _forgetPasswordBloc.forgetPassword();
      setState(() {
        widget._isLoading = false;
      });
      if (res != "Success") {
        AuthController().showSnackbar(context, res);
      } else {
        clearAllFields();
        Navigator.of(context).pushNamedAndRemoveUntil(
            "/signin", (Route<dynamic> route) => false);
        AuthController().showSnackbar(context,
            "Forgot Password Link has been sent to your provided email address. Please verify it and Sign In again.");
      }
    }

    return StreamBuilder<String>(
      stream: _forgetPasswordBloc.forgetPasswordEmail,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        bool isNotValid = snapshot.hasError || !snapshot.hasData;

        return DefaultButton(
          text: "Continue",
          isLoading: widget._isLoading,
          backgroundColor: isNotValid ? Colors.grey : ePrimaryColor,
          onPressed: isNotValid ? null : handleForgetPassword,
        );
      },
    );
  }
}
