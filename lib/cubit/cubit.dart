import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iraqligaapp/cubit/states.dart';
import 'package:iraqligaapp/modules/matches_model.dart';
import 'package:iraqligaapp/modules/user_model.dart';
import 'package:iraqligaapp/screens/all_arounds.dart';
import 'package:iraqligaapp/screens/matchesscreen.dart';
import 'package:iraqligaapp/screens/player_screen.dart';
import 'package:iraqligaapp/screens/verification.dart';
import 'package:iraqligaapp/screens/standing_screen.dart';
import 'package:iraqligaapp/screens/userscreen.dart';
import '../screens/lineup_screen.dart';
import '../screens/result_screen.dart';
import '../screens/tawakaa_screen.dart';


class MainCubit extends Cubit<MainStates> {
  MainCubit():super(SocialInitialStates());
  static MainCubit get(context)=>BlocProvider.of(context);
  late UserModel model;

void getUserData()
{
  emit(SocialGetUserLoadingStates());


}
int currentIndex=0;

List<Widget>Screens=[
  Player_Screen(),
  All_Rounds(),
  Tawakaa_Screen(),
  StandingScreen(),
  LineUp_Screen(),
  
];

List<Widget>titles=[
 Text('Home') ,
  Text('Chats'),
 Text('Users') ,
  Text('Settings'),
  Text('your Team'),
];

void ChangeBottomNav(int index){
  currentIndex =index;
  emit(SocialChangeBottomNavStates());
}




List<MatchesModel>results=[];

void getResult(){

FirebaseFirestore.instance
.collection('results')
.get()
.then((value) 
{
  emit(SocialResultSuccessStates());
  print(value);
  value.docs.forEach((element)
  {
    results.add(MatchesModel.fromJson(element.data()));
  });
  emit(SocialResultSuccessStates());
})
.catchError((error){
  emit(SocialResultErrorStates(error.toString()));
});
}

}