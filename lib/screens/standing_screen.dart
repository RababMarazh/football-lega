import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iraqligaapp/components/colors.dart';
import '../components/component.dart';
import '../cubit/ligacubit.dart';
import '../cubit/ligastates.dart';

class StandingScreen extends StatelessWidget {
  const StandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LigaCubit, LigaStates>(
        listener: (context, state) {
          
         },
        builder: (context, state) {
          return Scaffold(
            body: FutureBuilder(
              builder: (context, state) {
               return Container(
                height: double.infinity,
                width: double.infinity,
                decoration: containerDecoration,
                child: Column(
                  children: [
                    Row(
                      children: const [
                        SizedBox(
                          width: 170,
                        ),
                        Expanded(
                            child: Text(
                          'ل',
                          style: textStyle,
                        )),
                        Expanded(child: Text('ف', style: textStyle)),
                        Expanded(child: Text('ت', style: textStyle)),
                        Expanded(child: Text('خ', style: textStyle)),
                        Expanded(child: Text('له', style: textStyle)),
                        Expanded(child: Text('ع', style: textStyle)),
                        Expanded(child: Text('ن', style: textStyle)),
                      ],
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index)=> StandingDesign(LigaCubit.get(context).standing[index], context),
                           
                        separatorBuilder: (context, index) => SizedBox( height: 1, ),
                        itemCount: LigaCubit.get(context).standing.length,
                      ),
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      color: Color.fromARGB(7, 65, 47, 47),
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          Container(
                            height: 15,
                            width: 15,
                            color: Colors.green,),
                          const SizedBox(width: 5,),
                          const Text('آبطال آسيا', style: textStyle),
                          const SizedBox(width: 10),
                          Container(height: 15, width: 15, color: Colors.blue),
                          const SizedBox(width: 5,),
                          const Text('كأس الاتحاد الاسيوي', style: textStyle),
                          const SizedBox(width: 15),
                           Container(height: 15, width: 15, color: Colors.red),
                          const SizedBox(width: 5),
                          const Text('هبوط للدرجة الثانية', style: textStyle),
                        ],
                      ),
                    ),
                    const SizedBox( height: 30,)
                  ],
                ),
              );
            }),
          );
        },
      );
    
  }
}

