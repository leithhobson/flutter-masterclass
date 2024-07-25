import 'package:flutter_rpg/models/skill.dart';
import 'package:flutter_rpg/models/stats.dart';
import 'package:flutter_rpg/models/vocation.dart';

class Character with Stats {
  // Fields
  final Set<Skill> skills = {};
  final Vocation vocation;
  final String name;
  final String slogan;
  final String id;
  bool _isFavourite = false;

  // Constructor
  Character({
    required this.name,
    required this.slogan,
    required this.vocation,
    required this.id,
  });

  // Methods

  void toggleFavourite() {
    _isFavourite = !_isFavourite;
  }

  bool get isFavourite => _isFavourite;

  void updateSkills(Skill skill) {
    skills.clear();
    skills.add(skill);
  }

  void addSkill(Skill skill) {
    skills.add(skill);
  }

  void removeSkill(Skill skill) {
    skills.remove(skill);
  }

  void clearSkills() {
    skills.clear();
  }
}

// Dummy character data
final List<Character> characters = [
  Character(
    name: 'Klara',
    slogan: 'The algorithmic sorcerer',
    vocation: Vocation.wizard,
    id: '1',
  ),
  Character(
    name: 'Jonny',
    slogan: 'Light me up',
    vocation: Vocation.junkie,
    id: '2',
  ),
  Character(
    name: 'Rusty',
    slogan: 'Fire in the hole!',
    vocation: Vocation.raider,
    id: '3',
  ),
  Character(
    name: 'Sara',
    slogan: 'The UX ninja',
    vocation: Vocation.ninja,
    id: '4',
  ),
];
