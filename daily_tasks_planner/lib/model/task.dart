class Task {
  String task;
  DateTime createdAt;

  Task(this.task, this.createdAt);

  factory Task.fromString(String task) {
    return Task(task, DateTime.now());
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      map["task"],
      DateTime.fromMillisecondsSinceEpoch(map["createdAt"]),
    );
  }

  Map<String, dynamic> getMap() {
    return {
      "task": task,
      "createdAt": createdAt.millisecondsSinceEpoch,
    };
  }
}
