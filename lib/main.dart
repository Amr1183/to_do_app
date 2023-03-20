// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:to_do_app/todo-card.dart';
import 'counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDoApp(),
    );
  }
}

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class Tasks {
  String title;
  bool status;
  Tasks({required this.title, required this.status});
}

class _ToDoAppState extends State<ToDoApp> {
  String taskTitle = "";
  final myController = TextEditingController();

  List allTasks = [
    Tasks(title: "Publish video", status: true),
    Tasks(title: "Withdraw 300 dollar", status: true),
    Tasks(title: "Gym", status: true),
    Tasks(title: "Call mom", status: true),
  ];

  delete(int clickedTask) {
    setState(() {
      allTasks.remove(allTasks[clickedTask]);
    });
  }

   deleteAllTasks(){
    setState(() {
      allTasks.removeRange(0, allTasks.length);
    });
   }
  changeStatus(int taskIndex) {
    setState(() {
      allTasks[taskIndex].status = !allTasks[taskIndex].status;
    });
  }

  addNewTask() {
    setState(() {
      allTasks.add(Tasks(title: myController.text, status: false));
    });
  }

  printFunc() {
    setState(() {
      taskTitle = myController.text;
    });
  }

  calculateCompletedTasks() {
    int completedTasks = 0;
    allTasks.forEach((item) {
      if (item.status) {
        completedTasks++;
      }
    });
    return completedTasks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  deleteAllTasks();
                },
                icon: Icon(Icons.delete))
          ],
          title: Text(
            "To Do",
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(58, 66, 86, 1)),
      body: SizedBox(
        width: double.infinity,
        // ignore: prefer_const_literals_to_create_immutables
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          // ignore: deprecated_member_use
          Counter(
              allToDos: allTasks.length,
              allCompleted: calculateCompletedTasks()),

          SizedBox(
            height: 630,
            child: ListView.builder(
                itemCount: allTasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return ToDoCard(
                      varTitle: allTasks[index].title,
                      doneOrNot: allTasks[index].status,
                      changeStatus: changeStatus,
                      index: index,
                      delete: delete);
                }),
          )

          // ignore: prefer_const_literals_to_create_immutables
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.grey[700],
                        borderRadius: BorderRadius.circular(11)),
                    child: Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            controller: myController,
                            decoration: InputDecoration(
                                hintText: "Enter your new task",
                                hintStyle: TextStyle(
                                    fontSize: 20, color: Colors.white)),
                          ),
                          SizedBox(height: 25),
                          TextButton(
                              onPressed: () {
                                addNewTask();
                                Navigator.pop(context);
                              },
                              child: Text("ADD",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)))
                        ],
                      ),
                    )),
              );
            },
          );
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
    );
  }
}
