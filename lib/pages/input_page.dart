import 'package:bmi_app/pages/result_page.dart';
import 'package:bmi_app/src/constants.dart';
import 'package:bmi_app/src/custom_widgets.dart';
import 'package:bmi_app/src/bmi_calc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Genero{masculino, femenino, sinGenero}
enum BotonStatus{activo, inactivo}

class _InputPageState extends State<InputPage> {

  Genero generoSeleccionado = Genero.sinGenero;
  Color masculinocolor = kcolorContainer;
  Color femeninocolor = kcolorContainer;

  BotonStatus botonEstado = BotonStatus.inactivo;
  String buttonText = "Select your gender";

  int height = 175;
  int weight = 76;
  int age = 19;

  void weightVerify(){
    if(weight < 20){
      weight = 20;
    }
  }

  void ageVerify(){
    if(age < 10){
      age = 10;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("My BMI App")),
        backgroundColor: kcolorBackground,
      ),

      body: Column(
        children: [

          //GENDER
          Expanded(
            child: Row(
              children:  <Widget> [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        generoSeleccionado = Genero.masculino;
                        botonEstado = BotonStatus.activo;
                        buttonText = "Calculate";
                      });
                    },
                    child: ContenedorChido(
                      color: generoSeleccionado == Genero.masculino ? kcolorActive : kcolorContainer,
                      contenido: IconChido(
                        icono: FontAwesomeIcons.mars,
                        texto: "MALE",
                      ),
                    ),
                  )
                ),

                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        generoSeleccionado = Genero.femenino;
                        botonEstado = BotonStatus.activo;
                        buttonText = "Calculate";
                      });
                    },
                    child: ContenedorChido(
                      color: generoSeleccionado == Genero.femenino ? kcolorActive : kcolorContainer,
                      contenido: IconChido(
                        icono: FontAwesomeIcons.venus,
                        texto: "FEMALE",
                      ),
                    ),
                  )
                ),

              ],
            )
          ),

          //HEIGHT
          Expanded(
            child: ContenedorChido(
              color: kcolorContainer,
              contenido: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("HEIGHT", style: ktitleTag,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text("$height", style: kinfoTag),
                        SizedBox(width: 2,),
                        Text("cm", style: kinfoSubtitleTag),
                      ],
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                        activeTrackColor: Colors.teal[700],
                        inactiveTrackColor: Colors.teal[100],
                        trackShape: RectangularSliderTrackShape(),
                        trackHeight: 4.0,
                        thumbColor: Colors.tealAccent,
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                        overlayColor: Colors.red.withAlpha(32),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                      ),
                      child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      activeColor: kcolorActive,
                      inactiveColor: kcolorBackground,
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      }),
                    )
                  ],
                )
              ),
            )
          ),

          //WEIGHT AND AGE
          Expanded(
            child: Row(
              children:  <Widget> [

                //WEIGHT
                Expanded(
                  child: ContenedorChido(
                    color: kcolorContainer,
                    contenido: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("WEIGHT", style: ktitleTag,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text("$weight", style: kinfoTag),
                              SizedBox(width: 2,),
                              Text("kg", style: kinfoSubtitleTag),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BotonChido(
                                icono: Icon(Icons.remove_outlined, color: Colors.white),
                                funcion: (){
                                  setState(() {
                                    weight--;
                                    weightVerify();
                                  });
                                },
                              ),
                              SizedBox(width: 10,),
                              BotonChido(
                                icono: Icon(Icons.add_outlined, color: Colors.white),
                                funcion: (){
                                  setState(() {
                                    weight++;
                                    weightVerify();
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      )
                    ),
                  )
                ),

                //AGE
                Expanded(
                  child: ContenedorChido(
                    color: kcolorContainer,
                    contenido: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("AGE", style: ktitleTag,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text("$age", style: kinfoTag),
                              SizedBox(width: 2,),
                              Text("y", style: kinfoSubtitleTag),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BotonChido(
                                icono: Icon(Icons.remove_outlined, color: Colors.white),
                                funcion: (){
                                  setState(() {
                                    age--;
                                    ageVerify();
                                  });
                                },
                              ),
                              SizedBox(width: 10,),
                              BotonChido(
                                icono: Icon(Icons.add_outlined, color: Colors.white,),
                                funcion: (){
                                  setState(() {
                                    age++;
                                    ageVerify();
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      )
                    ),
                  )
                ),

              ],
            )
          ),

          //CALCULATE BUTTON
          Container(
            color: botonEstado == BotonStatus.activo ? kcolorActive : kcolorInactive,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: 80,
            child: MaterialButton(
              onPressed: (){
                if (generoSeleccionado == Genero.masculino || generoSeleccionado == Genero.femenino){
                  CalculateBMI calc = CalculateBMI(
                  weightResult: weight,
                  heightResult: height,
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultPage(
                    bmiResult: calc.bmiResult(),
                    bmiStatus: calc.bmiStatus(),
                    bmiMessageColor: calc.bmiMessageColor(),
                    bmiMessage: calc.bmiMessage(),
                    bmiIcon: calc.bmiIcon(),
                  )),
                );
                }
              },
              child: Text(buttonText, style: botonEstado == BotonStatus.activo ? kbuttonStyle : kbuttonStyleInactive,),
            ),
          ),

        ],
      )
    );
  }
}




