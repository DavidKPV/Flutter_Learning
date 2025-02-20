import 'package:flutter/material.dart';
import '../data/shared_preferences_helper.dart';
import '../data/session.dart';

class SessionsScreen extends StatefulWidget {
  const SessionsScreen({super.key});

  @override
  State<SessionsScreen> createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Training Session"),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  Future<dynamic> showSessionDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context)   {
        return AlertDialog();
      }
    );
  }
}
