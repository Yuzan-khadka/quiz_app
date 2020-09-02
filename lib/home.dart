import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/quizpage.dart';
import 'package:quiz_app/uimodel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text(
            'QuizApp',
            style: TextStyle(
              fontFamily: 'Quando',
            ),
          ),
        ),
        body: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: models.length,
            itemBuilder: (context, index) {
              Model model = models[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (_) => QuizPage(jsonData: model),
                    ));
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 290,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Positioned(
                            bottom: 5,
                            child: Padding(
                              padding: MediaQuery.of(context).padding,
                              child: Container(
                                height: 190.0,
                                width: 320,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Colors.indigo[300],
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 6.0,
                                          offset: Offset(0.0, 5.0))
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        model.title,
                                        style: TextStyle(
                                          fontSize: 25.0,
                                          fontFamily: 'Alike-Regular',
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        model.description,
                                        style: TextStyle(
                                            fontSize: 11.0,
                                            color: Colors.white),
                                        textAlign: TextAlign.justify,
                                        maxLines: 6,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(80),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(0.0, 5.0),
                                      blurRadius: 6.0)
                                ]),
                            child: CircleAvatar(
                                radius: 80,
                                backgroundImage: AssetImage(model.imageUrl)),
                          ),
                        ],
                      )),
                ),
              );
            }));
  }
}
