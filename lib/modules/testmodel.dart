class TestModel {

  String? name;
  String? age;
  bool? status;
  int? kids;
  List? Expexction;
 List <Data>? data;

  TestModel({
    this.name,
    this.age,
    this.status,
    this.kids,
    this.Expexction,
    this.data
  });
  TestModel.fromJson(Map<String,dynamic> json){
    name=json['name'];
    age=json['age'];
    

  }
 
 Map<String,dynamic> toJson(){

   return {
     'name':name,
     'age':age,
     'isMarried':status,
     'kids':kids,
     'Expection':Expexction,
     'data':data
   };
 }
  
  
}

  class Data{
  String?team1;
  String?team2;
  String?exp1;
  String?exp2;
  String?logo1;
  String?logo2;

  Data({
    required this.team1,
    required this.team2,
    required this.logo1,
    required this.logo2,
    required this.exp1,
    required this.exp2
  });

Map<String, dynamic> toMap(){
  Map<String, dynamic> data =<String,dynamic>{};
  
  data['team1']=team1;
  data['team2']=team2;
  data['exp']=exp1;
  data['exp2']=exp2;
  data['logo1']=logo1;
  data['logo2']=logo2;

  return data;
}

}


class Liga {
  String?name;
  bool? status=false;
  List<Round>? matches;
  Liga({
    required this.name,
    required this.status,
    this.matches,
  });
 Map<String,dynamic> toMap() {
   return {
     'name':name,
     'status':status,
     'matches':matches

   };
 }

}

class Round {
 
  String?team1;
  String?team2;
  String?exp1;
  String?exp2;
  String?logo1;
  String?logo2;
  List<Map<String,dynamic>>? round;
  
  Round({
  required this.round,
  required this.exp1,
  required this.exp2,
  required this.logo2,
  required this.logo1,
  required this.team2,
  required this.team1
  });

 Map<String,dynamic> toMap(){
   Map<String, dynamic> round =<String,dynamic>{};
  round['team1']=team1;
  round['team2']=team2;
  round['exp1']=exp1;
  round['exp2']=exp2;
  round['logo1']=logo1;
  round['logo2']=logo2;


   return round;
 }
 




}
