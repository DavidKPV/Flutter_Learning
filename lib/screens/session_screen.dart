import 'package:flutter/material.dart';
import '../data/shared_preferences_helper.dart';
import '../data/session.dart';

class SessionsScreen extends StatefulWidget {
  const SessionsScreen({super.key});

  @override
  State<SessionsScreen> createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen> {
  List<Session> sessions = [];
  final TextEditingController textDescription = TextEditingController();
  final TextEditingController textDuration = TextEditingController();
  final SharedPreferencesHelper spHelper = SharedPreferencesHelper();

  @override
  void initState() {
    spHelper.init().then((value) {updateScreen();});
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Training Session"),
      ),
      body: ListView(children: getContent()),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showSessionDialog(context);
          },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<dynamic> showSessionDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context)   {
        return AlertDialog(
          title: Text("Insert Training Session"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: textDescription,
                  decoration: InputDecoration(
                    hintText: "Description",
                  ),
                ),
                TextField(
                  controller: textDuration,
                  decoration: InputDecoration(
                    hintText: "Duration",
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  textDescription.text = "";
                  textDuration.text = "";
                }, 
                child: Text("Cancel")
            ),
            ElevatedButton(
                onPressed: saveSession, 
                child: Text("Save")
            )
          ],
        );
      }
    );
  }

  Future saveSession() async {
    DateTime now = DateTime.now();
    String today = "${now.year}-${now.month}-${now.day}";
    int id = spHelper.getCounter() + 1;
    Session newSession = Session(
        id, today, textDescription.text, int.tryParse(textDuration.text) ?? 0);
    spHelper.writeSession(newSession).then(
            (_) {
              updateScreen();
              spHelper.setCounter();
            }
    );
    textDescription.text = "";
    textDuration.text = "";
    Navigator.pop(context);
  }
  
  List<Widget> getContent() {
    List<Widget> tiles = [];
    sessions.forEach((session) {
      tiles.add(
        Dismissible(
          key: UniqueKey(),
          onDismissed: (_) {
            spHelper.deleteSession(session.id).then((_) {updateScreen();});
          },
          child: ListTile(
            title: Text(session.description),
            subtitle: Text("${session.date} - duration: ${session.duration} min"),
          ),
        )
      );
    });
    return tiles;
  }

  void updateScreen() {
    sessions = spHelper.getSessions();
    setState(() {});
  }
}
