import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => List.unmodifiable(_tasks);

  void addTask(String title) {
    final newTask = Task(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
    );
    _tasks.insert(0, newTask); // Insert at top
    notifyListeners();
  }

  void deleteTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  void toggleTask(String id) {
    final task = _tasks.firstWhere((task) => task.id == id);
    task.toggleDone();
    notifyListeners();
  }

  void clearAllTasks() {
    _tasks.clear();
    notifyListeners();
  }

  int get completedTaskCount => _tasks.where((task) => task.isDone).length;

  int get totalTaskCount => _tasks.length;
}
