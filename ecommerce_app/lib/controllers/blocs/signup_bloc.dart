// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:typed_data';

import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/controllers/blocs/utils/validators.dart';
import 'package:rxdart/rxdart.dart';

class SignUpBloc extends Validators {
  final AuthController _authController = AuthController();

  final BehaviorSubject<String> _fullNameController = BehaviorSubject<String>();
  final BehaviorSubject<String> _userNameController = BehaviorSubject<String>();
  final BehaviorSubject<String> _emailController = BehaviorSubject<String>();
  final BehaviorSubject<String> _passwordController = BehaviorSubject<String>();

  Stream<String> get signupFullName =>
      _fullNameController.stream.transform(nameValidator);
  Stream<String> get signupUserName =>
      _userNameController.stream.transform(userNameValidator);
  Stream<String> get signupEmail =>
      _emailController.stream.transform(emailValidator);
  Stream<String> get signupPassword =>
      _passwordController.stream.transform(passwordValidator);

  Stream<bool> get isValid => Rx.combineLatest4(signupFullName, signupUserName,
      signupEmail, signupPassword, (a, b, c, d) => true);

  Function(String) get setSignUpFullName => _fullNameController.sink.add;
  Function(String) get setSignUpUserName => _userNameController.sink.add;
  Function(String) get setSignUpEmail => _emailController.sink.add;
  Function(String) get setSignUpPassword => _passwordController.sink.add;

  Future<String> signUp(Uint8List? image) async {
    String res = await _authController.signUpUser(
      _fullNameController.value,
      _userNameController.value,
      _emailController.value,
      _passwordController.value,
      image,
    );

    return res;
  }

  void dispose() {
    _fullNameController.close();
    _userNameController.close();
    _emailController.close();
    _passwordController.close();
  }
}
