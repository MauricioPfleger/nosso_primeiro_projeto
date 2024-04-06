import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/difficulty.dart';

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;
  final _TaskState state;

  Task(this.nome, this.foto, this.dificuldade, {required Key key})
      : state = _TaskState(),
        super(key: key);

  void resetNivel() {
    state.resetNivel(); // Chama o método resetNivel de _TaskState
  }

  @override
  State<Task> createState() => state;
}

class _TaskState extends State<Task> {
  int nivel = 0;

  void resetNivel() {
    setState(() {
      nivel = 0;
    });
  }

  Color setColorDifficult(int nivel) {
    if (nivel == 0) {
      return Colors.red[300]!;
    } else {
      return (((nivel / widget.dificuldade) / 10) <= 0.3333333333)
          ? Colors.red[300]!
          : (((nivel / widget.dificuldade) / 10) <= 0.6666666666)
              ? Colors.yellow[800]!
              : Colors.green[300]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color? colorDifficult = setColorDifficult(nivel);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: colorDifficult,
            ),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey[300]),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[300]),
                      width: 70,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(widget.foto, fit: BoxFit.fill),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.nome,
                            style: const TextStyle(fontSize: 24),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Difficulty(
                          difficultyLevel: widget.dificuldade,
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      height: 50,
                      width: 72,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (((nivel / widget.dificuldade) / 10) < 1)
                                nivel++;
                            });
                          },
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [Icon(Icons.arrow_drop_up), Text("Up")],
                          )),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                            color: Colors.blue,
                            value: (widget.dificuldade > 0)
                                ? ((nivel / widget.dificuldade) / 10)
                                : 1)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Nivel: $nivel",
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
