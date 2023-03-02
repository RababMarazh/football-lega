import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iraqligaapp/components/constant.dart';
import 'package:iraqligaapp/cubit/ligacubit.dart';
import 'package:iraqligaapp/modules/StandingModel.dart';
import 'package:iraqligaapp/modules/matches_model.dart';
import 'package:iraqligaapp/modules/user_model.dart';
import 'package:iraqligaapp/screens/all_arounds.dart';
import 'package:iraqligaapp/screens/playerprice_screen.dart';

import '../screens/gk_screen.dart';
import '../screens/player_screen.dart';
import 'colors.dart';
var formKey1 = GlobalKey<FormState>();
void navigateTo(context, Widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Widget,
    ));
void navigateAndFinsh(
  context,
  Widget,
) =>
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => Widget,
        ), (route) {
      return false;
    });
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType,
  dynamic onSubmit,
  required validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  bool isPassword = false,
  Function? suffixpressed,
  GestureTapCallback? OnTap,
  bool isClickable = true,
  ValueChanged<String>? OnChanged,
}) =>
    TextFormField(
      onTap: OnTap,
      onChanged: OnChanged,
      controller: controller,
      keyboardType: TextInputType,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      validator: validate,
      enabled: isClickable,
      decoration: InputDecoration(
        labelText: label,
        errorStyle: TextStyle(color: Color.fromARGB(255, 122, 56, 2)),
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixpressed!();
                },
                icon: Icon(suffix))
            : null,
        border: OutlineInputBorder(),
      ),
    );

Widget defaultbuttom({
  double width = double.infinity,
  Color background = Colors.green,
  bool isUpperCase = true,
  required function,
  required String text,
  dynamic constraints,
  Decoration? decoration,
}) =>
    Container(
      width: width,
      color: background,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: 'Jannah'),
        ),
      ),
    );
void showToast({required String text, required ToastStates state}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      return color = Colors.green;
      break;
    case ToastStates.ERROR:
      return color = Colors.red;
      break;
    case ToastStates.WARNING:
      return color = Colors.amber;
      break;
  }
  return color;
}

Widget buildListProduct(model, context, {bool isOldPrice = true}) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(model.image),
                  fit: BoxFit.cover,
                  width: 120,
                  height: 120.0,
                ),
                if (model.discount != 0 && isOldPrice)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    color: Colors.red,
                    child: const Text(
                      'DISCOUNT',
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name.toString(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      height: 1.3,
                      fontSize: 14.0,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        model.price.toString(),
                        style: const TextStyle(
                            fontSize: 12.0, color: defaultColor),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      if (model.discount != 0 && isOldPrice)
                        Text(
                          model.oldPrice.toString(),
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: CircleAvatar(
                          radius: 15.0,
                          child: Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.white,
                            size: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

Widget player(context) => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //IconButton(
        //onPressed: (){},
        //icon: Icon(Icons.copy_all),),
        Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.network(
                  'https://www.freepik.com/free-vector/vector-isolated-realistic-soccer-ball-white_10601489.htm#query=football&position=2&from_view=keyword',
                  height: 60,
                  width: 60,
                ),
                IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                )
              ],
            ),
            const SizedBox(
              height: 1,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.green[900],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(7),
                      topRight: Radius.circular(7))),
              height: 20,
              width: 60,
              child: const Text(
                'name',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.green[800],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(7),
                      bottomRight: Radius.circular(7))),
              height: 20,
              width: 60,
              child: const Text(
                'number',
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        //IconButton(onPressed: (){},
        //icon:const Icon(Icons.sports_soccer),),
      ],
    );

Widget ItemBuilder({required function, required Name, required Team}) =>
    Container(
      height: 70,
      width: double.infinity,
      //color: Colors.white,
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Row(
              children: [
                Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/8/8c/Cristiano_Ronaldo_2018.jpg'),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 243, 241, 241)),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      Team,
                      style:
                          TextStyle(color: Color.fromARGB(255, 243, 239, 239)),
                      textAlign: TextAlign.start,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 70,
                        ),
                        Icon(
                          Icons.star_half_rounded,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Expanded(
                  child: Text(
                '6.6',
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.start,
              )),
              Expanded(
                  child: Text(
                '34',
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.start,
              )),
            ],
          )),
        ],
      ),
    );

Widget Divider() => Container(
      height: 40,
      width: 1,
      color: Colors.grey[400],
    );

Widget MatchDesign(MatchesModel model, context) => Padding(
      padding: EdgeInsets.all(6),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black87.withOpacity(0.6),
              blurRadius: 4.0,
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                alignment: Alignment.center,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.green,
                  boxShadow: [
                    BoxShadow(
                      color: appBarColor,
                      blurRadius: 7.0,
                    )
                  ],
                ),
                child: Text(
                  '${model.round}',
                  style: textStyleStanding,
                )),
            SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: 85,
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      child: Image(
                        image: NetworkImage('${model.logo1}', scale: 2.5),
                      ),
                    ),
                    Text(
                      '${model.team1}',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    Text(
                      'VS',
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          model.result1 == "" ? '-' : '${model.result1}',
                          style: resultTextStyle,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        const Text(
                          '-',
                          style: resultTextStyle,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(model.result2 == "" ? '-' : '${model.result2}',
                            style: resultTextStyle),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Container(
                width: 85,
                alignment: Alignment.centerRight,
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      child: Image(
                        image: NetworkImage('${model.logo2}', scale: 2.5),
                      ),
                    ),
                    Text(
                      '${model.team2}',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                          fontSize: 20),
                    ),
                  ],
                ),
              )
            ]),
          ],
        ),
      ),
    );

Widget RoundDesign(MatchesModel model, context) => Padding(
      padding: EdgeInsets.all(3),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 58, 116, 103),
          borderRadius: BorderRadius.circular(30),
        ),
        height: 50,
        width: double.infinity,
        child: Center(
          child: Text(
            '${model.round}',
            style: TextStyle(fontSize: 20, fontFamily: "jannah"),
          ),
        ),
      ),
    );

Widget StandingDesign(StandingModel model, context) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 30,
          width: 380,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 201, 187, 187),
              borderRadius: BorderRadius.circular(30)),
          child: Row(
            children: [
              Container(
                width: 155,
                decoration: BoxDecoration(
                  color: model.standing! > 16
                      ? Colors.red
                      : model.standing == 1
                          ? Colors.green
                          : model.standing == 2
                              ? Colors.blue
                              : Color.fromARGB(255, 221, 219, 215),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Text("${model.standing}", style: textStyleStanding),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                        height: 28,
                        width: 28,
                        child: Image(
                          image: NetworkImage(
                            "${model.logo}",
                          ),
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                    Text("${model.club}", style: textStyleStanding),
                  ],
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text("${model.MP}", style: textStyleStanding),
              ),
              Expanded(
                child: Text(
                  "${model.W}",
                  style: textStyleStanding,
                ),
              ),
              Expanded(
                child: Text("${model.D}", style: textStyleStanding),
              ),
              Expanded(
                child: Text("${model.L}", style: textStyleStanding),
              ),
              Expanded(
                child: Text("${model.GF}", style: textStyleStanding),
              ),
              Expanded(
                child: Text("${model.GA}", style: textStyleStanding),
              ),
              Expanded(
                child: Text("${model.Pts}", style: textStyleStanding),
              ),
            ],
          ),
        ),
      ],
    );

// ignore: non_constant_identifier_names
Widget DataTeam(
        {required image1, required image2, required Team1, required Team2}) =>
    Container(
      decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                        Team1), //const (Team1'بغداد',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w200,fontSize: 20),),
                    const SizedBox(
                      width: 10,
                    ),
                    image2
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  '4',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const Text('-',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const Text('0',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const SizedBox(
                  width: 15,
                ),
                Row(
                  children: [
                    image1,
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                        Team2), //const Text('ديوانية',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w200,fontSize: 20),),
                    const SizedBox(
                      width: 5,
                    )
                  ],
                ),
              ]),
        ],
      ),
    );

Widget RoundButton() => Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 3, offset: Offset(5, 5))
        ],
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 148, 13, 3),
            Colors.white,
            Color.fromARGB(255, 15, 15, 15),
          ],
        ),
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      height: 50,
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.only(right: 9),
        onPressed: () {},
        child: Row(
          children: [
            Text(
              'جولة ١',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Spacer(),
            Text('لُعبت',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_drop_down,
                  size: 30,
                )),
          ],
        ),
      ),
    );

Widget RoundCard(
        {context,
        required String function,
        required String round,
        required Widget widget}) =>
    Card(
      borderOnForeground: false,
      elevation: 8,
      color: Color.fromARGB(255, 226, 216, 216),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.black, width: 2)),
      child: ExpansionTile(
        onExpansionChanged: (isExpanded) async {
          // LigaCubit.get(context).matches1.clear();
          LigaCubit.get(context).getMatch(round: 'round1');
        },
        collapsedTextColor: Colors.black,
        iconColor: Colors.red,
        textColor: Color.fromARGB(255, 139, 136, 136),
        title: Row(
          children: [
            Text(
              round,
              style: TextStyle(fontFamily: 'Jannah', fontSize: 20),
            ),
            Spacer(),
            Text(
              'لُــعبت',
              style: TextStyle(fontFamily: 'Jannah', fontSize: 20),
            ),
          ],
        ),
        children: [
          widget,
        ],
      ),
    );

Widget EmptyWidget() => Card(
      elevation: 8,
      color: Color.fromARGB(255, 226, 216, 216),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.black, width: 2)),
      child: Center(
        child: Text('There are no matches today'),
      ),
    );

Widget Expansion({
  required BuildContext context,
  required String round,
  required String title,
  required int index1,
  
}) =>
    Card(
      borderOnForeground: false,
      elevation: 8,
      color: Color.fromARGB(255, 226, 216, 216),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.black, width: 2)),
      child: ExpansionTile(
        
          key: Key(index1.toString()),
          initiallyExpanded: index1 ==
              LigaCubit.get(context).BuilderKey,
          collapsedTextColor: Colors.black,
          iconColor: Colors.red,
          textColor: Color.fromARGB(255, 139, 136, 136),
          title: Row(
            children: [
              Text(
                title,
                style: TextStyle(fontFamily: 'Jannah', fontSize: 20),
                
              ),
            ],
          ),
          onExpansionChanged: (isExpanded) async {
            if (isExpanded) {
             
              await LigaCubit.get(context).getMatch(round: round);
              LigaCubit.get(context).ExpandedStatus(index1);

            
            } else {

              LigaCubit.get(context).CollapsedStatus();
            }
          },
          children: [
            LigaCubit.get(context).matches1.isNotEmpty
                ? ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return MatchDesign(
                          LigaCubit.get(context).matches1[index], context);
                    },
                    itemCount: 10,
                  )
                : CircularProgressIndicator()
          ]),
    );

var textcontroller1=TextEditingController();
var textcontroller2=TextEditingController();
   Widget ExpDesign(
   MatchesModel model, 
   context,
{
  required TextEditingController controller1,
  required TextEditingController controller2,
  required function ,

})=> Container(
 
              
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      // Container(
                      //   height: 240,
                      //   decoration: BoxDecoration(
                      //     color: Color.fromARGB(255, 73, 71, 71),
                      //     borderRadius: BorderRadius.only(
                      //       bottomRight: Radius.circular(50),
                      //       bottomLeft: Radius.circular(50),
                      //     ),
                      //   ),
                      // ),
                      // Container(
                      //   height: 220,
                      //   width: double.infinity,
                      //   decoration: BoxDecoration(
                      //     color: Color.fromARGB(255, 248, 246, 246),
                      //     borderRadius: BorderRadius.only(
                      //       bottomRight: Radius.circular(50),
                      //       bottomLeft: Radius.circular(50),
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 63, 61, 61),
                            borderRadius: BorderRadius.circular(33),
                            border: Border.all(color: appBarColor,width: 4)
                          ),
                          child: Column(
                            children: [
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('توقع و اربح',
                                   style: TextStyle(
                                                    color: Colors.green,
                                                    fontWeight: FontWeight.w200,
                                                    fontSize: 20),
                                  ),
                                Icon(Icons.attach_money,color: Colors.yellow,)
                                ],
                              ),
                              SizedBox(height: 15,),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 85,
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 40,
                                            width: 40,
                                            
                                            child: Image(
                                              image: NetworkImage('${model.logo1}',
                                                  scale: 2.5),
                                            ),
                                          ),
                                          Text(
                                            '${model.team1}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w200,
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: 5),
                                      child: Column(
                                        children: [
                                          Text(
                                            'VS',
                                            style: TextStyle(color: Color.fromARGB(255, 240, 216, 6)),
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                color: Colors.white,
                                                height: 25,
                                                width: 25,
                                                child: TextFormField(
                                                  onFieldSubmitted:( value )  {
                                                    print('_+_+_+_+_+');
                                                    print(value);
                                                    print('_+_+_+_+_+');
                                                  },
                                                  validator:(value){
                                                    if (value!.isEmpty) {
                                                      return '';
                                                      
                                          
                                                      
                                                    }return null;
                                                  } ,
                                                  textAlign: TextAlign.center,
                                                  style: 
                                                TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                  controller: controller1,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              const Text(
                                                '-',
                                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                color: Colors.white,
                                                height: 25,
                                                width: 25,
                                                child: 
                                                TextFormField(
                                                  
                                                  textAlign: TextAlign.center,
                                                  style: 
                                                TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                  controller: controller2,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Container(
                                      width: 85,
                                      alignment: Alignment.centerRight,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 40,
                                            width: 40,
                                            child: 
                                             Image(
                                              image: NetworkImage('${model.logo2}',
                                                  scale: 2.5),
                                            ),
                                          ),
                                          Text(
                                            '${model.team2}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w200,
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    )
                                  ]),
                                  SizedBox(height: 10,),
                              Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(11)
                                ),
                                
                                child: MaterialButton(
                                  onPressed: function,
                                
                                  child: Text(
                                    'النتيجة',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        fontFamily: 'Jannah'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );



Widget Exp({
  required BuildContext context,
  required String round,
  required String title,
  required int index1,
  required String text2,
}) =>
    Form(
      key: formKey1,
      child: Card(
        borderOnForeground: false,
        elevation: 8,
        color: Color.fromARGB(255, 226, 216, 216),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: appBarColor, width: 2)),
       
        child: ExpansionTile(
          
            key: Key(index1.toString()),
            initiallyExpanded: index1 ==
                LigaCubit.get(context).BuilderKey,
            collapsedTextColor: Colors.black,
            iconColor: Colors.red,
            textColor: Color.fromARGB(255, 139, 136, 136),
            title: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(fontFamily: 'Jannah', fontSize: 20),
                ),
                Spacer(),
                Text(
                  text2,
                  style: TextStyle(fontFamily: 'Jannah', fontSize: 16),
                ),
    
              ],
            ),
            onExpansionChanged: (isExpanded) async {
              if (isExpanded) {
               
                await LigaCubit.get(context).getMatch(round: round);
                LigaCubit.get(context).ExpandedStatus(index1);
    
              
              } else {
    
                LigaCubit.get(context).CollapsedStatus();
              }
            },
            children: [
              LigaCubit.get(context).matches1.isNotEmpty
                  ? ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ExpDesign(
                          LigaCubit.get(context).matchExp[index], context, 
                          controller1: TextEditingController(), 
                          controller2: TextEditingController(),
                          function:() {
                            if(formKey1.currentState!.validate())
                                    { LigaCubit.get(context).expectionData(
                                       exp1: textcontroller1.text.toString(), 
                                       exp2: textcontroller2.text.toString(),);
                                        };
                                       print(uId);
                                    },
                          );
                          
                      },
                       separatorBuilder: (context, index) => 
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Container(
                             width: 30,
                             height: 3,
                             color: appBarColor,
                             ),
                             SizedBox(width: 10,),
                             Container(
                             width: 30,
                             height: 3,
                             color: appBarColor,
                             ),
                             SizedBox(width: 10,),
                             Container(
                             width: 30,
                             height: 3,
                             color: appBarColor,
                             ),
                         ],
                       ),
                
                      itemCount: 10,
                    )
                  : CircularProgressIndicator()
            ]),
      ),
    );

    Widget playerIcon(context)=>Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children:[
              //IconButton(
              //onPressed: (){},
              //icon: Icon(Icons.copy_all),),     
Column(
  children: [  Stack(alignment: AlignmentDirectional.center,
    children: [
      Image.asset('images/empty.ico',height: 50,width: 60,
              
              ),
              IconButton(
                icon: Icon(Icons.add,color: Colors.white ,),
                onPressed: (){
               Navigator.push(context,MaterialPageRoute
               (builder: (context)=>PlayerPrice_Screen()));
                }, 
              )
              
    ],
  ),
               
              const SizedBox(height: 1,),
              Container(decoration: BoxDecoration(color: Colors.green[900],borderRadius: BorderRadius.only(topLeft: Radius.circular(7),topRight:Radius.circular(7) )),
              
              height: 20,width: 60,
              
                child:const Text('name',style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),),
              Container(decoration: BoxDecoration(color: Colors.green[800],borderRadius: BorderRadius.only(bottomLeft: Radius.circular(7),bottomRight:Radius.circular(7))),
              height: 20,width: 60,
                child:const Text('number',style: TextStyle(color: Colors.white,),textAlign: TextAlign.center,),),],),
                     //IconButton(onPressed: (){},
                     //icon:const Icon(Icons.sports_soccer),),
                 
                ],);

   Widget goalKeeperIcon(context)=>Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children:[
              //IconButton(
              //onPressed: (){},
              //icon: Icon(Icons.copy_all),),     
Column(
  children: [  Stack(alignment: AlignmentDirectional.center,
    children: [
      Image.asset('images/ba_kit.ico',height: 70,width: 70,
              
              ),
              IconButton(
                icon: Icon(Icons.add,color: Colors.white ,),
                onPressed: (){
               Navigator.push(context,MaterialPageRoute
               (builder: (context)=>GoalKeeper_Screen()));
                }, 
              )
              
    ],
  ),
               
              const SizedBox(height: 1,),
              Container(decoration: BoxDecoration(color: Colors.green[900],borderRadius: BorderRadius.only(topLeft: Radius.circular(7),topRight:Radius.circular(7) )),
              
              height: 20,width: 60,
              
                child:const Text('name',style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),),
              Container(decoration: BoxDecoration(color: Colors.green[800],borderRadius: BorderRadius.only(bottomLeft: Radius.circular(7),bottomRight:Radius.circular(7))),
              height: 20,width: 60,
                child:const Text('number',style: TextStyle(color: Colors.white,),textAlign: TextAlign.center,),),],),
                     //IconButton(onPressed: (){},
                     //icon:const Icon(Icons.sports_soccer),),
                 
                ],);

    Widget gKprice(context)=>Container(
      height: 60,
      width: double.infinity,
      color: Colors.white,
      child: Row(children: [
                Icon(Icons.perm_device_information),
                Container(height: 50,width: 50,
                  child: Image.asset('images/empty1.ico')),
                SizedBox(width: 10,),
                Text('name...'),
                SizedBox(width: 100,),
                 Text('price...'),

                

              ],),
    );

    Widget playerprice(context)=>Container(
      height: 60,
      width: double.infinity,
      color: Colors.white,
      child: Row(children: [
                Icon(Icons.perm_device_information),
                Container(height: 50,width: 50,
                  child: Image.asset('images/empty.ico')),
                SizedBox(width: 10,),
                Text('name...'),
                SizedBox(width: 100,),
                 Text('price...'),

                

              ],),
    );
          

