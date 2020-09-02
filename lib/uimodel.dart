import 'dart:convert';

class Model {
  String imageUrl;
  String title;
  String description;
  String json;

  Model({this.imageUrl, this.description, this.title, this.json});
}

List<Model> models = [
  Model(
    imageUrl: 'assets/images/py.png',
    title: 'Python',
    description:
        'Python is an interpreted, object-oriented, high-level programming language with dynamic semantics. Its high-level built in data structures, combined with dynamic typing and dynamic binding, make it very attractive for Rapid Application Development, as well as for use as a scripting or glue language to connect existing components together.',
    json: 'assets/json/python.json',
  ),
  Model(
    imageUrl: 'assets/images/java.png',
    title: 'Java',
    description:
        'Java is a high-level programming language developed by Sun Microsystems. It was originally designed for developing programs for set-top boxes and handheld devices, but later became a popular choice for creating web applications. ',
    json: 'assets/json/java.json',
  ),
  Model(
    imageUrl: 'assets/images/js.png',
    title: 'JavaScript',
    description:
        'JavaScript is a dynamic computer programming language. It is lightweight and most commonly used as a part of web pages, whose implementations allow client-side script to interact with the user and make dynamic pages. It is an interpreted programming language with object-oriented capabilities.',
    json: 'assets/json/js.json',
  ),
  Model(
    imageUrl: 'assets/images/cpp.png',
    title: 'C++',
    description:
        'C++ is an object oriented computer language created by notable computer scientist Bjorne Stroustrop as part of the evolution of the C family of languages. Some call C++ “C with classes” because it introduces object oriented programming principles, including the use of defined classes, to the C programming language framework.',
    json: 'assets/json/cpp.json',
  ),
];
