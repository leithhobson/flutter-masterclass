import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/shared/styled_text.dart';

class VocationCard extends StatelessWidget {
  const VocationCard({
    super.key,
    required this.vocation,
    required this.onTap,
    required this.selected,
  });

  final Vocation vocation;
  final void Function(Vocation) onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(vocation);
      },
      child: Card(
        color: selected ? Theme.of(context).primaryColor : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              // Image
              Image.asset(
                "assets/img/vocations/${vocation.image}",
                width: 80,
                colorBlendMode: BlendMode.color,
                color: !selected
                    ? Colors.black.withOpacity(0.9)
                    : Colors.transparent,
              ),

              // Padding(
              //   padding: const EdgeInsets.only(left: 10.0),
              // child:
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StyledHeading(vocation.title),
                    StyledText(vocation.description)
                  ],
                ),
              ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
