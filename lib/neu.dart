import 'package:flutter/material.dart';
import 'dart:math';

class DraggableExampleApp extends StatelessWidget {
  const DraggableExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Yanniiii",
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
  late String text = "0";
  String image = "assets/surfing.png";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getpage();
    });
  }

  void redo() {
    setState(() {
      image = "assets/surfing.png";
    });
  }

  void reset() {
    setState(() {
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
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
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
    );
  }
}
