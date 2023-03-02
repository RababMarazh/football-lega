class ExpectionModel{
  String?name;
  String?uId;
  String?exp1;
  String?exp2;
  String?team1;
  String?team2;
  //defualt constructor
  ExpectionModel({
    this.name,
    this.uId,
    this.exp1,
    this.exp2,
    this.team1,
    this.team2
  });
//named constructor
  ExpectionModel.fromJson(Map<String,dynamic>json){
    uId=json['uId'];
    name=json['name'];
    exp1=json['exp1'];
    exp2=json['exp2'];
    team1=json['team1'];
    team2=json['team2'];
  }
  //function 
  Map<String,dynamic> toMap(){
    return{
      'uId':uId,
      'name':name,
      'exp1':exp1,
      'exp2':exp2,
      'team1':team1,
      'team2':team2
    };
  }
}