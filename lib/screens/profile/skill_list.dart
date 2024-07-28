import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/skill.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class SkillList extends StatefulWidget {
  const SkillList(this.character, {super.key});

  final Character character;

  @override
  State<SkillList> createState() => _SkillListState();
}

class _SkillListState extends State<SkillList> {
  late List<Skill> _availableSkills;

  late Skill _selectedSkill;

  @override
  void initState() {
    _availableSkills = allSkills.where((skill) {
      return skill.vocation == widget.character.vocation;
    }).toList();
    _selectedSkill = widget.character.skills.isEmpty
        ? _availableSkills[0]
        : widget.character.skills.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColours.secondaryColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              const StyledHeading("Choose an active skill"),
              const StyledText("Skills are unique to your vocation"),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _availableSkills.map((skill) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.character.updateSkills(skill);
                          _selectedSkill = widget.character.skills.first;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(2),
                        color: skill == _selectedSkill
                            ? AppColours.primaryColor
                            : AppColours.secondaryColor,
                        child: Image.asset(
                          "assets/img/skills/${skill.image}",
                          width: 70,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 10),
              StyledText(_selectedSkill.name),
            ],
          )),
    );
  }
}
