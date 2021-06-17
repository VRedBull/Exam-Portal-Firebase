import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:navodaya_exam_portal/screens/student.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root
  // of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase',
      home: AddData(),
    );
  }
}

class AddData extends StatelessWidget {
  int counter = 1;
  void incCounter() {
    counter++;
  }

  int ansCounter = 1;
  void incAnsCounter() {
    ansCounter++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[400],
        title: Text("Navoydaya Exam Portal Teacher"),
      ),
      body: Center(
        child: Column(
          children: [
            FloatingActionButton(
              backgroundColor: Colors.green,
              child: Icon(Icons.add),
              onPressed: () {
                FirebaseFirestore.instance.collection('data').add({'text': 'data added through app'});
              },
            ),
            FloatingActionButton(
              backgroundColor: Colors.purple,
              child: Icon(Icons.add),
              onPressed: () {
                FirebaseFirestore.instance.collection('questions').add({'textque': 'question $counter'});
                incCounter();
              },
            ),
            FloatingActionButton(
              backgroundColor: Colors.red,
              child: Icon(Icons.add),
              onPressed: () {
                FirebaseFirestore.instance.collection('answer').add({'ans': 'answer $ansCounter'});
                incAnsCounter();
              },
            ),
          ],
        ),
      ),
    );
  }
}
