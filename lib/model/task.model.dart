class Task {
  String title;
  String description;

  Task({required this.title, required this.description});

  static Task fromMap(Map<String, dynamic> data) {
    return Task(
        title: data['title'] as String,
        description: data['description'] as String);
  }

  Map<String, Object> toMap() {
    return {
      'title': title,
      'description': description,
    };
  }
}


