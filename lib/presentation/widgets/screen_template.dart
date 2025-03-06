import 'package:child_correction/data/selection_options.dart';
import 'package:child_correction/presentation/bloc/app_event.dart';
import 'package:child_correction/presentation/pages/age_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app_bloc.dart';
import '../bloc/app_state.dart';
import '../pages/selection_page.dart';

class ScreenTemplate extends StatelessWidget {
  final SelectionOptions options;

  const ScreenTemplate({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(options.backgroundImage),
            fit: BoxFit.cover,
            opacity: 0.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10),
              child: Align(
                alignment: Alignment.topLeft,
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
            BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                return Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    width: 250,
                    height: 300,
                    padding: const EdgeInsets.all(16),
                    child: Image.asset(state.mainImage, fit: BoxFit.contain),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: options.imagePaths.map((path) {
                    return GestureDetector(
                      onTap: () {
                        options.onSelectPressed(context, path);
                      },
                      child: BlocBuilder<AppBloc, AppState>(
                        builder: (context, state) {
                          bool isSelected = state.mainImage == options.imageAssets[options.imagePaths.indexOf(path)];
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: isSelected ? Colors.blueAccent : Colors.white,
                                width: isSelected ? 3:2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: isSelected ? Colors.blueAccent : Colors.white,
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Image.asset(
                                options.imageAssets[options.imagePaths.indexOf(path)],
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      options.addingPathName,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      options.onRightPressed(context);
                    },
                    icon: const Icon(Icons.check_circle, color: Colors.white),
                    label: const Text(
                      "Tanlash",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
