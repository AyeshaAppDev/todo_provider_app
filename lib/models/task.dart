/// Model representing a single task.
class Task {
  final String id;
  final String title;
  bool isDone;
  final DateTime createdAt;

  Task({
    required this.id,
    required this.title,
    this.isDone = false,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  /// Toggle the completion status of the task.
  void toggleDone() {
    isDone = !isDone;
  }

  /// Convert task to map (useful for Firebase or local storage).
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isDone': isDone,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  /// Create a Task from a map.
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      isDone: map['isDone'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}
