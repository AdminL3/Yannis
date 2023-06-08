import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

class Yannis extends StatelessWidget {
  const Yannis({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Yanniii",
      home: Scaffold(
        body: DraggableExample(),
      ),
    );
  }
}

class DraggableExample extends StatefulWidget {
  const DraggableExample({super.key});

  @override
  State<DraggableExample> createState() => _DraggableExampleState();
}

class _DraggableExampleState extends State<DraggableExample> {
  int acceptedData = 0;
  double width = 0.0;
  double height = 0.0;
  String text = "0";
  Color color = Colors.blue;
  String image = "assets/surfing.png";
  Color previousColor = Colors.blue;
  int highScore = 0;

  @override
  void initState() {
    super.initState();
    loadHighScore();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getpage();
    });
  }

  Color getRandomColor() {
    final random = Random();
    final r = random.nextInt(256);
    final g = random.nextInt(256);
    final b = random.nextInt(256);
    return Color.fromARGB(255, r, g, b);
  }

  void redo() {
    setState(() {
      image = "assets/surfing.png";
    });
  }

  void reset() {
    setState(() {
      color = Colors.deepOrangeAccent[400]!;
      text = "Ooopsi";
      acceptedData = 0;
      image = "assets/tombstone.png";
    });

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        image = "assets/surfing.png";
      });
    });
  }

  void getpage() {
    Random random = Random();
    double pagewidth = MediaQuery.of(context).size.width;
    double x = random.nextDouble() * (pagewidth - 50);
    width = x;

    double pageheight = MediaQuery.of(context).size.height;
    double y = random.nextDouble() * (pageheight - 50);
    height = y;

    setState(() {
      previousColor = color;
      color = getRandomColor();
    });
  }

  Future<void> loadHighScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      highScore = prefs.getInt('highscore') ?? 0;
    });
  }

  Future<void> saveHighScore(int score) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('highscore', score);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: previousColor,
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: color,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 30,
              left: 0,
              child: Text(
                highScore.toString(),
                style: const TextStyle(fontSize: 30),
              ),
            ),
            Positioned(
              top: 280,
              left: 140,
              right: 140,
              bottom: 280,
              child: Draggable<int>(
                data: 10,
                feedback: Image.asset(
                  "assets/surfer.png",
                  width: 100,
                  height: 100,
                ),
                childWhenDragging: Image.asset(
                  "assets/shark.png",
                  width: 100,
                  height: 100,
                ),
                child: Image.asset(
                  image,
                ),
                onDragEnd: (details) {
                  if (details.wasAccepted) {
                    acceptedData++;
                    redo();
                    getpage();
                    setState(() {
                      text = acceptedData.toString();
                      if (acceptedData > highScore) {
                        highScore = acceptedData;
                        saveHighScore(highScore);
                      }
                    });
                  } else {
                    reset();
                  }
                },
              ),
            ),
            Positioned(
              top: height,
              left: width,
              child: DragTarget<int>(
                builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
                ) {
                  return const Icon(
                    Icons.local_hospital,
                    color: Colors.red,
                    size: 100,
                  );
                },
              ),
            ),
            Positioned(
              bottom: 200,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
