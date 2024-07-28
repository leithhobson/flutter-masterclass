mixin Stats {
  int _points = 10;
  int _health = 10;
  int _attack = 10;
  int _defense = 10;
  int _skill = 10;

  // Getters
  int get points => _points;
  int get health => _health;
  int get attack => _attack;
  int get defense => _defense;
  int get skill => _skill;

  Map<String, int> get statsAsMap => {
        'health': _health,
        'attack': _attack,
        'defense': _defense,
        'skill': _skill,
      };

  List<Map<String, String>> get statsAsList => [
        {'title': 'health', 'value': _health.toString()},
        {'title': 'attack', 'value': _attack.toString()},
        {'title': 'defense', 'value': _defense.toString()},
        {'title': 'skill', 'value': _skill.toString()},
      ];

  // Methods

  // Increase the stat by 1 and decrease the points by 1
  void increaseStat(String stat) {
    if (_points > 0) {
      switch (stat) {
        case 'health':
          _health++;
          break;
        case 'attack':
          _attack++;
          break;
        case 'defense':
          _defense++;
          break;
        case 'skill':
          _skill++;
          break;
        default:
          return;
      }
      _points--;
    }
  }

  // Decrease the stat by 1 and increase the points by 1
  void decreaseStat(String stat) {
    switch (stat) {
      case 'health':
        if (_health > 5) {
          _health--;
          _points++;
        }
        break;
      case 'attack':
        if (_attack > 5) {
          _attack--;
          _points++;
        }
        break;
      case 'defense':
        if (_defense > 5) {
          _defense--;
          _points++;
        }
        break;
      case 'skill':
        if (_skill > 5) {
          _skill--;
          _points++;
        }
        break;
    }
  }
}
