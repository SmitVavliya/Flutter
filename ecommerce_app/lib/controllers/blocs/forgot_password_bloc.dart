import 'dart:async';

import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/controllers/blocs/utils/validators.dart';
import 'package:rxdart/rxdart.dart';

class ForgetPasswordBloc extends Validators {
  final AuthController _authController = AuthController();
  final BehaviorSubject<String> _emailController = BehaviorSubject<String>();

  Stream<String> get forgetPasswordEmail =>
      _emailController.stream.transform(emailValidator);

  Function(String) get setForgetPasswordEmail => _emailController.sink.add;

  Future<String> forgetPassword() async {
    String res = await _authController.forgetPassword(_emailController.value);

    return res;
  }

  void dispose() {
    _emailController.close();
  }
}
