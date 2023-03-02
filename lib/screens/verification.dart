import 'package:flutter/material.dart';
import 'package:iraqligaapp/components/colors.dart';
import 'package:iraqligaapp/components/component.dart';

import 'feeds_Screen.dart';
import 'login_screen.dart';

class Verification_Screen extends StatelessWidget {
  const Verification_Screen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: containerDecoration
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 30,),
                const Text(
                  'تم إرسال رسالة الى البريد الألكتروني لتأكيد حسابك  الرجاء الدخول الي بريدك الألكتروني والضغط علي الرابط المرفق',
                
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Jannah',
                  
                  ),
                ),
                const Spacer(),
                defaultbuttom(
                  function: (){
                    navigateTo(context, Feeds_Screen());

                  }, 
                  text: 'الدخول'
                  ),
                  const SizedBox(height: 10,),
                  defaultbuttom(
                    function: (){
                      navigateTo(context, Log_InScreen());
                    }, 
                    text: 'إلغاء الحساب',),
                  const SizedBox(height: 30,),
              ],
            ),
          )
        ],
      ),
      
    );
  }
}