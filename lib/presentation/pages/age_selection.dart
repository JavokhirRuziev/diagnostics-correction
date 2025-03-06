// screens/age_selection_page.dart
import 'package:child_correction/data/first_boy_colors.dart';
import 'package:child_correction/presentation/pages/character_selection.dart';
import 'package:child_correction/presentation/pages/selection_page.dart';
import 'package:child_correction/presentation/widgets/screen_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/app_bloc.dart';
import '../bloc/app_event.dart';

class AgeSelectionPage extends StatelessWidget {
  const AgeSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background/age_page_background.webp"),
            fit: BoxFit.cover,
            opacity: 0.5,
          ),
        ),
        child: Center(
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[200],
                          shadowColor: Colors.black,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          context.read<AppBloc>().add(SelectAge(3));
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CharacterSelectionPage()),
                          );
                        },
                        child: const Text('2-3 yosh'),
                      ),
                      const SizedBox(width: 10), // Space between buttons
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow[200],
                          shadowColor: Colors.black,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          context.read<AppBloc>().add(SelectAge(5));
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CharacterSelectionPage()),
                          );
                        },
                        child: const Text('4-5 yosh'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[300],
                          shadowColor: Colors.black,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          context.read<AppBloc>().add(SelectAge(7));
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CharacterSelectionPage()),
                          );
                        },
                        child: const Text('6-7 yosh'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  const Text(
                    "Yoshni tanlang",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  )
                ],
              ),
              const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
