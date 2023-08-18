import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  final String taskName;
  final String details;
  final DateTime dateTime;
  final int index;
  const TaskCard({Key? key, required this.taskName, required this.details, required this.dateTime, required this.index}) : super(key: key);

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xfff2f3f8),
          borderRadius: BorderRadius.circular(10)
      ),
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(
          top: 10,
          bottom: 0,
          left: 15,
          right: 15
      ),

      child: Row(
        children: [
          CircleAvatar(
            child: Text(widget.index.toString() ,style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.black87,
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.taskName,style: TextStyle(fontSize: 16 ,fontWeight:FontWeight.w700 ),),
                Text(widget.details),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text(widget.dateTime.toString().split(".")[0])
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
