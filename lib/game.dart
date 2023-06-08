import 'package:flutter/material.dart';

class FlutterAppl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.greenAccent[400],
          child: Stack(
            children: [
              Positioned(
                top: 100,
                left: 20,
                right: 280,
                child: Container(
                  color: Colors.black,
                  height: 100,
                ),
              ),
              Positioned(
                top: 100,
                left: 150,
                right: 150,
                child: Container(
                  color: Colors.black,
                  height: 100,
                ),
              ),
              Positioned(
                top: 100,
                left: 280,
                right: 20,
                child: Container(
                  color: Colors.black,
                  height: 100,
                ),
              ),
              Positioned(
                top: 280,
                left: 140,
                right: 140,
                bottom: 280,
                child: Container(
                  color: Colors.red,
                ),
              ),
              Positioned(
                top: 290,
                left: 20,
                right: 280,
                child: Container(
                  color: Colors.black,
                  height: 100,
                ),
              ),
              Positioned(
                top: 290,
                left: 280,
                right: 20,
                child: Container(
                  color: Colors.black,
                  height: 100,
                ),
              ),
              Positioned(
                bottom: 100,
                left: 20,
                right: 280,
                child: Container(
                  color: Colors.black,
                  height: 100,
                ),
              ),
              Positioned(
                bottom: 100,
                left: 150,
                right: 150,
                child: Container(
                  color: Colors.black,
                  height: 100,
                ),
              ),
              Positioned(
                bottom: 100,
                left: 280,
                right: 20,
                child: Container(
                  color: Colors.black,
                  height: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
