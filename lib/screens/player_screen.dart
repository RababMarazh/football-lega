import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iraqligaapp/components/colors.dart';
import 'package:iraqligaapp/components/component.dart';
import 'package:iraqligaapp/cubit/ligacubit.dart';
import 'package:iraqligaapp/cubit/ligastates.dart';
import '../modules/matches_model.dart';
import 'container_curve.dart';

class Player_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return BlocConsumer<LigaCubit, LigaStates>(
      listener: (context, state) async {},
      builder: (context, state) {
        var match = LigaCubit.get(context);
        return Scaffold(
          body: Stack(
            children: [
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
            
            ListView.builder(
              itemBuilder: (context, index) =>  
               Exp(
                 text2: 'تم',
                 context: context, 
                 round: 'round24', 
                 title: 'ادخل وتوقع نتيجة الجولة', 
                 index1: index
                 ),
                 itemCount: 1,
              ),
             
            ],
          ),
        );
      },
    );
  }
}


  //  Scaffold(
  //         body: LigaCubit.get(context).matches1.isNotEmpty?
  //         ListView .builder(
            
  //         itemBuilder:(context,index){
              
  //               return 
  //               ExpDesign(  
  //                 match.matches1[index], context,
  //                 controller1: TextEditingController(),
  //                  controller2: TextEditingController()
  //                  );
             
              
  //           },
  //        itemCount: 10
  //        )
  //        : CircularProgressIndicator()
  //       );

           
