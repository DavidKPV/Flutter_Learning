import 'package:flutter/material.dart';
import 'package:learning_flutter_app/shared/menu_bottom.dart';
import 'package:learning_flutter_app/shared/menu_drawer.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Globo Fitness"),),
      drawer: MenuDrawer(),
      bottomNavigationBar: MenuBottom(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover
            )
        ),
        child: Center(
          child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white38
              ),
              child: Text(
                "Commit to be fit,\ndare to be great with\nGlobo Fitness",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    shadows: [
                      Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 2.0,
                          color: Colors.white
                      )
                    ]
                ),
              )
          ),
        ),
      ),
    );
  }
}
