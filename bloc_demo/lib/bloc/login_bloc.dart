import 'dart:async';
import "package:rxdart/rxdart.dart";

import 'validators.dart';

class LoginBloc with Validators {
  final BehaviorSubject<String> _loginEmail = BehaviorSubject<String>();
  final BehaviorSubject<String> _loginPassword = BehaviorSubject<String>();

  // Getters
  Stream<String> get loginEmail => _loginEmail.stream.transform(emailValidator);
  Stream<String> get loginPassword =>
      _loginPassword.stream.transform(passwordValidator);

  Stream<bool> get isValid =>
      Rx.combineLatest2(loginEmail, loginPassword, (a, b) => true);

  void submit() {}

  // Setters
  Function(String) get changeLoginEmail => _loginEmail.sink.add;
  Function(String) get changeLoginPassword => _loginPassword.sink.add;

  void dispose() {
    _loginEmail.close();
    _loginPassword.close();
  }
}
