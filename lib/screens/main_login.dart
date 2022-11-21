import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health_tracker/provider/google_signing_provider.dart';
import 'package:mental_health_tracker/screens/survey.dart';
import 'package:mental_health_tracker/utils/utils.dart';
import 'package:provider/provider.dart';

class MainLogin extends StatefulWidget {
  final VoidCallback onClickSignUp;

  const MainLogin({Key? key, required this.onClickSignUp}) : super(key: key);

  @override
  State<MainLogin> createState() => _MainLoginState();
}

class _MainLoginState extends State<MainLogin> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    'https://media.istockphoto.com/id/1156178759/vector/human-head-and-brain-creation-and-idea-concept.jpg?s=1024x1024&w=is&k=20&c=GT94ABVFV7mZm02Ex-tM1xUyJBKn-tSSJBl7uTtf0xA=',
                  ),
                  fit: BoxFit.cover
              )),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.white
                ),
                child: Text(
                  "Mental Health Tracker",
                  style: GoogleFonts.poppins(
                      textStyle: textStyle.copyWith(
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                          fontSize: 23)),
                ),
              ),
              SizedBox(height: 30),
              TextField(
                controller: _emailController,
                cursorColor: Colors.blueAccent,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'E-mail',
                  contentPadding: EdgeInsets.all(20),
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  contentPadding: EdgeInsets.all(20),
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: signIn,
                icon: Icon(Icons.arrow_forward),
                label: Text('Sign in'),
              ),
              SizedBox(height: 20),
              RichText(
                  text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      text: "Not having an account?  ",
                      children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = widget.onClickSignUp,
                        text: 'Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          color: Colors.blue,
                        )),
                  ])),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  final provider = Provider.of<GoogleSignInProvider>(context,
                      listen: false);
                  provider.googleLogin();

                  if (provider.user != null) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SurveyPage(),
                      ),
                    );
                  } else {
                    provider.googleLogin();
                  }
                },
                child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Text(
                    "Login with Google",
                    style: textStyle,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    UserCredential? userCredential = null;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));

    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      Navigator.of(context).popUntil((route) => route.isFirst);
      /* navigatorKey.currentState!.popUntil((route) => route.isFirst);
      Navigator.of(context, rootNavigator: true).pop();*/

      Utils.showSnackbar(e.message);
    }

    if (userCredential == null) return;

    /* Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SurveyPage(),
      ),
    );*/

    Navigator.of(context).popUntil((route) => route.isFirst);
    // Navigator.of(context, rootNavigator: true).pop();
    // navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
