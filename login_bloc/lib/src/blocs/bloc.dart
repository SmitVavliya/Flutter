import "dart:async";

import 'package:rxdart/rxdart.dart';

import "validators.dart";

class Bloc with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // Add data to stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // Retrieve data from stream
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  Stream<bool> get isValid =>
      Rx.combineLatest2(email, password, (x, y) => true);

  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
