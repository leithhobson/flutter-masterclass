import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Image.asset(
              'assets/img/vocations/${character.vocation.image}',
              width: 50,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyledHeading(character.name),
                StyledText(character.vocation.title),
              ],
            ),
            const Expanded(child: SizedBox()),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_ios,
                color: AppColours.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
