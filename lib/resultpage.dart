import 'package:flutter/material.dart';
import 'package:quiz_app/home.dart';

class ResultPage extends StatefulWidget {
  final int marks;
  ResultPage({this.marks});
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  List<String> image = [
    'assets/images/success.png',
    'assets/images/good.png',
    'assets/images/bad.png',
  ];

  String message;
  String imageUrl;

  @override
  void initState() {
    if (widget.marks < 20) {
      imageUrl = image[2];
      message =
          'You should try hard!!\n  You have scored ${widget.marks} points';
    } else if (widget.marks < 35) {
      imageUrl = image[1];
      message = 'You can do better!!\n  You have scored ${widget.marks} points';
    } else {
      imageUrl = image[0];
      message = 'Congratulations!!\n  You have scored ${widget.marks} points';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: Material(
              elevation: 5.0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                      width: 300.0,
                      height: 300.0,
                      child: Image(
                        image: AssetImage(imageUrl),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      message,
                      style: TextStyle(fontSize: 18.0, fontFamily: 'Quando'),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlineButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                    },
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    borderSide: BorderSide(
                      color: Colors.indigo[300],
                      width: 3.0,
                    ),
                    splashColor: Colors.indigo,
                    highlightColor: Colors.indigo,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
