import 'dart:math';

import 'package:bmi/constants/constant.dart';
import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:bmi/views/bmi_result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({Key? key}) : super(key: key);

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height=100;
  int weight=50;
  int age=20;
  String? gender;
  /*double calculateBmi(){
    double heightInMeter=height/100;
    final h=pow(heightInMeter, 2);
    final bmi=weight/h;
    return bmi;
  }*/

  List<Widget> generateList(start,end){
    List<Widget> weights=[];
    for(var i=start;i<end;i++)
    {
      weights.add(
        Text("$i",style: labelTextStyle.copyWith(fontSize: 20),),
      );
    }
    return weights;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("KALKULATOR INDEX MASSA TUBUH"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: GestureDetector(
                    onTap: (){
                      gender="male";
                      setState(() {
                        
                      });
                    },
                  child: BmiCard(
                    borderColor: (gender=="male")? Colors.white: primaryColor,
                    child: const GenderIconText(icon: Icons.male, title: 'Pria'),
                  ),
                  )
                  
                  ),
              Expanded(
                child:GestureDetector(
                  onTap: (){
                    gender="female";
                    setState(() {
                      
                    });
                  },
                  child: BmiCard(
                  borderColor: (gender=="female")?Colors.white:primaryColor,
                  child: const GenderIconText(icon: Icons.female,title: 'Wanita')
                ),
                )
                
              ),
            ],
          ),
          BmiCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Tinggi",style: labelTextStyle.copyWith(fontSize: 20,fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("$height",style: numberTextStyle,),
                  Text("cm",style: labelTextStyle,),
                ],
              ),
              Slider(
                value: height.toDouble(), 
                min:80,
                max:200,
                thumbColor: Colors.red,
                activeColor: Colors.white,
                onChanged: (value){
                  height=value.toInt();
                  setState(() {
                    
                  });
                })
            ],)
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                Text("Berat Badan",
                style: labelTextStyle,),
                 BmiCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.15,
                      child: CupertinoPicker(
                        scrollController: FixedExtentScrollController(initialItem: 30),
                        itemExtent: 25, 
                        magnification: 2,
                        useMagnifier: true,
                        onSelectedItemChanged: (val){
                          weight= val+20;
                        }, 
                        children: generateList(20,220),
                        ),
                    ),
                  ],
                  ),
                 ),
               ],
             ),
             ),
             Expanded(child: BmiCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("Usia",
                style: labelTextStyle,),
                Text("$age",style: numberTextStyle,),
                const SizedBox(width: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RawMaterialButton(
                      onPressed: (){
                        age-=1;
                        setState(() {});
                      },
                      elevation: 0,
                      shape: const CircleBorder(),
                      fillColor: Colors.blue,
                      constraints: const BoxConstraints.tightFor(width: 56,height: 56),
                      child: const Icon(Icons.remove,color: Colors.white),
                    ),
                    const SizedBox(width: 10,),
                    RawMaterialButton(
                      onPressed: (){
                        age+=1;
                        setState(() {});
                      },
                      elevation: 0,
                      shape: const CircleBorder(),
                      fillColor: Colors.blue,
                      constraints: const BoxConstraints.tightFor(width: 56,height: 56),
                      child: const Icon(Icons.add, color:Colors.white),
                    ),
                  ],
                )
              ],
              ),
             )
             ),
            ],
          ),
          GestureDetector(
              onTap: () {
                //print(calculateBmi());
                final bmiCalculator=BmiCalculator(height: height,weight: weight);
                bmiCalculator.calculateBmi();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return BmiResultScreen(
                       bmi:bmiCalculator.bmi!,
                    );
                  }),
                );
              },
              child: Container(
                height: 60,
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromARGB(255, 244, 16, 12),
                ),
                
                child: Center(child: Text("Hitung Index Massa Tubuh",style: labelTextStyle.copyWith(fontWeight: FontWeight.bold),)),
              ),
            ),
        ],
      ),
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key, this.child, this.borderColor=primaryColor,
  }) : super(key: key);
  final Widget? child;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      color: Colors.indigoAccent,
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color:borderColor!),
      ),
      margin: const EdgeInsets.all(15),
      child: child
      );
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key, 
    required this.title, 
    required this.icon,
  }) : super(key: key);
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        const SizedBox(height: 15),
        Text(
          title,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
