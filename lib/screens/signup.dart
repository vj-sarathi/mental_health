import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../utils/utils.dart';

class SignUpPage extends StatefulWidget {
  final VoidCallback onClickSignUp;

  const SignUpPage({Key? key, required this.onClickSignUp}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
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
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      'https://media.istockphoto.com/id/1156178759/vector/human-head-and-brain-creation-and-idea-concept.jpg?s=1024x1024&w=is&k=20&c=GT94ABVFV7mZm02Ex-tM1xUyJBKn-tSSJBl7uTtf0xA=',
                    ),
                    fit: BoxFit.cover
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                TextFormField(
                    controller: _emailController,
                    cursorColor: Colors.blueAccent,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        labelText: 'E-mail',
                      filled: true,
                      contentPadding: EdgeInsets.all(20),
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                   /* validator: (email) =>
                        email != null && EmailValidator.validate(email)
                            ? 'Enter a valid email'
                            : null*/
                ),
                SizedBox(height: 10),
                TextFormField(
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => value != null && value.length < 6
                      ? 'Enter min 6 characters'
                      : null,
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: signUp,
                  icon: Icon(Icons.lock_open),
                  label: Text('Sign Up'),
                ),
                SizedBox(height: 20),
                RichText(
                    text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        text: "Already have an account?  ",
                        children: [
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = widget.onClickSignUp,
                          text: 'Sign In',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                          )),
                    ]))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signUp() async {

    UserCredential? userCredential = null;

    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));

    try {
      userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());

      print("_emailController :::: ${_emailController.text}");
      print("_passwordController :::: ${_passwordController.text}");
    } on FirebaseAuthException catch (e) {
      print(e);
      Navigator.of(context).popUntil((route) => route.isFirst);

      Utils.showSnackbar(e.message);
    }


   /* Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainPage(),
      ),
    );*/

    // Navigator.of(context).popUntil((route) => route.isFirst);
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
