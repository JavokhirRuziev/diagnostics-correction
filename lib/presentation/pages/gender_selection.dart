// screens/gender_selection_page.dart
import 'package:child_correction/presentation/pages/selection_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/app_bloc.dart';
import '../bloc/app_event.dart';
import 'age_selection.dart';

class GenderSelectionPage extends StatelessWidget {
  const GenderSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background/gender_image.webp"),
            fit: BoxFit.cover,
            opacity: 0.5,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 6,
                child: InkWell(
                  onTap: () {
                    context.read<AppBloc>().add(SelectGender('Male'));
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AgeSelectionPage()),
                    );
                  },
                  child: Image.asset(
                    'assets/images/boy.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              const Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    "Jinsni Tanlang",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: InkWell(
                  onTap: () {
                    context.read<AppBloc>().add(SelectGender('Female'));
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AgeSelectionPage()),
                    );
                  },
                  child: Image.asset(
                    'assets/images/girl.png',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
