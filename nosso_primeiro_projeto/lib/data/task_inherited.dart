import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required super.child});

  final List<Task> taskList = [
    Task("Flutter", "assets/images/flutter.png", 3, key: UniqueKey()),
    Task("Bicicleta", "assets/images/bicicleta.png", 2, key: UniqueKey()),
    Task("Ler", "assets/images/ler.png", 3, key: UniqueKey()),
    Task("Futebol", "assets/images/futebol.png", 2, key: UniqueKey()),
    Task("Basquete", "assets/images/basquete.png", 5, key: UniqueKey()),
  ];

  void newTask(String nome, String foto, int dificuldade) {
    taskList.add(Task(nome, foto, dificuldade, key: UniqueKey()));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
