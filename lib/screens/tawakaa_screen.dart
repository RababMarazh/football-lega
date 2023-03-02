import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iraqligaapp/components/component.dart';
import 'package:iraqligaapp/cubit/ligacubit.dart';

import '../components/colors.dart';
import '../cubit/ligastates.dart';
import '../modules/matches_model.dart';

class Tawakaa_Screen extends StatelessWidget {
  
  var textcontroller1=TextEditingController();
var textcontroller2=TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    
    
    return BlocConsumer<LigaCubit, LigaStates>(
      listener: (context,state){},
      builder: (context,state){
      return   FutureBuilder(
          future: FirebaseFirestore.instance.collection('matches1').get(),
          builder: (context,snapshot){
            return ExpDesign(
              MatchesModel(), 
              context, 
              controller1: textcontroller1, 
              controller2: textcontroller2, 
              function: (){}
              );
           
          },
         );
         },
    );
  }
}