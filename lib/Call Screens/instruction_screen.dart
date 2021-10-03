import 'package:flutter/material.dart';

class InstructionSceen extends StatelessWidget {
  const InstructionSceen(
      {required this.title, required this.image, required this.desc});

  final String title;
  final String image;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70.withOpacity(1),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  this.title,
                  style: TextStyle(
                    color: Colors.blueAccent,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Image(
                    image: AssetImage(image),
                    height: 300,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text(
                    this.desc,
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
