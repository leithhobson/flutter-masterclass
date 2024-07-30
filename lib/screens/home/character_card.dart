import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/screens/profile/heart.dart';
import 'package:flutter_rpg/screens/profile/profile.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({super.key, required this.character});

  final Character character;

  void openCharacterProfile(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => Profile(characterId: character.id)));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openCharacterProfile(context);
      },
      child: Stack(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Hero(
                    tag: character.id,
                    child: Image.asset(
                      'assets/img/vocations/${character.vocation.image}',
                      width: 50,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledHeading(character.name),
                        StyledText(character.vocation.title),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      openCharacterProfile(context);
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColours.textColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: -10,
            top: -10,
            child: Heart(character: character),
          ),
        ],
      ),
    );
  }
}
