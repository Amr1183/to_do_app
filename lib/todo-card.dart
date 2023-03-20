// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ToDoCard extends StatelessWidget {
  final String varTitle;
  final bool doneOrNot;
  final Function changeStatus;
  final int index;
  final Function delete;
  const ToDoCard(
      {super.key,
      required this.varTitle,
      required this.doneOrNot,
      required this.index,
      required this.changeStatus,
      required this.delete});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeStatus(index);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.all(22),
          decoration: BoxDecoration(
              color: Color.fromRGBO(209, 224, 224, 0.2),
              borderRadius: BorderRadius.circular(11)),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  varTitle,
                  style: TextStyle(
                      decoration: doneOrNot
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fontSize: 22,
                      color: doneOrNot ? Colors.grey : Colors.white),
                ),
                Row(
                  children: [
                    Icon(doneOrNot ? Icons.check : Icons.close,
                        size: 27, color: doneOrNot ? Colors.green : Colors.red),
                    IconButton(
                        onPressed: () {
                          delete(index);
                        },
                        icon: Icon(Icons.delete_forever,
                            size: 37, color: Color.fromARGB(255, 228, 79, 68)))
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
