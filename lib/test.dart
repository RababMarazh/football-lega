import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iraqligaapp/cubit/ligacubit.dart';
import 'package:iraqligaapp/cubit/ligastates.dart';
import 'package:iraqligaapp/screens/all_arounds.dart';


class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required title}) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ExpansionTile Collapse',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: BlocConsumer<LigaCubit,LigaStates>(
        builder: (context, states){
          return Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
            ListView.builder(
              key: Key('builder ${LigaCubit.get(context).BuilderKey.toString()}'), //attention
              padding: EdgeInsets.only(left: 13.0, right: 13.0, bottom: 25.0),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Column(children: <Widget>[
                  Divider(
                    height: 17.0,
                    color: Colors.white,
                  ),
                  ExpansionTile(
                    key: Key(index.toString()), //attention
                    initiallyExpanded: index == LigaCubit.get(context).BuilderKey, //attention

                    leading: Icon(
                      Icons.person,
                      size: 50.0,
                      color: Colors.black,
                    ),
                    title: Text('ExpansionTile ${index}',
                        style: TextStyle(
                            color: Color(0xFF09216B),
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold)),
                    subtitle: Text(
                      'Software Engineer',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold),
                    ),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(25.0),
                        child: Text(
                          'DETAİL ${index} \n' + 'Expanded',
                        ),
                      )
                    ],
                    onExpansionChanged: (newState) {
                      if (newState)
                        
                        {
                          print('------index------');
                          print(index);
                          print('-=====builder before=====-');

                          print(LigaCubit.get(context).BuilderKey);
                      
                          LigaCubit.get(context).ExpandedStatus(index);
                          print('------builder after------');

                          print(LigaCubit.get(context).BuilderKey);
                        }
                      else
                        {
                         LigaCubit.get(context).CollapsedStatus();
                         print('------++builder collapsed++------');
                         print(LigaCubit.get(context).BuilderKey);
                         print('------+++------');
                        }
                    },
                  ),
                ]);
              },
            )
          ]),
        ),
      );
    
        }, 
      listener: (context,states){

      }
      ),
      );
  }
}