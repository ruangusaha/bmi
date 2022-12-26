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
        title: const Text("Hasil Perhitungan BMI"),
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
                style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white),
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
                    style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                  Text(
                    bmi.toStringAsFixed(1),
                    style: const TextStyle(fontSize: 100,fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                  Text(
                    bmiCalculator.bmiDescription??"",
                    style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),
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
                color: const Color.fromARGB(255, 244, 16, 12),
                child: const Center(child: Text("Hitung Ulang",style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold))),
              ),
            ),
      ],
      ),
    );
  }
}
