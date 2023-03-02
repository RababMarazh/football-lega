
abstract class RegisterStates {}
class SocialRegisterInitialState extends RegisterStates {}
class SocialRegisterLoadingState extends RegisterStates{}
class SocialRegisterSuccessState extends RegisterStates{}
class SocialRegisterChangePasswordVisibilityState extends RegisterStates{}
class SocialRegisterinErrorState extends RegisterStates{
  final String error;
  SocialRegisterinErrorState(this.error);
  
}
class SocialCreateUserSuccessState extends RegisterStates{}
class SocialCreateUserErrorState extends RegisterStates{
  final String error;
  SocialCreateUserErrorState(this.error);
}
