import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iraqligaapp/cubit/ligacubit.dart';
import 'package:iraqligaapp/shared/icon_broken.dart';

import '../components/component.dart';
import '../cubit/ligastates.dart';
import 'container_curve.dart';

// ignore: camel_case_types
 int selected=1;


class All_Rounds extends StatelessWidget {
  const All_Rounds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<LigaCubit, LigaStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Stack(
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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'جدول المباريات والنتائج',
                    style: TextStyle(
                        fontFamily: 'Jannah',
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            ListView.builder(
                              key: Key('builder ${LigaCubit.get(context).BuilderKey.toString()}'),
                              
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context,index){
                                return 
                                Expansion(context: context, 
                                round: "round${index+1}", 
                                title: "الجــــــولـــة ${index+1}",
                                 index1: index,
                                
                                );
                                
                              },
                              itemCount: 38,
                              ),


                            // Expansion(
                            //     context: context,
                            //     round: 'round1',
                            //     title: 'الجــــــولـــة ١'),
                            // Expansion(
                            //     context: context,
                            //     round: 'round2',
                            //     title: 'الجــــــولـــة ٢'),
                            // Expansion(
                            //     context: context,
                            //     round: 'round3',
                            //     title: 'الجــــــولـــة ٣'),
                            // Expansion(
                            //     context: context,
                            //     round: 'round4',
                            //     title: 'الجــــــولـــة ٤'),
                            // Expansion(
                            //     context: context,
                            //     round: 'round5',
                            //     title: 'الجــــــولـــة ٥'),
                            // Expansion(
                            //     context: context,
                            //     round: 'round6',
                            //     title: 'الجــــــولـــة ٦'),
                            // Expansion(
                            //     context: context,
                            //     round: 'round7',
                            //     title: 'الجــــــولـــة ٧'),
                            // Expansion(
                            //     context: context,
                            //     round: 'round8',
                            //     title: 'الجــــــولـــة ٨'),
                            // Expansion(
                            //     context: context,
                            //     round: 'round9',
                            //     title: 'الجــــــولـــة ٩'),
                            // Expansion(
                            //     context: context,
                            //     round: 'round10',
                            //     title: 'الجــــــولـــة ١٠'),
                            // Expansion(
                            //     context: context,
                            //     round: 'round11',
                            //     title: 'الجــــــولـــة ١١'),
                            // Expansion(
                            //     context: context,
                            //     round: 'round12',
                            //     title: 'الجــــــولـــة ١٢'),
                            
                            // RoundCard(
                            //   function: 'round1',
                            //   round: 'الجــــــولـــة ١',
                            //   widget: ListView.builder(
                            //       physics: NeverScrollableScrollPhysics(),
                            //       scrollDirection: Axis.vertical,
                            //       reverse: true,
                            //       shrinkWrap: true,
                            //       itemCount: 10,
                            //       itemBuilder: (context, index) {
                            //         return  MatchDesign(
                            //             LigaCubit.get(context).matches1[index],
                            //             context);
                            //       }),
                            // ),
                            // const SizedBox(
                            //   height: 5,
                            // ),
                            // RoundCard(
                            //   function: ('round2'),
                            //   round: 'الجــــــولـــة ٢',
                            //   widget: ListView.builder(
                            //       physics: NeverScrollableScrollPhysics(),
                            //       scrollDirection: Axis.vertical,
                            //       shrinkWrap: true,
                            //       itemCount: 10,
                            //       itemBuilder: (context, index)   {
                            //         return MatchDesign (
                            //              LigaCubit.get(context).matches1[index],
                            //             context);
                            //       }),
                            // ),
                            // const SizedBox(
                            //   height: 5,
                            // ),
                            //  ExpansionTile(
                            //   onExpansionChanged:(value) async{
                            //     value? LigaCubit.get(context).getMatch(round: "round6"):print("${LigaCubit.get(context).matches1[0].team1}");
                            //     value=isExpanded;
                            //   } ,
                            //   title:Text( "Test"),
                            //   backgroundColor: Colors.amber,
                            //   children: [
                            //    ListView.builder(
                            //       physics: NeverScrollableScrollPhysics(),
                            //       scrollDirection: Axis.vertical,
                            //       shrinkWrap: true,
                            //       itemCount: 10,
                            //       itemBuilder: (context, index) {
                            //         return MatchDesign(LigaCubit.get(context).matches1[index],
                            //             context);
                            //       }),
                            //       ],

                            //   ),

                            // RoundCard(roundtext: 'الــــجولة ٢'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ٣'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ٤'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ٥'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ٦'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ٧'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ٨'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ٩'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ١٠'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ١١'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ١٢'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ١٣'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ١٤'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ١٥'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ١٦'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ١٧'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ١٨'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ١٩'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ٢٠'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ٢١'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ٢٢'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ٢٣'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ٢٤'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ٢٥'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ٢٦'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ٢٧'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ٢٨'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ٢٩'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ٣٠'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ٣١'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ٣٢'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ٣٣'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ٣٤'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ٣٥'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ٣٦'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ٣٧'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // RoundCard(roundtext: 'الــــجولة ٣٨'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
