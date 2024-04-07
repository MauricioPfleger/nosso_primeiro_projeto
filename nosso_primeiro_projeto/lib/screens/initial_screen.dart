import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/task.dart';
import 'package:nosso_primeiro_projeto/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({
    super.key,
  });

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;

  List<Task> tasks = [
    Task("Flutter", "assets/images/flutter.png", 3, key: UniqueKey()),
    Task("Bicicleta", "assets/images/bicicleta.png", 2, key: UniqueKey()),
    Task("Ler", "assets/images/ler.png", 3, key: UniqueKey()),
    Task("Futebol", "assets/images/futebol.png", 2, key: UniqueKey()),
    Task("Basquete", "assets/images/basquete.png", 5, key: UniqueKey()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text("Tarefas"),
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: Row(
          children: [
            ListView(
              children: tasks,
            ),
            const SizedBox(
              height: 80,
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(left: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    for (var task in tasks) {
                      if (task is Task) {
                        task.resetNivel();
                      }
                    }
                  });
                },
                child: const Icon(Icons.replay),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    opacidade = !opacidade;
                  });
                },
                child: const Icon(Icons.remove_red_eye),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FormScreen()));
                },
                child: const Icon(Icons.add_circle_outline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
