import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  const Counter(
      {super.key, required this.allCompleted, required this.allToDos});

  final int allCompleted;
  final int allToDos;
  @override
  Widget build(BuildContext context) {
    return
    Padding(
      padding: const EdgeInsets.all(22),
      child: Text(
        "$allCompleted/$allToDos",
        // ignore: prefer_const_constructors
        style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: allCompleted == allToDos ? Colors.green : Colors.white),
      ),
    );
    
  }
}
