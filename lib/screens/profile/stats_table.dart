import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class StatsTable extends StatefulWidget {
  const StatsTable(this.character, {super.key});

  final Character character;

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  double turns = 0.0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // available points
          Container(
            decoration: BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(
                  color: AppColours.secondaryAccent,
                  width: 2,
                ),
              ),
              borderRadius: BorderRadius.circular(8),
              color: AppColours.secondaryColor,
            ),
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                AnimatedRotation(
                  turns: turns,
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    Icons.star,
                    color: widget.character.points > 0
                        ? Colors.yellowAccent
                        : Colors.grey,
                  ),
                ),
                const SizedBox(width: 20),
                const StyledText("Available Points: "),
                const SizedBox(width: 20),
                StyledHeading(widget.character.points.toString()),
              ],
            ),
          ),

          // stats table
          Table(
            children: widget.character.statsAsList.map((stat) {
              return TableRow(
                // Stat row color

                decoration: BoxDecoration(
                  color: AppColours.secondaryColor.withOpacity(0.5),
                  border: Border.symmetric(
                    horizontal: BorderSide(
                      color: AppColours.secondaryAccent,
                      width: 2,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                children: [
                  // Stat title
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: StyledHeading(stat['title']!),
                    ),
                  ),

                  // Stat value
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: StyledHeading(stat['value']!),
                    ),
                  ),

                  // Buttons to increase and decrease the stat
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_upward),
                          onPressed: () {
                            setState(() {
                              widget.character.increaseStat(stat['title']!);
                              turns -= 0.2;
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_downward),
                          onPressed: () {
                            setState(() {
                              widget.character.decreaseStat(stat['title']!);
                              turns += 0.2;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
