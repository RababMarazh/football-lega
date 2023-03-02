import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iraqligaapp/components/colors.dart';
import 'package:iraqligaapp/cubit/states.dart';

import '../cubit/cubit.dart';

class Feeds_Screen extends StatelessWidget {
  const Feeds_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MainCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              backgroundColor: appBarColor,
              title: cubit.titles[cubit.currentIndex],
              centerTitle: false,
            ),
            body: cubit.Screens[cubit.currentIndex],
            bottomNavigationBar: CurvedNavigationBar(
                backgroundColor: Colors.white,
                animationCurve: Curves.linearToEaseOut,
                buttonBackgroundColor: Colors.green,
                
                color: Colors.black,
                animationDuration: Duration(milliseconds: 500),
                onTap: (index) {
                  cubit.ChangeBottomNav(index);
                },
                items: const <Widget>[
                  Icon(
                    Icons.feed,
                    size: 30,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.sports_soccer_rounded,
                    size: 30,
                    color: Colors.white
                  ),
                  Icon(
                    Icons.groups,
                    size: 30,
                    color: Colors.white
                  ),
                  Icon(
                    Icons.list_alt,
                    size: 30,
                    color: Colors.white
                  ),
                   Icon(
                    Icons.star_half,
                    size: 30,
                    color: Colors.white
                  ),
                  
                ]

         

                )
                
                );
      },
    );
  }
}
