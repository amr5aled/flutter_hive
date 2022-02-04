import 'package:flutter/material.dart';
import 'package:flutter_webinar/models/student.dart';
import 'package:flutter_webinar/models/student.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/student.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _gradeController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Hive.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: _buildBody());
  }

  _buildBody() {
    return Column(
      children: [_buildStudents(), _buildFormStudent()],
    );
  }

  _buildStudents() {
    return Expanded(
        // ignore: deprecated_member_use
        child: WatchBoxBuilder(
      box: Hive.box("schools"),
      // ignore: non_constant_identifier_names
      builder: (BuildContext context, Student) {
        return ListView.builder(
            itemCount: Student.length,
            itemBuilder: (context, index) {
              // Students stud = Student.get(index);
              List<Students> stud = Student.values.toList();
              return ListTile(
                title: Text(stud.name!),
                subtitle: Text(stud.grade!.toString()),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          Student.putAt(
                              index, Students(name: "hamada", grade: 50));
                        },
                        icon: Icon(Icons.refresh_rounded)),
                    IconButton(
                        onPressed: () async {
                          await Student.deleteAt(index);
                          setState(() {});
                        },
                        icon: Icon(Icons.delete)),
                  ],
                ),
              );
            });
      },
    ));
  }

  _buildFormStudent() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(label: Text("name")),
          ),
          TextFormField(
            controller: _gradeController,
            decoration: const InputDecoration(label: Text("grade")),
          ),
          TextButton(
              onPressed: () {
                formKey.currentState!.save();
                Students students = Students(
                    name: _nameController.text,
                    grade: int.parse(_gradeController.text));
                Hive.box("schools").add(students);
              },
              child: Text("add"))
        ],
      ),
    );
  }
}
