import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rpg/models/character.dart';

class FirestoreService {
  static final ref =
      FirebaseFirestore.instance.collection('characters').withConverter(
            fromFirestore: Character.fromFirestore,
            toFirestore: (Character c, _) => c.toFirestore(),
          );

  // Add character
  static Future<void> addCharacter(Character character) async {
    await ref.doc(character.id).set(character);
  }

  // Get characters once
  static Future<QuerySnapshot<Character>> getCharacters() {
    return ref.get();
  }

  // Update character
  static Future<void> updateCharacter(Character character) async {
    await ref.doc(character.id).update({
      'stats': character.statsAsMap,
      'points': character.points,
      'skills': character.skills.map((skill) => skill.id).toList(),
      'isFavourite': character.isFavourite,
    });
  }

  // Delete character
  static Future<void> deleteCharacter(String id) async {
    await ref.doc(id).delete();
  }
}
