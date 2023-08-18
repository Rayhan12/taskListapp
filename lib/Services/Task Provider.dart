
import 'package:flutter/cupertino.dart';

import '../Models/Task Class.dart';

class TaskProvider with ChangeNotifier {
  List<TaskClass> taskList = [];

  void addTask({required String taskName , required String details}){
    taskList.add(
        TaskClass(
            taskName: taskName,
            details: details,
            dateTime: DateTime.now()
        )
    );
    notifyListeners();
  }



}