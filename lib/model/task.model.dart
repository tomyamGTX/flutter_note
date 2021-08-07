class Task {
  String title;
  String description;
  String status;

  Task({this.title, this.description,this.status});
}

List<Task> taskList = [
  Task(title: 'Task 1', description: 'Create App', status: 'Incomplete'),
  Task(title: 'Task 2', description: 'Do exercise',status: 'Incomplete'),
  Task(title: 'Task 3', description: 'Watch video',status: 'Incomplete'),
];
