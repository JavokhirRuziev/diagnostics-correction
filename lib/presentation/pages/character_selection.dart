import 'package:child_correction/presentation/pages/dress_selection.dart';
import 'package:child_correction/presentation/pages/selection_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/image_paths.dart';
import '../bloc/app_bloc.dart';
import '../bloc/app_event.dart';
import '../bloc/app_state.dart';
import 'age_selection.dart';

class CharacterSelectionPage extends StatefulWidget {
  const CharacterSelectionPage({super.key});

  @override
  State<CharacterSelectionPage> createState() => _CharacterSelectionPageState();
}

class _CharacterSelectionPageState extends State<CharacterSelectionPage> {
  late String selectedCharacter;

  final List<String> characterImages = [
    'assets/images/${ImagePaths.firstBoyText}/${ImagePaths.firstLook}/${ImagePaths.blueColor}.png',
    'assets/images/${ImagePaths.secondBoyText}/${ImagePaths.secondLook}/${ImagePaths.blueColor}.png',
  ];

  @override
  void initState() {
    super.initState();
    selectedCharacter = characterImages[0]; // First image is selected by default
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background/character_background.webp"),
            fit: BoxFit.cover,
            opacity: 0.5,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: IconButton(
                        onPressed: () {
                          context.read<AppBloc>().add(ResetState());
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SelectionPage(),
                            ),
                                (route) => false,
                          );
                        },
                        icon: SizedBox(
                          width: 35,
                          child: Image.asset("assets/images/home_icon.png"),
                        ),
                      ),
                    ),
                  ),
                ),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Selected Character Card
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        width: 180,
                        height: 180,
                        padding: const EdgeInsets.all(16),
                        child: Image.asset(selectedCharacter, fit: BoxFit.contain),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Character Selection Options
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: characterImages.map((character) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCharacter = character;
                            });
                            context.read<AppBloc>().add(UpdateCharacterNumber(
                              selectedCharacter == characterImages[0]
                                  ? ImagePaths.firstBoyText
                                  : ImagePaths.secondBoyText,
                            ));
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: selectedCharacter == character ? Colors.blueAccent : Colors.white,
                                width: selectedCharacter == character ? 3 : 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                if (selectedCharacter == character)
                                  const BoxShadow(
                                    color: Colors.blueAccent,
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                  ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(character, fit: BoxFit.contain),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 30),

                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const DressSelection()),
                        );
                      },
                      icon: const Icon(Icons.check_circle, color: Colors.white),
                      label: const Text(
                        "Tanlash",
                        style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
