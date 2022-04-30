import 'dart:async';

import "package:rxdart/rxdart.dart";

import 'validators.dart';

class RegisterBloc with Validators {
  final BehaviorSubject<String> _registerName = BehaviorSubject<String>();
  final BehaviorSubject<String> _registerEmail = BehaviorSubject<String>();
  final BehaviorSubject<String> _registerPhoneNumber =
      BehaviorSubject<String>();
  final BehaviorSubject<String> _registerPassword = BehaviorSubject<String>();
  final BehaviorSubject<String> _registerConfirmPassword =
      BehaviorSubject<String>();

  // Getters
  Stream<String> get registerName =>
      _registerName.stream.transform(nameValidator);
  Stream<String> get registerEmail =>
      _registerEmail.stream.transform(emailValidator);
  Stream<String> get registerPhoneNumber =>
      _registerPhoneNumber.stream.transform(phoneValidator);
  Stream<String> get registerPassword =>
      _registerPassword.stream.transform(passwordValidator);
  Stream<String> get registerConfirmPassword =>
      _registerConfirmPassword.stream.transform(passwordValidator).doOnData(
        (String confirmPassword) {
          if (_registerPassword.value.compareTo(confirmPassword) != 0) {
            _registerConfirmPassword.sink
                .addError("Confirm password must be same as password.");
          }
        },
      );

  Stream<bool> get isValid => Rx.combineLatest5(
      registerName,
      registerEmail,
      registerPhoneNumber,
      registerPassword,
      registerConfirmPassword,
      (a, b, c, d, e) => true);

  // Setters
  Function(String) get changeRegisterName => _registerName.sink.add;
  Function(String) get changeRegisterEmail => _registerEmail.sink.add;
  Function(String) get changeRegisterPhoneNumber =>
      _registerPhoneNumber.sink.add;
  Function(String) get changeRegisterPassword => _registerPassword.sink.add;
  Function(String) get changeRegisterConfirmPassword =>
      _registerConfirmPassword.sink.add;

  void submit() {}

  void dispose() {
    _registerName.close();
    _registerEmail.close();
    _registerPhoneNumber.close();
    _registerPassword.close();
    _registerConfirmPassword.close();
  }
}
