import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:to_do_list_app/home/add.dart';
import 'package:to_do_list_app/home/screen_home.dart';
import 'package:to_do_list_app/home/updatescreen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/': (context) => const ScreenHome(),
        '/add': (context) => const AddList(),
        '/update': (context) => const UpdateList()
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
