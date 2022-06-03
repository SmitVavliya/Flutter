import 'dart:async';
import 'dart:typed_data';

import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/controllers/blocs/utils/validators.dart';
import 'package:rxdart/rxdart.dart';

class SignInBloc extends Validators {
  final AuthController _authController = AuthController();
  final BehaviorSubject<String> _emailController = BehaviorSubject<String>();
  final BehaviorSubject<String> _passwordController = BehaviorSubject<String>();

  Stream<String> get signinEmail =>
      _emailController.stream.transform(emailValidator);
  Stream<String> get signinPassword =>
      _passwordController.stream.transform(passwordValidator);

  Stream<bool> get isValid =>
      Rx.combineLatest2(signinEmail, signinPassword, (a, b) => true);

  Function(String) get setSignInEmail => _emailController.sink.add;
  Function(String) get setSignInPassword => _passwordController.sink.add;

  Future<String> signIn() async {
    String res = await _authController.signInUser(
      _emailController.value,
      _passwordController.value,
    );

    return res;
  }

  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
