import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iraqligaapp/components/component.dart';

import 'container_curve.dart';

class LineUp_Screen extends StatelessWidget {
  const LineUp_Screen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold( 
      
       body: Stack(
         children: 
         [
        //    Image.asset('images/soccer.png',
        //  fit: BoxFit.cover,),

                 
        // Container(decoration:const BoxDecoration(
        //   image:DecorationImage(image: Image.asset('pitch.png'),
        // fit: BoxFit.cover
        // )
        //      ),
          
        //   ),
              ClipPath(
                clipper: WaveClipperl(),
                child: Container(
                  color: Colors.black,
                  height: 500,
                ),
              ),
              ClipPath(
                clipper: WaveClipperl(),
                child: Container(
                  color: Colors.black,
                  height: 400,
                ),
              ),
              ClipPath(
                clipper: WaveClipperR(),
                child: Container(
                  color: Colors.red,
                  height: 400,
                ),
              ),
              ClipPath(
                clipper: WaveClipperR(),
                child: Container(
                  color: Colors.red,
                  height: 500,
                ),
              ),
        
                        
        Column(children:[SizedBox(height: 10,),
              Row(mainAxisAlignment: MainAxisAlignment.start,
                                      children:const [
                                        SizedBox(width: 10,),
                                        Text('اســم الفريــق',style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,color: Colors.black,
                                          ),),
                                        SizedBox(width: 30,),
                                        Text('الرصيـد',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black,
                                          ),)
                       
                                      ],
                                    ),
          const SizedBox(height: 10,),
        Row(mainAxisAlignment: MainAxisAlignment.center,
           children: [
             goalKeeperIcon(context),
             SizedBox(width: 5,),
             //player(context), 
           ],
         ),

        
        SizedBox(height: 20,),
      
        Row(
               children: [
              Expanded(child:playerIcon(context)),
              Expanded(child:playerIcon(context)),
              Expanded(child:playerIcon(context)),
              Expanded(child:playerIcon(context)),
              //Expanded(child:player(context)),
              
              
                        
               ],
             ),
        SizedBox(height: 20,),
      
        Row(
               children: [
              Expanded(child:playerIcon(context)),
              Expanded(child:playerIcon(context)),
              Expanded(child:playerIcon(context)),
              Expanded(child:playerIcon(context)),
             // Expanded(child:player(context)),
              
                        
               ],
             ),
      const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
               children: [
              playerIcon(context),
              const SizedBox(width:30 ),
              playerIcon(context),
              //Expanded(child:player(context)),
              
              
                        
               ],
             ),
             const SizedBox(height: 13,),
        Container(
           decoration:const BoxDecoration(gradient: 
    LinearGradient(
             begin: Alignment.topCenter,
             end: Alignment.bottomCenter,
           colors:[
           
           Colors.red,
           Colors.white,
           Colors.black
             
            ])),
          child: Column(
            children: [
              const SizedBox(height: 1,),
              Container(

               
                child: Row(      
                       children:[
                      Expanded(child:goalKeeperIcon(context)),
                      Expanded(child:playerIcon(context)),
                      Expanded(child:playerIcon(context)),   
                      Expanded(child:playerIcon(context)),     
                       ],
                     ),
              ),
            ],
          ),
        ),
      
       ],
        ),
      
      
        ],)
    );
  
  }
}

  
   
  

   
  

  

