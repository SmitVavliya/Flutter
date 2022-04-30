import 'dart:async';

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
      if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email)) {
        return sink.addError("please enter valid email address");
      }
      return sink.add(email);
    },
  );

  var passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (String password, sink) {
      if (password.isEmpty) {
        return sink.addError("This Field can't be empty.");
      }
      if (password.length < 8) {
        return sink.addError("Password can't be less than 6 characters");
      }
      if (!RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
          .hasMatch(password)) {
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
      if (name.length > 32) {
        return sink.addError("Email can't be more than 32 characters");
      }
      if (name.length < 3) {
        return sink.addError("Name can't be less than 6 characters");
      }
      if (!RegExp(
              r'^[a-zA-Z0-9](_(?!(\.|_))|\.(?!(_|\.))|[a-zA-Z0-9]){3,32}[a-zA-Z0-9]$')
          .hasMatch(name)) {
        return sink.addError("Please enter valid name");
      }
      return sink.add(name);
    },
  );

  var phoneValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (String phone, sink) {
      if (phone.isEmpty) {
        return sink.addError("This Field can't be empty.");
      }
      if (!RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(phone)) {
        return sink.addError("Please enter valid phone Number");
      }
      return sink.add(phone);
    },
  );
}
