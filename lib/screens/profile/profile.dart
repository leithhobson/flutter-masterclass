import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

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
              color: AppColours.secondaryColor.withOpacity(0.3),
              child: Row(
                children: [
                  Image.asset(
                    "assets/img/vocations/${character.vocation.image}",
                    width: 140,
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
            const SizedBox(
              height: 20,
            ),
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
                color: AppColours.secondaryColor.withOpacity(0.5),
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

            // save button
          ],
        ),
      ),
    );
  }
}