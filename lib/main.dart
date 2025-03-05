import 'package:flutter/material.dart';
import 'package:learning_flutter_app/screens/bmi_screen.dart';
import 'package:learning_flutter_app/screens/intro_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: "dependencies.env");
  runApp(const GlobeApp());
}

class GlobeApp extends StatelessWidget {
  const GlobeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        '/': (context) => IntroScreen(),
        '/bmi': (context) => BmiScreen()
      },
      initialRoute: '/',
    );
  }
}
