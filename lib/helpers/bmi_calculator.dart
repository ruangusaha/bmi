import 'package:bmi/constants/constant.dart';

class BmiCalculator{
  int? height;
  int? weight;
  double? bmi;
  String? bmiCategory;
  String? bmiDescription;

  BmiCalculator({required this.height, required this.weight});
  BmiCalculator.fromBmiValue(this.bmi){
    
  }

  double calculateBmi(){
    double heightInMeter=height!/100;
    //final h=pow(heightInMeter, 2);
    final h=(heightInMeter*heightInMeter);
    bmi=weight!/h;
    return bmi!;
  }
   String? determineBmiCategory(){
    String category="";
    if(bmi!<16.0){category=underweightSevere;}
    else if(bmi!<17){category=underweightModerate;}
    else if(bmi!<18.5){category=underweightMild;}
    else if(bmi!<25){category=normal;}
    else if(bmi!<30){category=overweight;}
    else if(bmi!<35){category=obeseI;}
    else if(bmi!<40){category=obeseII;}
    else if(bmi!>=40){category=obeseIII;}
    bmiCategory=category;
    return bmiCategory!;
  }

  String getHealhRiskDescription(){
    String desc="";
    switch(bmiCategory!){  
      case underweightSevere:
      case underweightModerate:
      case underweightMild:
        desc="Resiko kekurangan Nutrisi dan Osteoporosis";
      break; 
      case normal:
        desc="Resiko rendah gangguan kesehatan karena berada pada level normal";
      break; 
      case overweight:
        desc="Resiko sedang serangan jantung, kenaikan tekanan darah";
      break; 
      case obeseI:
      case obeseII:
      case obeseIII:
        desc="Resiko tinggi serangan jantung, tekanan darah tinggi";
      break; 
    }
    bmiDescription=desc;
    return desc;
  }
}