
import 'package:bmi_app/src/constants.dart';
import 'package:bmi_app/src/custom_widgets.dart';
import 'package:flutter/material.dart';

import 'input_page.dart';

class ResultPage extends StatelessWidget {

  final String bmiResult;
  final String bmiStatus;
  final String bmiMessage;
  final Color bmiMessageColor;
  final Icon bmiIcon;

  ResultPage({required this.bmiResult, required this.bmiStatus, required this.bmiMessage, required this.bmiMessageColor, required this.bmiIcon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My BMI App"),
        backgroundColor: kcolorBackground,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Text("Your result",
                style: ktitleResult,),
              alignment: Alignment.bottomLeft,
            ),
          ),
          Expanded(
            flex: 5,
            child: ContenedorChido(
              color: kcolorContainer,
              contenido: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(bmiStatus, style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: bmiMessageColor,
                    fontFamily: "Poppins")
                  ),

                  bmiIcon,

                  Text(bmiResult,style: kresult,),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(bmiMessage, style: kmessageResult, textAlign: TextAlign.center,),
                  ),

                ],
              ),
            )
          ),

          Container(
              color: Colors.teal[500],
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 80,
              child: MaterialButton(
                onPressed: (){
                  print("pressed");
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => InputPage()),
                  );
                },
                child: Text("Recalculate", style: kbuttonStyle,),
              ),
            ),
        ],
      ),
    );
  }
}