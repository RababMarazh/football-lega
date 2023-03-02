

abstract class LoginStates {}
class LoginInitialState extends LoginStates {}
class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{
  final String uId;
 LoginSuccessState(this.uId);

 

 
}
class ChangePasswordVisibilityState extends LoginStates{}
class LogininErrorState extends LoginStates{
  final String error;
  LogininErrorState(this.error);

  
}


