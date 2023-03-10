import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iraqligaapp/components/colors.dart';
import 'package:iraqligaapp/screens/login_screen.dart';
import '../components/component.dart';
import '../cubit/login_cubit.dart';
import '../cubit/register_cubit.dart';
import '../cubit/register_states.dart';
import 'container_curve.dart';
import 'layout_screen.dart';

class RegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is SocialCreateUserSuccessState) {
            navigateAndFinsh(context, Layout_Screen());
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                ClipPath(
                  clipper: WaveClipperl(),
                  child: Container(
                    color: Colors.black,
                    height: 200,
                  ),
                ),
                ClipPath(
                  clipper: WaveClipperl(),
                  child: Container(
                    color: Colors.black,
                    height: 250,
                  ),
                ),
                ClipPath(
                  clipper: WaveClipperR(),
                  child: Container(
                    color: Colors.red,
                    height: 200,
                  ),
                ),
                ClipPath(
                  clipper: WaveClipperR(),
                  child: Container(
                    color: Colors.red,
                    height: 150,
                  ),
                ),
                Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '??????????',
                              style:resultTextStyle,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              '???????? ???????? ?????????? ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Colors.black),
                            ),
                            const SizedBox(
                              height: 40.0,
                            ),
                            defaultFormField(
                              controller: nameController,
                              TextInputType: TextInputType.name,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return '???????????? ?????????? ????????';
                                } else {
                                  (nameController.text);
                                }
                              },
                              label: '?????? ????????????????',
                              prefix: Icons.person,
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            defaultFormField(
                              controller: emailController,
                              TextInputType: TextInputType.emailAddress,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return '???????????? ?????????? ?????????? ????????????????????';
                                } else {
                                  (emailController.text);
                                }
                              },
                              label: '???????????? ????????????????????',
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
                                  return '???????? ???????????? ?????????? ????????';
                                } else {
                                  (passwordController.text);
                                }
                              },
                              label: '???????? ????????????',
                              prefix: Icons.lock_clock_outlined,
                              onSubmit: (value) {
                                if (formKey.currentState!.validate()) {
                                  LoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              isPassword:
                                  RegisterCubit.get(context).isPassword,
                              suffixpressed: () {
                                RegisterCubit.get(context)
                                    .changePasswordVisibility();
                              },
                              suffix: RegisterCubit.get(context).suffix,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            defaultFormField(
                              controller: phoneController,
                              TextInputType: TextInputType.phone,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return '???????????? ?????????? ?????? ?????????? ????????????';
                                } else {
                                  (phoneController.text);
                                }
                              },
                              label: '?????? ???????????? ????????????',
                              prefix: Icons.group_work,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ConditionalBuilder(
                              condition: state is! SocialRegisterLoadingState,
                              builder: (context) => defaultbuttom(
                                text: '??????????',
                                isUpperCase: true,
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    RegisterCubit.get(context)
                                        .userRegister(
                                            email: emailController.text,
                                            password: passwordController.text,
                                            name: nameController.text,
                                            phone: phoneController.text);
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
                                const Text('?????? ????????'),
                                TextButton(
                                    onPressed: () {
                                      navigateTo(context, Log_InScreen());
                                    },
                                    child: Text(
                                      '????????????'.toUpperCase(),
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 16),
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

String token = '';
