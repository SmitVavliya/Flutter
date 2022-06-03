import 'dart:async';

import 'package:ecommerce_app/const.dart';

class Validators {
  var emailValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (String email, sink) {
    if (email.isEmpty) {
      return sink.addError("This Field can't be empty.");
    }
    if (email.length > 32) {
      return sink.addError("Email can't be more than 32 characters");
    }
    if (email.length < 6) {
      return sink.addError("Email can't be less than 6 characters");
    }
    if (!RegExp(emailRegex).hasMatch(email)) {
      return sink.addError("Please enter valid email address");
    }

    return sink.add(email);
  });

  var passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (String password, sink) {
      if (password.isEmpty) {
        return sink.addError("This Field can't be empty.");
      }
      if (password.length < 8) {
        return sink.addError("Password can't be less than 6 characters");
      }
      if (!RegExp(passwordRegex).hasMatch(password)) {
        return sink.addError("Please enter valid password");
      }
      return sink.add(password);
    },
  );

  var nameValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (String name, sink) {
      if (name.isEmpty) {
        return sink.addError("This Field can't be empty.");
      }
      if (name.length > 64) {
        return sink.addError("Name can't be more than 64 characters");
      }
      if (name.length < 3) {
        return sink.addError("Name can't be less than 3 characters");
      }
      if (!RegExp(nameRegex).hasMatch(name)) {
        return sink.addError("Please enter valid name");
      }
      return sink.add(name);
    },
  );

  var userNameValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (String name, sink) {
      if (name.isEmpty) {
        return sink.addError("This Field can't be empty.");
      }
      if (name.length > 20) {
        return sink.addError("Username can't be more than 20 characters");
      }
      if (name.length < 8) {
        return sink.addError("Username can't be less than 8 characters");
      }
      if (!RegExp(userNameRegex).hasMatch(name)) {
        return sink.addError("Please enter valid user name");
      }
      return sink.add(name);
    },
  );
}
