


import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iraqligaapp/cubit/ligacubit.dart';
import 'package:iraqligaapp/cubit/ligastates.dart';


import '../components/colors.dart';
import '../components/component.dart';

class MatchesScreen extends StatelessWidget  {
  const MatchesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var format = DateFormat.yMd('fr');
    final now = DateTime.now();
    final today = format.format(DateTime(now.year, now.month, now.day));
    final yesterday = format.format(DateTime(now.year, now.month, now.day - 1));
    final tomorrow = format.format(DateTime(now.year, now.month, now.day + 1));
    final byesterday =
        format.format(DateTime(now.year, now.month, now.day - 2));
    final atomorrow = format.format(DateTime(now.year, now.month, now.day + 2));
    print(today);
    return BlocConsumer<LigaCubit, LigaStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return DefaultTabController(
          length: 3,
          initialIndex: 1,
          
          child: Scaffold(
            appBar:const PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              
             
              child: Center( 
                child: TabBar(//controller: TabController(initialIndex: 2,vsync:this. ,length: 5),
                    indicatorWeight: 3,
                    isScrollable: true,
                    labelColor: Color.fromARGB(255, 3, 117, 7),
                    indicatorColor: Colors.green,
                    enableFeedback: true,
                    unselectedLabelColor: Colors.grey,
                    
                    
                    
                    tabs: [
                      //Text(atomorrow),
                      Tab(child: Text("امس", style: TextStyle(fontFamily: 'Jannah'),)),
                      Tab(child: Text("اليوم", style: TextStyle(fontFamily: 'Jannah'),)),
                      Tab(child: Text("غداً", style: TextStyle(fontFamily: 'Jannah'),)), 
                      ]),
              ),
            ),
            body: TabBarView(
              children: [
                Container(
                  decoration: containerDecoration,
                    child: ListView.builder(
                  itemBuilder: (context, index) {
                    if (yesterday == LigaCubit.get(context).matches1[index].date) {
                      return MatchDesign(
                          LigaCubit.get(context).matches1[index], context);
                    } else {
                      return Container(
                        height: 0.0,
                      );
                    }
                  },
                  itemCount: LigaCubit.get(context).matches1.length,
                )),
               
                Container(
                  decoration: containerDecoration,
                    child: ListView.builder(
                  itemBuilder: (context, index) {
                    if (today == LigaCubit.get(context).matches1[index].date) {
                      return MatchDesign(
                          LigaCubit.get(context).matches1[index], context);
                    } else {
                      return Container(
                        height: 0.0,
                      );
                    }
                  },
                  itemCount: LigaCubit.get(context).matches1.length,
                )),
                Container(
                  decoration: containerDecoration,
                    child: ListView.builder(
                  itemBuilder: (context, index) {
                    if (tomorrow == LigaCubit.get(context).matches1[index].date) {
                      return MatchDesign(
                          LigaCubit.get(context).matches1[index], context);
                    } else {
                      return Container(
                        height: 0.0,
                      );
                    }
                  },
                  itemCount: LigaCubit.get(context).matches1.length,
                )),
               
                ],
            ),
          ),
        );
      },
    );
  }
}
