import 'package:flutter/material.dart';
import 'package:iraqligaapp/components/colors.dart';
import 'package:iraqligaapp/components/component.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: containerDecoration,
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Container(
              height: 60,
              width: double.infinity,
              //decoration: containerDecoration,
              child: Row(
                children: [
                  const SizedBox(
                    width: 40,
                  ),
                  const Text('اللاعبين'),
                  const SizedBox(
                    width: 140,
                  ),
                  Row(
                    children: [
                      const Text('Form'),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_drop_down_sharp))
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Value'),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_drop_down_sharp))
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => ItemBuilder(
                      Name: 'علي',
                      Team: 'النجف',
                      function: () {
                        //   Navigator.push(
                        //  context,
                        //  MaterialPageRoute(
                        //    builder: (context)=>const Date_Screen()));
                      }),
                  separatorBuilder: (context, index) => Container(
                        height: 3,
                        width: double.infinity,
                        //color: Colors.grey[400],
                      ),
                  itemCount: 10),
            ),
          ],
        ),
      ),
    );
  }
}

Widget box({required text1, required text2}) => Expanded(
      child: Container(
        height: 60,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text1,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.pink),
                  textAlign: TextAlign.start,
                ),
                Text(
                  text2,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings_backup_restore),
              alignment: AlignmentDirectional.topCenter,
            )
          ],
        ),
      ),
    );
