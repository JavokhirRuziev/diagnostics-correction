import 'package:child_correction/presentation/pages/final_page.dart';
import 'package:child_correction/presentation/pages/selection_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/app_bloc.dart';
import '../bloc/app_event.dart';
import 'age_selection.dart';

class ProfessionSelectionPage extends StatefulWidget {
  const ProfessionSelectionPage({super.key});

  @override
  State<ProfessionSelectionPage> createState() =>
      _ProfessionSelectionPageState();
}

class _ProfessionSelectionPageState extends State<ProfessionSelectionPage> {
  final List<String> professionImages = [
    'assets/images/next/profession/chef.png',
    'assets/images/next/profession/fireman.png',
    'assets/images/next/profession/police.png',
  ];

  late String selectedProfession;

  @override
  void initState() {
    selectedProfession = professionImages[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/images/background/professions_background.webp"),
            fit: BoxFit.cover,
            opacity: 0.4,
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
                    const SizedBox(height: 20),
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                          width: 180,
                          height: 180,
                          padding: const EdgeInsets.all(16),
                          child: Image.asset(selectedProfession,
                              fit: BoxFit.contain)),
                    ),
                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: professionImages.map((profession) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedProfession = profession;
                            });
                            context
                                .read<AppBloc>()
                                .add(UpdateProfession(profession));
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: selectedProfession == profession
                                    ? Colors.blueAccent
                                    : Colors.white,
                                width: selectedProfession == profession ? 3 : 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                if (selectedProfession == profession)
                                  const BoxShadow(
                                    color: Colors.blueAccent,
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                  ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  Image.asset(profession, fit: BoxFit.contain),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 30),

                    // Select Button
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: selectedProfession != null
                          ? () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const FinalPage()),
                              );
                            }
                          : null,
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
