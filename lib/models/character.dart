import 'package:cloud_firestore/cloud_firestore.dart';
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

  // Character to firestore
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'slogan': slogan,
      'isFavourite': _isFavourite,
      'vocation': vocation.toString().split('.').last,
      'skills': skills.map((skill) => skill.id).toList(),
      'stats': statsAsMap,
      'points': points,
      'isActive': 1,
    };
  }

  // Firestore to character
  factory Character.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    // Get data from snapshot
    final data = snapshot.data()!;

    // Create character instance
    Character character = Character(
      name: data['name'],
      slogan: data['slogan'],
      vocation: Vocation.values.firstWhere(
        (vocation) => vocation.toString() == 'Vocation.${data['vocation']}',
      ),
      // Favorite

      id: snapshot.id,
    );

    // Add skills
    final List<String> skillIds = List<String>.from(data['skills']);
    for (var skillId in skillIds) {
      final skill = allSkills.firstWhere((skill) => skill.id == skillId);
      character.addSkill(skill);
    }

    if (data['isFavourite']) {
      character.toggleFavourite();
    }

    // Add stats
    character.updateStats(points: data['points'], stats: data['stats']);

    return character;
  }

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
