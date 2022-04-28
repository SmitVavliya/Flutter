// ignore_for_file: prefer_const_constructors
import "dart:convert";

import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:shared_preferences/shared_preferences.dart';

import "../model/task.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = "/home-screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  dynamic _taskController;
  List<Task> _tasks = [];
  List<bool> _tasksDone = [];

  void _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Task t = Task.fromString(_taskController.text);
    String? str = prefs.getString("tasks");
    List taskList = json.decode(str.toString()) ?? [];
    taskList.add(json.encode(t.getMap()));
    prefs.setString("tasks", json.encode(taskList));
    _taskController.text = "";
    Navigator.of(context).pop();

    _getTasks();
  }

  void _getTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? str = prefs.getString("tasks");
    List taskList = json.decode(str.toString()) ?? [];
    setState(() {
      _tasks = taskList.map((task) => Task.fromMap(json.decode(task))).toList();
      _tasksDone = taskList.map((task) => false).toList();
    });
  }

  void _updatePendingTasksList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> pendingList = [];
    for (int i = 0; i < _tasks.length; i++) {
      if (!_tasksDone[i]) {
        pendingList.add(json.encode(_tasks[i].getMap()));
      }
    }
    String str = json.encode(pendingList);
    prefs.setString("tasks", str);

    _getTasks();
  }

  void _deleteAllTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("tasks", json.encode([]));

    _getTasks();
  }

  @override
  void initState() {
    super.initState();
    _taskController = TextEditingController();

    _getTasks();
  }

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Task Manager",
          style: GoogleFonts.montserrat(),
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => _updatePendingTasksList(),
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => _deleteAllTasks(),
          )
        ],
      ),
      body: Center(
        child: _tasks.isEmpty
            ? Text(
                "No Tasks Added Yet !!!",
                style: GoogleFonts.montserrat(fontSize: 18),
              )
            : Column(
                children: _tasks
                    .map(
                      (e) => Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        padding: const EdgeInsets.only(left: 10),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 80,
                              child: Text(
                                e.task,
                                style: GoogleFonts.montserrat(),
                              ),
                            ),
                            Checkbox(
                              value: _tasksDone[_tasks.indexOf(e)],
                              onChanged: (value) {
                                setState(() {
                                  _tasksDone[_tasks.indexOf(e)] =
                                      value ?? false;
                                });
                              },
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: Colors.black,
                            width: 0.5,
                          ),
                        ),
                      ),
                    )
                    .toList()),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 30,
        ),
        backgroundColor: Colors.red,
        onPressed: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                height: 230,
                padding: const EdgeInsets.all(10),
                color: Colors.blue[200],
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add Task",
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1.2,
                      color: Colors.white,
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _taskController,
                      autofocus: true,
                      enableInteractiveSelection: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(15),
                        prefixIcon: Icon(Icons.task),
                        label: Text("Task"),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        hintText: "Please Enter your new task",
                        hintStyle: GoogleFonts.montserrat(),
                      ),
                      textAlignVertical: TextAlignVertical.center,
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Container(
                            width: (MediaQuery.of(context).size.width / 2) - 10,
                            padding: const EdgeInsets.all(10),
                            child: ElevatedButton(
                              onPressed: () => _taskController.text = "",
                              child: Text(
                                "RESET",
                                style: GoogleFonts.montserrat(),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.red),
                              ),
                            ),
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width / 2) - 10,
                            padding: const EdgeInsets.all(10),
                            child: ElevatedButton(
                              onPressed: () => _saveData(),
                              child: Text(
                                "ADD",
                                style: GoogleFonts.montserrat(),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.green),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
