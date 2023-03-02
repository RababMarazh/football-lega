import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iraqligaapp/components/colors.dart';
import 'package:iraqligaapp/components/component.dart';
import 'package:iraqligaapp/cubit/cubit.dart';
import 'package:iraqligaapp/cubit/states.dart';
import 'package:iraqligaapp/modules/matches_model.dart';

class Result_Screen extends StatelessWidget {
  const Result_Screen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:
         BlocConsumer<MainCubit,MainStates>(
           listener: (context,state){},
           builder: (context,state){
         return         
         
           Column(
            children: [
            
              Expanded(
                
                child: Container(
                  width: double.infinity,
                  decoration:containerDecoration,
                    child: Column(children: [
                      const Text('نتائج المباريات',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        fontFamily: 'Jannah',
                        color: Colors.black),),
                     const SizedBox(height: 30,),
                     Container(
                       height: 20,
                       width: 100,
                       color: Colors.blue,
                     ),
                       
                      const SizedBox(height: 20,),
              
                       Expanded(
                         child: ListView.separated(
                           shrinkWrap: true,
                           physics: const NeverScrollableScrollPhysics(),
                           itemBuilder:(context,index)=> MatchDesign(MainCubit.get(context).results[index], context) ,
                            separatorBuilder:  (context,index)=>Padding(
                              padding: const EdgeInsets.all(40.0),
                              child: Container(
                              height: 2,
                              
                              color: Color.fromARGB(95, 139, 132, 132),
                              ),
                            ),
                             itemCount: MainCubit.get(context).results.length,
                             ),
                       ),
              
                    ],
                    ),
                    ),
                ),
                
             ]);
            //fallback: (context)=>const Center(child: CircularProgressIndicator(),),
     
         
           },
      ),
      );
             
  }
}