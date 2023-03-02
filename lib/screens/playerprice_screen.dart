import 'package:flutter/material.dart';
import 'package:iraqligaapp/components/component.dart';

class PlayerPrice_Screen extends StatelessWidget {
  const PlayerPrice_Screen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Center(child: 
          Text(' الدوري العراقي '),
          ),
        Image.asset('images/ipfl.png')],
      ),
      body: Column(
        children: [
          Container(color: Color.fromARGB(255, 197, 194, 194),
            child: Row(
              children: [
                 SizedBox(width: 20,),
                Text('اللاعبين'),
                SizedBox(width: 150,),
                Icon(Icons.money
                ),
              
              
            ],

            ),
          ),
          SizedBox(height: 10,width: double.infinity,),
          Expanded(
            child: 
            ListView.separated(
              itemBuilder: ((context, index) => playerprice(context)), 
              separatorBuilder:(context, index) => Container(height: 5,width: double.infinity,color: Color.fromARGB(255, 197, 194, 194),), 
              itemCount: 20))
       ],
      ),
      
    );
  
  }
}