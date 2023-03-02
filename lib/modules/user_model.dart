class UserModel {
   String? name;
   String ?email;
   String ?phone;
   String ?uId;
   String ?result1;
   int ?result2;

  UserModel({
    this.email,
    this.name,
    this.phone,
    this.uId,
    this.result1,
    this.result2
  });
  UserModel.fromJson(Map<String,dynamic>json){
    email=json['email'];
     name=json['name'];
      phone=json['phone'];
       uId=json['uId'];
       result1=json['result1'];
       result2=json['result2'];
  }
  Map<String,dynamic> toMap(){
    return {
      'name':name,
      'email':email,
      'phone':phone,
      'uId':uId,
      'result1':result1,
      'result2':result2
    };
  }
}