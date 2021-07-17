import 'package:bmi_app/src/constants.dart';
import 'package:flutter/material.dart';
import 'pages/input_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My BMI App',
      theme: ThemeData(
        scaffoldBackgroundColor: kcolorBackground,
        hoverColor: Colors.teal[700],
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w400,
            fontFamily: "Poppins",
          ),
        )
      ),
      home: InputPage(),
    );
  }
}