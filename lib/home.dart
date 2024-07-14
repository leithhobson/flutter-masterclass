import 'package:flutter/material.dart';
import 'package:flutter_masterclass/styled_body_text.dart';
import 'package:flutter_masterclass/tea_prefs.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Tea Application',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: Colors.red[300],
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Expanded(
              child: Image.asset(
                "assets/img/coffee_bg.jpg",
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: Colors.red[100],
                  padding: const EdgeInsets.all(20),
                  child: const StyledBodyText("How I like my tea"),
                ),
                Container(
                  color: Colors.red[200],
                  padding: const EdgeInsets.all(20),
                  child: const TeaPrefs(),
                ),
              ],
            ),
          ],
        ));
  }
}
