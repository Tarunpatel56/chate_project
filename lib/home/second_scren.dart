import 'package:flutter/material.dart';

class SecondScren extends StatefulWidget {
  const SecondScren({super.key});

  @override
  State<SecondScren> createState() => _SecondScrenState();
}

class _SecondScrenState extends State<SecondScren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Git"),
      ),
    );
  }
}