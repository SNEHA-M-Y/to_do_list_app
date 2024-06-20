import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final CollectionReference todos =
      FirebaseFirestore.instance.collection('todos');

  void deleteTodos(docId) {
    todos.doc(docId).delete();
  }

  bool checkboxvalue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "To-Dos-List",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Colors.cyan,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: const Icon(
          Icons.add,
          color: Colors.cyan,
          size: 40,
        ),
        backgroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      body: StreamBuilder(
        stream: todos.orderBy('Title').snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot todosSnap = snapshot.data.docs[index];
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Checkbox(
                              value: checkboxvalue,
                              onChanged: (value) {
                                setState(() {
                                  checkboxvalue = !checkboxvalue;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text(
                                  todosSnap['Title'],
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.purple,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  todosSnap['Description'],
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.black),
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/update',
                                      arguments: {
                                        'Title': todosSnap['Title'],
                                        'Description': todosSnap['Description'],
                                        'id': todosSnap.id,
                                      });
                                },
                                icon: const Icon(
                                  Icons.edit_calendar_outlined,
                                  color: Colors.teal,
                                  size: 30,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  deleteTodos(todosSnap.id);
                                },
                                icon: const Icon(
                                  Icons.delete_forever,
                                  color: Colors.red,
                                  size: 30,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                });
          }
          return Container();
        },
      ),
    );
  }
}
