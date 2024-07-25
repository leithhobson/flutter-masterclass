import 'package:flutter/material.dart';
import 'package:flutter_rpg/screens/home/home.dart';
import 'package:flutter_rpg/theme.dart';

void main() {
  runApp(MaterialApp(
    theme: primaryTheme,
    home: const Home(),
  ));
}

class Sandbox extends StatelessWidget {
  const Sandbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sandbox'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Sandbox'),
      ),
    );
  }
}

enum Priority {
  low,
  medium,
  high,
  urgent,
}
