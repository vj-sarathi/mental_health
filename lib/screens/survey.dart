import 'package:flutter/material.dart';
import 'package:mental_health_tracker/model/questions.dart';
import 'package:mental_health_tracker/screens/main_login.dart';
import 'package:provider/provider.dart';

import '../provider/google_signing_provider.dart';
import '../utils/utils.dart';
import 'nav_screen.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage({Key? key}) : super(key: key);

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  bool _visibility = false;
  int _questionNumber = 0;
  int _totalCounts = 0;
  Color _dynamicColor = const Color(0xFF2979FF);

/*  void toggleSwitch(bool isSelected, int index) {
    if(dummyList[index].isSelected == true) {
      setState(() {
        dummyList[index].isSelected = false;
      });
    } else {
      setState(() {
        dummyList[index].isSelected = true;
      });
    }
  }*/

  void _changeColor(int position) {
    _dynamicColor = const Color(0xFFFF7043);
  }

  void _nextQuestion(int position) {
    if (dummyList[_questionNumber].answersItemModel[position].isCorrectAnswer ==
        true) {
      if (_totalCounts < 10) {
        _totalCounts += 1;
      }
    }

    if (_questionNumber < 9) {
      setState(() {
        _questionNumber += 1;
      });
    } else if (_questionNumber == 9) {
      setState(() {
        _visibility = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    List<QuestionsItemModel> dummyModelList = dummyList;

    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Survey",
              style: textStyle.copyWith(fontSize: 18),
            ),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.blueAccent),
                    child: Center(
                        child: Text(
                      dummyModelList[_questionNumber].question,
                      style: textStyle,
                    )),
                  ),
                  GestureDetector(
                    onTap: () {
                      _changeColor(0);
                      _nextQuestion(0);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.blueAccent),
                      child: Center(
                        child: Text(
                          dummyModelList[_questionNumber]
                              .answersItemModel[0]
                              .answerText,
                          style: textStyle,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _changeColor(1);
                      _nextQuestion(1);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.blueAccent),
                      child: Center(
                        child: Text(
                          dummyModelList[_questionNumber]
                              .answersItemModel[1]
                              .answerText,
                          style: textStyle,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _changeColor(2);
                      _nextQuestion(2);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.blueAccent),
                      child: Center(
                        child: Text(
                          dummyModelList[_questionNumber]
                              .answersItemModel[2]
                              .answerText,
                          style: textStyle,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _changeColor(3);
                      _nextQuestion(3);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.blueAccent),
                      child: Center(
                        child: Text(
                          dummyModelList[_questionNumber]
                              .answersItemModel[3]
                              .answerText,
                          style: textStyle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            /* Visibility(
              visible: _visibility,
              child: FloatingActionButton.large(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(),
                        settings: RouteSettings(arguments: _totalCounts)),
                  );
                },
                child: Text("Next", style: textStyle,),
                backgroundColor: Colors.grey,
              ),
            ),*/
            Visibility(
              visible: _visibility,
              child: GestureDetector(
                onTap: () {
                  provider.totalCounts = _totalCounts;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NavScreen(),
                        settings:
                            RouteSettings(arguments: provider.totalCounts)),
                  );
                },
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  child: Center(
                    child: Text(
                      "Next",
                      style: textStyle.copyWith(fontSize: 24),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                "${_questionNumber + 1}/10",
                style: textStyle.copyWith(color: Colors.black45),
              ),
            )
          ],
        ));
  }
}
