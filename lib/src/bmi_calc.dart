import 'package:flutter/material.dart';
import 'dart:math';

class CalculateBMI {

  final heightResult;
  final weightResult;

  CalculateBMI({this.heightResult, this.weightResult});

  double _bmi = 0;

  String bmiResult(){
    _bmi = weightResult / (pow(heightResult/100, 2));
    return _bmi.toStringAsFixed(1);
  }

  String bmiStatus(){
    if(_bmi >= 35){
      return "Extremely Obese";
    }
    else if(_bmi >= 30 && _bmi <= 34.9){
      return "Obese";
    }
    else if(_bmi >= 25 && _bmi <= 29.9){
      return "Overweight";
    }
    else if(_bmi >= 18.5 && _bmi <= 24.9){
      return "Normal";
    }
    else{
      return "Underweight";
    }
  }

  String bmiMessage(){
    if(_bmi >= 35){
      return "You must lost weight for your health and for everyone you care!";
    }
    else if(_bmi >= 30 && _bmi <= 34.9){
      return "You should lost weight for your health!";
    }
    else if(_bmi >= 25 && _bmi <= 29.9){
      return "It's not bad, if that weight is muscle!";
    }
    else if(_bmi >= 18.5 && _bmi <= 24.9){
      return "You're in a normal range, you don't have to worry if you feel great!";
    }
    else{
      return "Time to eat and put some muscle on there!";
    }
  }

  Color bmiMessageColor(){
    if(_bmi >= 35){
      return Colors.redAccent;
    }
    else if(_bmi >= 30 && _bmi <= 34.9){
      return Colors.deepOrangeAccent;
    }
    else if(_bmi >= 25 && _bmi <= 29.9){
      return Colors.amberAccent;
    }
    else if(_bmi >= 18.5 && _bmi <= 24.9){
      return Colors.tealAccent;
    }
    else{
      return Colors.lightBlueAccent;
    }
  }

  Icon bmiIcon(){
    if(_bmi >= 35){
      return Icon(Icons.sick_outlined, color: Colors.redAccent[100], size: 100,);
    }
    else if(_bmi >= 30 && _bmi <= 34.9){
      return Icon(Icons.sentiment_very_dissatisfied_outlined, color: Colors.deepOrangeAccent[100], size: 100,);
    }
    else if(_bmi >= 25 && _bmi <= 29.9){
      return Icon(Icons.sentiment_neutral_outlined, color: Colors.amberAccent[100], size: 100,);
    }
    else if(_bmi >= 18.5 && _bmi <= 24.9){
      return Icon(Icons.sentiment_very_satisfied_outlined, color: Colors.tealAccent[100], size: 100,);
    }
    else{
      return Icon(Icons.sick_outlined, color: Colors.lightBlueAccent[100], size: 100,);
    }
  }
}