class Task {
  String title;
  String description;
  String? status;

  Task({required this.title, required this.description, this.status});
}

List<Task> taskList = [
  Task(title: 'Task 1', description: 'Create App', status: 'Completed'),
  Task(title: 'Task 2', description: 'Do exercise',status: 'Completed'),
  Task(title: 'Task 3', description: 'Watch video',status: 'Incomplete'),
  Task(title: 'Task 4',description: 'Watch video'),
  Task(title: 'Task 5', description: 'Deploy'),
];
