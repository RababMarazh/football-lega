
import 'package:iraqligaapp/screens/login_screen.dart';

import 'cache_helper.dart';
import 'component.dart';

void signOut(context){
   CacheHelper.removeData(key: 
   'token').then((value)
    => navigateAndFinsh(context, Log_InScreen()));
       
}
void printFullText(dynamic text){
  final Pattern=RegExp('.{1,800}');
    Pattern.allMatches(text).forEach((match)=>print(match.group(0)));
}
String token='';
String uId='';
