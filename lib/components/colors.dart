import 'package:flutter/material.dart';

const defaultColor=Colors.green;
Widget myDivider()=> Padding(

           padding:  EdgeInsetsDirectional.only(start: 20.0),
           child: Container(
             width: double.infinity,
             height: 1.0,
             color: Colors.grey[300],
    
           ),
);
const containerDecoration=   BoxDecoration(
  color: Colors.white
  
                //    gradient: LinearGradient( 
                //       begin: Alignment.topCenter,
                //       end: Alignment.bottomCenter,
                //      colors:
                //     [
                //   Color.fromARGB(255, 148, 13, 3),
                //   Colors.white,
                //   Color.fromARGB(255, 15, 15, 15),
                // ], 
                // )
                );
               const appBarColor=Color.fromARGB(255, 148, 13, 3);
               const textStyle=TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 12);
               const textStyleStanding=TextStyle(fontWeight: FontWeight.bold, fontSize: 14,fontFamily: 'Jannah');     
               const resultTextStyle= TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'Jannah');          