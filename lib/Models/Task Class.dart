class TaskClass {
  final String taskName;
  final String details;
  final DateTime dateTime;

  TaskClass({required this.taskName , required this.details , required this.dateTime});

  @override
  String toString() {
    return 'TaskClass{taskName: $taskName, details: $details, dateTime: $dateTime}';
  }
}