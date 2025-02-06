import 'package:flutter/material.dart';
import 'package:learning_flutter_app/shared/menu_drawer.dart';
import 'package:learning_flutter_app/shared/menu_bottom.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController textHeight = TextEditingController();
  final TextEditingController textWeight = TextEditingController();

  final double fontSize = 18;
  String result = "";
  bool isMetric = true;
  bool isImperial = false;
  double? height;
  double? weight;
  late List<bool> isSelected;

  String heightMessage = "";
  String weightMessage = "";

  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    heightMessage = "Please insert your height in ${(isMetric) ? "meters" : "inch"}";
    weightMessage = "Please insert your weight in ${(isMetric) ? "kilos" : "pounds"}";

    return Scaffold(
      appBar: AppBar(title: Text("BMI Calculator")),
      drawer: MenuDrawer(),
      bottomNavigationBar: MenuBottom(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ToggleButtons(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text("Metric", style: TextStyle(fontSize: fontSize),),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text("Imperial", style: TextStyle(fontSize: fontSize),),
                  ),
                ], 
                isSelected: isSelected,
              onPressed: toggleMeasure,
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: TextField(controller: textHeight, keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: heightMessage
                  ),
                )
            ),
            Padding(
                padding: const EdgeInsets.all(28.0),
                child: TextField(controller: textWeight, keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: weightMessage
                  ),
                )
            ),
            Padding(
                padding: const EdgeInsets.all(32.0),
                child: ElevatedButton(
                    onPressed: findBmi,
                    child: Text("Calculate BMI", style: TextStyle(fontSize: fontSize),)
                )
            ),
            Text(
                result,
              style: TextStyle(fontSize: fontSize),
            )
          ]
        ),
      )
    );
  }

  void toggleMeasure(value) {
    if(value == 0) {
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }
    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }

  void findBmi() {
    double bmi = 0;
    double height = double.tryParse(textHeight.text) ?? 0;
    double weight = double.tryParse(textWeight.text) ?? 0;

    if (isMetric) {
      bmi = weight / (height * height);
    } else {
      bmi = weight * 703 / (height * height);
    }

    setState(() {
      result = "Your BMI is ${bmi.toStringAsFixed(2)}";
    });
  }
}
