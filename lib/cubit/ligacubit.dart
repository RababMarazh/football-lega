import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iraqligaapp/components/constant.dart';
import 'package:iraqligaapp/cubit/ligastates.dart';
import 'package:iraqligaapp/cubit/login_cubit.dart';
import 'package:iraqligaapp/cubit/register_cubit.dart';
import 'package:iraqligaapp/modules/StandingModel.dart';
import 'package:iraqligaapp/modules/expectionmodel.dart';
import 'package:iraqligaapp/modules/matches_model.dart';
import 'package:iraqligaapp/modules/testmodel.dart';
import 'package:iraqligaapp/modules/user_model.dart';
import 'package:iraqligaapp/screens/register_screen.dart';

class LigaCubit extends Cubit<LigaStates> {
  LigaCubit() : super(StandingInitialState());

  static LigaCubit get(context) => BlocProvider.of(context);

  List<StandingModel> standing = [];
  void getStanding() {
    emit(StandingLoadingState());
    FirebaseFirestore.instance.collection('standings').get().then((value) {
      //print(value);
      standing.clear();
      value.docs.forEach((element) {
        standing.add(StandingModel.fromJson(element.data()));
      });

      standing.sort(((a, b) => (a.standing)!.compareTo(b.standing!)));
      emit(StandingSuccesState());
    }).catchError((error) {
      emit(StandingErrorState(error.toString()));
      print(error.toString());
    });
  }

  List<MatchesModel> matches1 = [];

  List<MatchesModel> matchExp = [];

  RoundModel? roundModel;

  Future<void> getMatch({required String round}) async {
    matches1.clear();
    emit(MatchesLoadingState());

    await FirebaseFirestore.instance.collection('matches1').get().then((value) {
      value.docs[0][round].forEach((element) {
        matches1.add(MatchesModel.fromJson(element));
        matchExp.add(MatchesModel.fromJson(element));
      });

      print('------------------');
      print(matches1[3].team1);
      print('------------------');

      //matches.sort(((a, b) => (a.no)!.compareTo(b.no!)));
      //print(matches[201].date);
      emit(MatchesSuccesState());
    }).catchError((error) {
      print(error.toString());
      emit(MatchesErrorState(error.toString()));
    });
  }

  int BuilderKey = -1;

  void ExpandedStatus(int ExpansionKey) {
    Duration(seconds: 20000);
    BuilderKey = ExpansionKey;
    emit(ExpandedState());
  }

  void CollapsedStatus() {
    BuilderKey = -1;
    matches1.clear();
    emit(CollapsedState());
  }

 
 
 
 
 
  UserModel? userModel;
  void getUserData() {
    emit(GetUserLoadingStates());

    FirebaseFirestore.instance.
    collection('users').
    doc(uId).
    get().
    then((value) {
      
      userModel = UserModel.fromJson(value.data()!);
      print('-----------');
      print(userModel!.result1);
      print(userModel!.uId);
      print('+++++++++++');
     emit(GetUserSuccessStates());
    }).catchError((error) {
      
      
      print(error.toString());
      emit(GetUserErrorStates());
    });
  }
  


     
  void expectionData({
    required String exp1,
    required String exp2,
    String ? team1,
    String  ?team2,
   // required uId
   
     
    
  }) {
    emit(ExpectionLoadingState());
    
    ExpectionModel? expmodel = ExpectionModel(
      uId:userModel!.uId ,
      exp1: 'exp1',
      exp2: 'exp2',
      team1: matches1[1].team1,
      team2: matches1[1].team2,
       name: userModel!.name,
       
    );
    FirebaseFirestore.instance
        .collection('exp')
        .doc(uId)
        .set(expmodel.toMap())
        .then((value) {
          
      getUserData();
    }).catchError((error) {
      emit(ExpectionErrorState());
    });
  }

  void SetTest(
    {required String name,
    required String age, 
    required List<dynamic> Expection1,
    required  List<Map<String,dynamic>> data,
    required exp1,
    required exp2,
    }
    )
    {
emit(TestLoadingStates());
      Round? object2=Round(
        round: data, 
        exp1: exp1, 
        exp2: exp2, 
        logo2: matches1[1].logo2, 
        logo1: matches1[1].logo1, 
        team2: matches1[1].team2, 
        team1: matches1[1].team1
        );

       TestModel? object=TestModel(
         name: name,
         age: age,
         status: true,
         kids: 2
         
       

         );
    FirebaseFirestore.instance.collection('Test').
    doc('child').set(object2.toMap()).then((value){
      emit(TestSuccessStates());
    }).catchError((error) {
      emit(TestErrorStates());
    });
    
  }

  TestModel? testmodel;
  Future getTest()async{
    emit(getTestLoadingStates());
  await  FirebaseFirestore.instance.collection('Test')
    .doc('child')
    .get().then((value) {

    testmodel= TestModel.fromJson( value.data()!);
    print(testmodel!.name);
    emit(getTestSuccessStates());
    }).catchError((error) {
      emit(getTestErrorStates());
    });
  }
}
