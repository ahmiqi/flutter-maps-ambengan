// ignore_for_file: null_check_always_fails

import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:map/Page/home_page.dart';

const users = const {
  'rifqi@gmail.com': 'rifqi',
  'ari@gmail.com': 'ari',
  'dewayana@gmail.com': 'dewa',
  'shintia@gmail.com': 'shintia',
  'sagita@gmail.com': 'sagita',
};

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 1000);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return null!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      //   title: 'Real Estate',
      logo: AssetImage(
        'assets/logo.png',
      ),
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomePage(
            String: String,
          ),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
