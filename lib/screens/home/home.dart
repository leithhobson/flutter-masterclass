import 'package:flutter/material.dart';
import 'package:flutter_rpg/screens/create/create.dart';
import 'package:flutter_rpg/screens/home/character_card.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    Provider.of<CharacterStore>(context, listen: false).fetchCharacters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Your Characters'),
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: Consumer<CharacterStore>(
                  builder: (context, value, child) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        Provider.of<CharacterStore>(context, listen: false)
                            .fetchCharacters();
                      },
                      child: ListView.builder(
                        itemCount: value.characters.length,
                        itemBuilder: (_, index) {
                          return Dismissible(
                            key: Key(value.characters[index].id),
                            // Confirm deletion
                            confirmDismiss: (direction) async {
                              return await showDialog(
                                context: context,
                                builder: (ctx) {
                                  return AlertDialog(
                                    title: StyledHeading(
                                        "Delete ${value.characters[index].name}"),
                                    content: const StyledText(
                                        "Are you sure you want to delete this character?"),
                                    actions: [
                                      StyledButton(
                                        onPressed: () {
                                          Navigator.pop(ctx, true);
                                        },
                                        child: const StyledHeading("Be gone!"),
                                      ),
                                      StyledButton(
                                        onPressed: () {
                                          Navigator.pop(ctx, false);
                                        },
                                        child: StyledHeading(
                                            "Save ${value.characters[index].name}!"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            onDismissed: (direction) {
                              // Dialog to confirm deletion
                              Provider.of<CharacterStore>(context,
                                      listen: false)
                                  .deleteCharacter(value.characters[index]);
                            },
                            child: CharacterCard(
                                character: value.characters[index]),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              StyledButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const CreateScreen()));
                },
                child: const StyledHeading("Create Character"),
              ),
            ],
          )),
    );
  }
}
