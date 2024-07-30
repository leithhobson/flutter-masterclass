import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/services/firestore_service.dart';

class CharacterStore extends ChangeNotifier {
  final List<Character> _characters = [];

  List<Character> get characters => _characters;

  void addCharacter(Character character) {
    FirestoreService.addCharacter(character);
    _characters.add(character);
    notifyListeners();
  }

  // Save (update) character
  Future<void> saveCharacter(Character character) async {
    await FirestoreService.updateCharacter(character);
    // final index = _characters.indexWhere((c) => c.id == character.id);
    // _characters[index] = character;
    // notifyListeners();
  }

  // Delete character
  void deleteCharacter(Character character) {
    FirestoreService.deleteCharacter(character.id);
    _characters.remove(character);
    notifyListeners();
  }

  // Fetch characters
  void fetchCharacters() async {
    // if (_characters.isNotEmpty) return;
    final snapshot = await FirestoreService.getCharacters();
    _characters.clear();
    for (var doc in snapshot.docs) {
      _characters.add(doc.data());
    }
    notifyListeners();
  }

  // Toggle favourite
  void toggleFavourite(Character character) {
    character.toggleFavourite();
    notifyListeners();
    saveCharacter(character);
  }
}
