import 'package:flutter/material.dart';

class RoundModel{
RoundMatchesModel? matches;

RoundModel.fromjson(Map<String, dynamic>json){
  matches=RoundMatchesModel.fromjson(json['matches']);

}
}

 class RoundMatchesModel{

 List<MatchesModel> round1=[];

RoundMatchesModel.fromjson(Map<String,dynamic>json){

  json['round1'].forEach((element){
    round1.add(MatchesModel.fromJson(element));

  });
}

}



class MatchesModel {
      String? round;
      String? date;
      String? team1;
      String? team2;
      int? id;
      String? logo1;
      String? logo2;
      int? no;
      dynamic result2;
      dynamic result1;
     
      
  MatchesModel({
   
    this.round,
    this.date,
    this.team1,
    this.team2,
    this.id,
    this.logo1,
    this.logo2,
    this.no,
    this.result2,
    this.result1,
  });
     MatchesModel.fromJson(Map<String, dynamic> json)
     {
       round=json['round'];
       date=json['date'];
       team1=json['team1'];
       team2=json['team2'];
       id=json['id'];
       no=json['no'];
       result2=json['result2'];
       result1=json['result1'];
       logo1=json['logo1'];
       logo2=json['logo2'];
       
    


     }
     Map<String,dynamic>toMap(){
       return {
         'round':round,
         'team1':team1,
         'team2':team2,
         'date':date,
         'id':id,
         'no':no,
         'result2':result2,
         'result1':result1,
         'logo1':logo1,
         'logo2':logo2,

       };
       

     }

}
