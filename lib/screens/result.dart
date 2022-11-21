import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health_tracker/screens/main_login.dart';
import 'package:mental_health_tracker/screens/survey.dart';
import 'package:mental_health_tracker/utils/utils.dart';
import 'package:provider/provider.dart';

import '../provider/google_signing_provider.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    // final count = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MainLogin(onClickSignUp: () {})),
                  (route) => false);
            },
          )
        ],
        backgroundColor: Colors.blueAccent.shade200,
        title: Center(child: Text("Result")),
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SurveyPage(),
              ),
            );
          },
        ),
      ),
      body: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.blueAccent.shade200,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: provider.totalCounts > 5
              ? Text(
                  "Hi, ${user?.displayName == null ? 'User' : user?.displayName.toString()}\n Your health condition is Poor",
                  style: GoogleFonts.anton(
                    textStyle: textStyle.copyWith(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ))
              : Text(
                  "Hi, ${user?.displayName == null ? 'User' : user?.displayName.toString()}\n Your health condition is Good",
                  style: GoogleFonts.poppins(
                    textStyle: textStyle.copyWith(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ))
          ),
    );
  }
}
