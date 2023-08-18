import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_list_application/Services/Task%20Provider.dart';
import 'package:task_list_application/Widgets/Simple%20Input%20Field.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {

  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final detailsController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context,task,_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Add Task" ,style: TextStyle(color: Colors.black87 ,fontWeight: FontWeight.w700)),
            centerTitle: true,
            elevation: 3,
            shadowColor: Colors.black.withOpacity(0.3),
            backgroundColor: Colors.white,
          ),


          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SimpleInputField(
                      controller: titleController,
                      title: "Task Title",
                      hintText: "Please enter task title",
                    inputType: TextInputType.name,
                  ),
                  SimpleInputField(
                      controller: detailsController,
                      title: "Details",
                      hintText: "Please enter task",
                    inputType: TextInputType.name,
                  )

                ],
              ),
            ),
          ),


          floatingActionButton: FloatingActionButton.extended(
              onPressed: (){
                if(formKey.currentState!.validate())
                  {
                    task.addTask(
                      taskName: titleController.text,
                      details: detailsController.text
                    );
                    titleController.clear();
                    detailsController.clear();
                    Navigator.of(context).pop();
                  }
              },
              label: Text("Add Task")
          ),


        );
      }
    );
  }
}
