import 'package:flutter/material.dart';
import 'package:flutter_masterclass/styled_body_text.dart';
import 'package:flutter_masterclass/styled_button.dart';

class TeaPrefs extends StatefulWidget {
  const TeaPrefs({super.key});

  @override
  State<TeaPrefs> createState() => _TeaPrefsState();
}

class _TeaPrefsState extends State<TeaPrefs> {
  int _strength = 3;
  int _sugars = 0;

  void _incrementStrength() {
    setState(() {
      _strength = _strength < 5 ? _strength + 1 : 1;
    });
  }

  void _incrementSugars() {
    setState(() {
      _sugars = _sugars < 5 ? _sugars + 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const StyledBodyText("Strength: "),
            // Text("$_strength"),
            // Text("data"),
            for (int i = 0; i < _strength; i++)
              Image.asset(
                "assets/img/coffee_bean.png",
                width: 25,
                color: Colors.red[200],
                colorBlendMode: BlendMode.multiply,
              ),
            const Expanded(
              child: SizedBox(),
            ),
            StyledButton(
              onPressed: _incrementStrength,
              child: const Text("+"),
            )
          ],
        ),
        const Divider(
          height: 1,
          color: Colors.red,
        ),
        Row(
          children: [
            const StyledBodyText("Sugars:   "),
            // Text("$_sugars"),
            if (_sugars == 0) const Text("No sugar"),
            for (int i = 0; i < _sugars; i++) const CountIcon(),
            const Expanded(
              child: SizedBox(),
            ),
            StyledButton(
              onPressed: _incrementSugars,
              child: const Text("+"),
            ),
          ],
        ),
      ],
    );
  }
}

class CountIcon extends StatelessWidget {
  const CountIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/img/sugar_cube.png",
      width: 25,
      color: Colors.red[200],
      colorBlendMode: BlendMode.multiply,
    );
  }
}
