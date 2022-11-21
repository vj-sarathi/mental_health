import 'package:flutter/material.dart';
import 'package:mental_health_tracker/screens/main_login.dart';
import 'package:mental_health_tracker/screens/signup.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLoggedIn = true;

  @override
  Widget build(BuildContext context) => isLoggedIn
      ? MainLogin(
          onClickSignUp: toggle,
        )
      : SignUpPage(
          onClickSignUp: toggle,
        );

  void toggle() => setState(() => isLoggedIn = !isLoggedIn);
}
