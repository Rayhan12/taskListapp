import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_list_application/Models/Task%20Class.dart';
import 'package:task_list_application/Screens/add%20task.dart';
import 'package:task_list_application/Widgets/Task%20Card.dart';

import '../Services/Task Provider.dart';


class TaskListPage extends StatefulWidget {
  /// Re parm ask.....
  const TaskListPage({Key? key}) : super(key: key);

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {




  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Board" ,style: TextStyle(color: Colors.black87 ,fontWeight: FontWeight.w700)),
        centerTitle: true,
        elevation: 3,
        shadowColor: Colors.black.withOpacity(0.3),
        backgroundColor: Colors.white,
      ),


      body: Consumer<TaskProvider>(
        builder: (context,taskProvider,_) {
          return ListView.builder(
            itemCount: taskProvider.taskList.length,
            reverse: true,
            itemBuilder: (BuildContext context, int index) {
              return TaskCard(
                  index: index,
                  taskName: taskProvider.taskList[index].taskName,
                  details: taskProvider.taskList[index].details,
                  dateTime: taskProvider.taskList[index].dateTime
              );
            },
          );
        }
      ),


      floatingActionButton: Consumer<TaskProvider>(
        builder: (context,taskProvider,_) {
          return FloatingActionButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddTask()));
            },
            backgroundColor: Colors.black,
            child: Icon(Icons.add ,color: Colors.white),

          );
        }
      ),

    );
  }
}



