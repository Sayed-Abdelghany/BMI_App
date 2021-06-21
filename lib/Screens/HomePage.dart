import 'dart:math';

import 'package:bmi_app/Screens/ResultScreen.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMale = true;
  double heightBMI = 120.0;
  int weight = 40;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                        isMale=true;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage('assets/images/male.png'),height: 70,width: 70,),
                            SizedBox(height: height*0.01,),
                            Text('MALE',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: isMale?Colors.blue:Colors.grey[400],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale=false;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage('assets/images/female.png'),height: 70,width: 70,),
                            SizedBox(height: height*0.01,),
                            Text('FEMALE',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: !isMale==false? Colors.grey[400]:Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text('${heightBMI.round()}',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w900),),
                        SizedBox(width: 5,),
                        Text('CM',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Slider(
                        value:heightBMI ,
                        max: 220,
                        min: 80,
                        onChanged: (value){
                          setState(() {
                            heightBMI=value;
                          });
                        }
                        ),
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[400],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WEIGHT',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          Text('$weight',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w900),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             FloatingActionButton(
                                 onPressed: (){
                                   setState(() {
                                     weight--;
                                   });
                                 },
                               child: Icon(Icons.remove),
                               heroTag: 'weight-',
                               mini: true,
                                 ),
                             FloatingActionButton(
                                 onPressed: (){
                                   setState(() {
                                     weight++;
                                   });
                                 },
                               child: Icon(Icons.add),
                               heroTag: 'weight+',
                               mini: true,
                                 ),
                            ],
                          ),
                        ],
                      ),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400] ,
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          Text('$age',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w900),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                                child: Icon(Icons.remove),
                                heroTag: 'age-',
                                mini: true,
                              ),
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                child: Icon(Icons.add),
                                heroTag: 'age+',
                                mini: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400] ,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            width: double.infinity,
            color: Colors.blue,
            child: MaterialButton(
                child: Text('CALCULATE',style: TextStyle(color: Colors.white,fontSize: 20),),
                onPressed: (){
                  double result = weight / pow(heightBMI/100, 2);
                  print(result.round());
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>ResultScreen(isMale: isMale,age: age,result: result.round(),)));
                }
                ),
          )
        ],
      ),
    );
  }
}
