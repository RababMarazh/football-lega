abstract class  MainStates {}
class  SocialInitialStates extends MainStates {}
class  SocialGetUserLoadingStates extends MainStates {}
class  SocialGetUserSuccssStates extends MainStates {}
class  SocialGetUserErrorStates extends MainStates {
  final String error;
  SocialGetUserErrorStates(this.error);
}


class  SocialChangeBottomNavStates extends MainStates {}
class  SocialResultSuccessStates extends MainStates {}
class  SocialResultErrorStates extends MainStates {
  final String error;
  SocialResultErrorStates(this.error);
}
