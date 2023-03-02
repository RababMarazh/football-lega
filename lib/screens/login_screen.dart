import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iraqligaapp/components/colors.dart';
import 'package:iraqligaapp/cubit/login_states.dart';
import 'package:iraqligaapp/screens/feeds_screen.dart';
import 'package:iraqligaapp/screens/player_screen.dart';
import 'package:iraqligaapp/screens/register_screen.dart';
import 'package:lottie/lottie.dart';
import '../components/cache_helper.dart';
import '../components/component.dart';
import '../cubit/login_cubit.dart';
import 'verification.dart';

class Log_InScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
        create: (BuildContext context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state){
          if(state is LogininErrorState){
            showToast(
              text: state.error, 
              state: ToastStates.ERROR);
          }
          if(state is LoginSuccessState)
          {
            CacheHelper.saveData(
              key: 'uId',
              value: state.uId,).
              then((value)
              {
                print(CacheHelper.getData(key: 'uId'));
                navigateAndFinsh(context, 
                Feeds_Screen(),
                );
              });
          }
        },
          builder: (context, state) {
            return Scaffold(
              body: Container(
               decoration: containerDecoration,
                child: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network('https://i2.wp.com/ashourland.net/wp-content/uploads/2019/09/71435571c1d9c058a13f0051eb445c63.jpg?fit=600%2C355&ssl=1'),
                            Center(
                              child: Text(
                                'الدوري العراقي الممتاز',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(color: Colors.black), 
                              ),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            defaultFormField(
                              controller: emailController,
                              TextInputType: TextInputType.emailAddress,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'الرجاء ادخال بريدك الالكتروني';
                                } else {
                                  print(emailController.text);
                                }
                              },
                              label: 'البريد الالكتروني',
                              prefix: Icons.email,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            defaultFormField(
                              controller: passwordController,
                              TextInputType: TextInputType.visiblePassword,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'كلمة المرور قصير جدآ';
                                } else {
                                  print(passwordController.text);
                                }
                              },
                              label: 'كلمة المرور',
                              prefix: Icons.lock_clock_outlined,
                              onSubmit: (value) {
                                if (formKey.currentState!.validate()) {
                                  // SocialLoginCubit.get(context).userLogin(
                                  //                             email: emailController.text,
                                  //                             password: passwordController.text
                                  //                             );
                                }
                              },
                              isPassword:
                                  LoginCubit.get(context).isPassword,
                              suffixpressed: () {
                                LoginCubit.get(context)
                                    .changePasswordVisibility();
                              },
                              suffix: LoginCubit.get(context).suffix,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ConditionalBuilder(
                              condition: state is! LoginLoadingState,
                              builder: (context) => defaultbuttom(
                                text: 'الدخول',
                                

                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    LoginCubit.get(context).userLogin(
                                        email: emailController.text,
                                        password: passwordController.text);
                                  }
                                },
                              ),
                              fallback: (context) => const Center(
                                  child: CircularProgressIndicator()),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('ليس لدي حساب:'),
                                TextButton(
                                    onPressed: () {
                                      navigateTo(context, RegisterScreen());
                                    },
                                    child: Text(' تسجيل'.toUpperCase(),
                                      style: TextStyle(color: Colors.green,fontSize: 16),
                                    )
                                    )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
