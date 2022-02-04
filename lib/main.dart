import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_webinar/models/student.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'screens/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initial hive//
  Directory appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  Hive.registerAdapter(StudentsAdapter());
  final box = await Hive.openBox("schools"); //register box

  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}
