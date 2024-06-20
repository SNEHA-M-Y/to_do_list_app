import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateList extends StatefulWidget {
  const UpdateList({super.key});

  @override
  State<UpdateList> createState() => _UpdateListState();
}

class _UpdateListState extends State<UpdateList> {
  final CollectionReference todos =
      FirebaseFirestore.instance.collection('todos');

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  void updateToDos(docId) {
    final data = {'Title': title.text, 'Description': description.text};

    todos.doc(docId).update(data).then((onValue) => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    title.text = args['Title'];
    description.text = args['Description'];
    final docId = args['id'];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          " Update To-Dos-List",
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
                updateToDos(docId);
              },
              child: const Text(
                "Update",
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
