import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddList extends StatefulWidget {
  const AddList({super.key});

  @override
  State<AddList> createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  final CollectionReference todos =
      FirebaseFirestore.instance.collection('todos');

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  void addToDos() {
    final data = {'Title': title.text, 'Description': description.text};
    todos.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          " Add fields to To-Dos-List",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: title,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text("Title")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: description,
                keyboardType: TextInputType.multiline,
                maxLength: 250,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text("Description")),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                addToDos();
                Navigator.pop(context);
              },
              child: const Text(
                "Done",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.cyan),
            )
          ],
        ),
      ),
    );
  }
}
