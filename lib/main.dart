import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iraqligaapp/components/colors.dart';
import 'package:iraqligaapp/cubit/ligacubit.dart';
import 'package:iraqligaapp/cubit/ligastates.dart';
import 'package:iraqligaapp/screens/login_screen.dart';
import 'components/cache_helper.dart';
import 'components/constant.dart';
import 'cubit/cubit.dart';
import 'cubit/observer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp();
  uId=CacheHelper.getData(key: 'uId');
  print('-----');
  print(uId);
   print('---++--');
  BlocOverrides.runZoned(() {
      runApp(MyApp());
      },
          blocObserver: MyBlocObserver(),

      );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      BlocProvider(create: (context)=> LigaCubit()..getStanding()..getTest()..getUserData()),
      BlocProvider(create: (context) => MainCubit()),
      ],
      child: BlocConsumer<LigaCubit, LigaStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales:const [
              Locale('ar', 'AE'),
              //Locale("en", "US"),
            ],
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              appBarTheme:const AppBarTheme(
                  titleSpacing: 20,
                  //backwardsCompatibility: true,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      //systemNavigationBarColor: Colors.white,
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.light,
                      statusBarBrightness: Brightness.light),
                  backgroundColor: appBarColor,
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                  iconTheme: IconThemeData(color: Colors.black)),
              primarySwatch: Colors.green,
            ),
            home:Log_InScreen(),
          );
        },
      ),
    );
  }
}
