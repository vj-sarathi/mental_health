import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_tracker/screens/auth.dart';
import 'package:mental_health_tracker/screens/survey.dart';

import 'main_login.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError){
              return Center(
                child: Text('Something went wrong \nTry again later'),
              );
            } else if (snapshot.hasData) {
              return SurveyPage();
            } else {
              return AuthPage();
            }
          }
      ),
    );
  }
}


