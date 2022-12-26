import 'package:bmi/constants/constant.dart';
import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:bmi/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';
class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({Key? key, required this.bmi, this.bmiCalculator}) : super(key: key);
  final double bmi;
  final BmiCalculator? bmiCalculator;

  @override
  Widget build(BuildContext context) 
  {
    final BmiCalculator bmiCalculator=BmiCalculator.fromBmiValue(bmi);
    //final bmiCategory=
    bmiCalculator.determineBmiCategory();
    //final bmiDesc=
    bmiCalculator.getHealhRiskDescription();
    return Scaffold
    (
      appBar: AppBar
      (
        title: const Center(child:  Text("HASIL PERHITUNGAN")),
      ),
      body: Column
      (
        children: 
        [
          const Expanded
          (
            child: Center
            (
              child: Text
              (
                "Hasil Perhitungan",
                style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: primaryColor),
              ),
            ),
          ),
          Expanded
          (
            flex: 5,
            child: BmiCard(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: 
                [
                  Text(
                    bmiCalculator.bmiCategory??"",
                    style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: primaryColor),
                    ),
                  Text(
                    bmi.toStringAsFixed(1),
                    style: const TextStyle(fontSize: 100,fontWeight: FontWeight.bold,color: primaryColor),
                    ),
                  Text(
                    bmiCalculator.bmiDescription??"",
                    style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: primaryColor),
                    ),
                ],
              ),
                )
                          
            ),
          ),
          GestureDetector
          (
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 80,
                color: const Color(0xff517DF6),
                child: const Center(child: Text("Hitung Ulang",style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold))),
              ),
            ),
      ],
      ),
    );
  }
}
