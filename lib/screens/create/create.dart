import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/screens/create/vocation_card.dart';
import 'package:flutter_rpg/screens/home/home.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _sloganController = TextEditingController();

  // Clean up controllers

  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  // Vocation on tap handler

  Vocation _selectedVocation = Vocation.junkie;

  void _selectVocation(Vocation vocation) {
    setState(() {
      _selectedVocation = vocation;
      print("Selected vocation: ${_selectedVocation.title}");
    });
  }

  // Submit handler

  void _submit() {
    final String name = _nameController.text.trim();
    final String slogan = _sloganController.text.trim();

    // Validate input
    if (name.isEmpty) {
      print("Name can not be empty");

      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const StyledHeading("Your character needs a name."),
            content:
                const StyledText("Please enter a name for your character."),
            actions: [
              StyledButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const StyledHeading("OK"),
              )
            ],
          );
        },
      );

      return;
    } else if (slogan.isEmpty) {
      print("Slogan can not be empty");

      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const StyledHeading("Your character needs a slogan."),
            content:
                const StyledText("Please enter a slogan for your character."),
            actions: [
              StyledButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const StyledHeading("OK"),
              )
            ],
          );
        },
      );

      return;
    }
    // all validation passed
    else {
      Character newCharacter = Character(
        id: uuid.v8(),
        name: name,
        slogan: slogan,
        vocation: _selectedVocation,
      );

      // Add character to store
      Provider.of<CharacterStore>(context, listen: false)
          .addCharacter(newCharacter);

      // Navigate to home
      Navigator.pop(context);

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (ctx) {
      //       return const Home();
      //     },
      //   ),
      // );
    }

    print("Name: $name, Slogan: $slogan");

    // Create character
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle(
          "Character Creation",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            children: [
              // Welcome message
              Center(
                child: Icon(
                  Icons.code,
                  color: AppColours.primaryColor,
                ),
              ),
              const Center(
                child: StyledHeading(
                  "Welcome, new player.",
                ),
              ),
              const Center(
                child: StyledText(
                  "Let's create your character.",
                ),
              ),
              const SizedBox(height: 30),
              // Character name
              TextField(
                controller: _nameController,
                style: GoogleFonts.kanit(
                    textStyle: Theme.of(context).textTheme.bodyMedium),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  label: StyledText("Character Name"),
                ),
                cursorColor: AppColours.textColor,
              ),
              const SizedBox(height: 20),
              // Character class
              TextField(
                controller: _sloganController,
                style: GoogleFonts.kanit(
                    textStyle: Theme.of(context).textTheme.bodyMedium),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.chat),
                  label: StyledText("Character Slogan"),
                  // border: OutlineInputBorder(),
                ),
                cursorColor: AppColours.textColor,
              ),
              const SizedBox(height: 20),

              // Select vocation title
              Center(
                child: Icon(
                  Icons.code,
                  color: AppColours.primaryColor,
                ),
              ),
              const Center(
                child: const StyledHeading("Select Vocation"),
              ),
              const Center(
                child:
                    const StyledText("This determines your available skills."),
              ),

              const SizedBox(height: 20),

              Center(
                child: VocationCard(
                  vocation: Vocation.junkie,
                  onTap: _selectVocation,
                  selected: _selectedVocation == Vocation.junkie,
                ),
              ),
              Center(
                child: VocationCard(
                  vocation: Vocation.ninja,
                  onTap: _selectVocation,
                  selected: _selectedVocation == Vocation.ninja,
                ),
              ),
              Center(
                child: VocationCard(
                  vocation: Vocation.raider,
                  onTap: _selectVocation,
                  selected: _selectedVocation == Vocation.raider,
                ),
              ),
              Center(
                child: VocationCard(
                  vocation: Vocation.wizard,
                  onTap: _selectVocation,
                  selected: _selectedVocation == Vocation.wizard,
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              // Good luck message
              Center(
                child: Icon(
                  Icons.code,
                  color: AppColours.primaryColor,
                ),
              ),
              const Center(
                child: StyledHeading("Good luck!"),
              ),
              const Center(
                child: StyledText("Your journey is about to begin."),
              ),

              const SizedBox(
                height: 20,
              ),

              Center(
                child: StyledButton(
                    onPressed: () {
                      _submit();
                    },
                    child: const StyledHeading("Create Character")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
