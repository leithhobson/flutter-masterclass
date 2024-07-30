import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/screens/profile/skill_list.dart';
import 'package:flutter_rpg/screens/profile/stats_table.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle(character.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // basic info - image, vocation, vocation description
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: AppColours.secondaryColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Hero(
                    tag: character.id,
                    child: Image.asset(
                      "assets/img/vocations/${character.vocation.image}",
                      width: 140,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledHeading(character.vocation.title),
                        StyledText(character.vocation.description),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //image

            // weapons and abilities
            Center(
              child: Icon(
                Icons.code,
                color: AppColours.primaryColor,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColours.secondaryColor.withOpacity(0.5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const StyledHeading("Slogan"),
                    StyledText(character.slogan),
                    const SizedBox(
                      height: 10,
                    ),
                    const StyledHeading("Weapon of Choice"),
                    StyledText(character.vocation.weapon),
                    const SizedBox(
                      height: 10,
                    ),
                    const StyledHeading("Unique Ability"),
                    StyledText(character.vocation.ability),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            // stats and skills

            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  StatsTable(character),
                  SkillList(character),
                ],
              ),
            ),

            // save button
            StyledButton(
              onPressed: () {
                Provider.of<CharacterStore>(context, listen: false)
                    .saveCharacter(character);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const StyledHeading("Character saved"),
                    showCloseIcon: true,
                    duration: const Duration(seconds: 2),
                    backgroundColor: AppColours.secondaryColor,
                  ),
                );
              },
              child: const StyledHeading("Save Character"),
            ),

            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
