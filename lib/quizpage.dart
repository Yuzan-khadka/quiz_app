import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/resultpage.dart';
import 'package:quiz_app/uimodel.dart';

class QuizPage extends StatelessWidget {
  final Model jsonData;
  QuizPage({this.jsonData});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(jsonData.json),
      builder: (context, snapshot) {
        var mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
          return Scaffold(
              body: Center(
            child: Text('Loading'),
          ));
        } else {
          return Quiz(mydata: mydata);
        }
      },
    );
  }
}

class Quiz extends StatefulWidget {
  var mydata;
  Quiz({this.mydata});
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Color ansColor = Colors.green;
  Color displayColor = Colors.indigo[300];
  Color wrongAnsColor = Colors.red;
  int marks = 0;
  int i = 1;
  int timer = 30;
  int showTimer = 30;
  bool cancelTimer = false;
  bool disableAnswer = false;

  Map<String, Color> btnColor = {
    'a': Colors.indigo[300],
    'b': Colors.indigo[300],
    'c': Colors.indigo[300],
    'd': Colors.indigo[300],
  };

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void startTimer() async {
    const sec = Duration(seconds: 1);
    Timer.periodic(sec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextQuestion();
        } else if (cancelTimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showTimer = int.parse(timer.toString());
      });
    });
  }

  void nextQuestion() {
    cancelTimer = false;
    timer = 30;
    setState(() {
      if (i < 10) {
        i++;
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ResultPage(marks: marks),
        ));
      }
      btnColor['a'] = Colors.indigo[300];
      btnColor['b'] = Colors.indigo[300];
      btnColor['c'] = Colors.indigo[300];
      btnColor['d'] = Colors.indigo[300];
      disableAnswer = false;
    });
    startTimer();
  }

  void checkAnswer(String k) {
    if (widget.mydata[2][i.toString()] == widget.mydata[1][i.toString()][k]) {
      marks += 5;
      displayColor = ansColor;
    } else {
      displayColor = wrongAnsColor;
    }
    setState(() {
      btnColor[k] = displayColor;
      cancelTimer = true;
      disableAnswer = true;
    });

    Timer(Duration(seconds: 2), nextQuestion);
  }

  Widget choiceButton(String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 15.0,
      ),
      child: MaterialButton(
        onPressed: () => disableAnswer == false ? checkAnswer(value) : null,
        child: Text(widget.mydata[1][i.toString()][value],
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Alike',
              fontSize: 16.0,
            )),
        color: btnColor[value],
        splashColor: Colors.indigo[800],
        highlightColor: Colors.indigo[800],
        minWidth: 200.0,
        height: 50,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return WillPopScope(
      onWillPop: () {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Quizstar'),
            content: Text('You can\'t go back at this stage '),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Ok'),
              )
            ],
          ),
        );
      },
      child: Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                    padding: EdgeInsets.all(20.0),
                    alignment: Alignment.center,
                    child: Text(
                      widget.mydata[0][i.toString()],
                      style: TextStyle(fontSize: 18.0, fontFamily: 'Quando'),
                    ))),
            Expanded(
              flex: 6,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    choiceButton('a'),
                    choiceButton('b'),
                    choiceButton('c'),
                    choiceButton('d'),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  color: Colors.teal,
                  child: Center(
                    child: Text(
                      showTimer.toString(),
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  )),
            )
          ],
        ),
      )),
    );
  }
}
