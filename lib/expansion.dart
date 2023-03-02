import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iraqligaapp/cubit/ligacubit.dart';
import '../components/component.dart';
import '../cubit/ligastates.dart';

// ignore: camel_case_types
class ExpansionScreen extends StatelessWidget {
  var ageController = TextEditingController();
  var nameController = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  var controller2 = TextEditingController();
  var controller3 = TextEditingController();

  List<TextEditingController> controller = [
    for (int i = 0; i < 4; i++) TextEditingController(),
  ];
  List<Map<String, dynamic>> Exp_controllers = [for (int i = 0; i < 4; i++) {}];
// static var controller1;
  // static var controller2;
  // static var controller3;
  // static var controller4;

  @override
  Widget build(BuildContext context) {
    // final function=LigaCubit.get(context).getMatch(round: 'round5');
    var function = 'round4';
    int activeStatus;
    final GlobalKey ExpansionKey = GlobalKey();

    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<LigaCubit, LigaStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            children: [
              Container(
                child: defaultbuttom(function: () {}, text: "Test"),
              ),
              // Text(LigaCubit.get(context).testmodel!.name.toString()),
              // TextFormField(
              //   controller: controller1,
              // ),
              defaultbuttom(
                  function: () async {
                    await LigaCubit.get(context).getMatch(round: 'round24');
                    

                    LigaCubit.get(context).SetTest(
                      name: controller[0].text,
                      age: controller[0].text,
                      Expection1: [],
                      data: Exp_controllers,
                      exp1: Exp_controllers[0]['exp1'],
                      exp2: Exp_controllers[1]['exp2'],
                    );
                  },
                  text: "print"),

              ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return TextFormField(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    controller: controller[index],
                    onChanged: (value) {
                      Exp_controllers[index]['exp1'] = value;
                      Exp_controllers[index]['exp2'] = value;
                    },
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
