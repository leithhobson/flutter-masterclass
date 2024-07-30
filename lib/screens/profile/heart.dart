import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:provider/provider.dart';

class Heart extends StatefulWidget {
  const Heart({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation _sizeAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );

    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 25, end: 40),
          weight: 40.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 40, end: 25),
          weight: 60.0,
        ),
      ],
    ).animate(_controller);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return IconButton(
          onPressed: () {
            _controller.forward().then((value) {
              _controller.reset();
            });
            Provider.of<CharacterStore>(context, listen: false)
                .toggleFavourite(widget.character);
          },
          iconSize: _sizeAnimation.value,
          icon: Icon(
            widget.character.isFavourite
                ? Icons.favorite
                : Icons.favorite_border,
            color: widget.character.isFavourite
                ? AppColours.primaryColor
                : Colors.grey[800],
          ),
        );
      },
    );
  }
}
