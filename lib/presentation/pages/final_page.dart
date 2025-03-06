import 'package:child_correction/presentation/bloc/app_event.dart';
import 'package:child_correction/presentation/pages/selection_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app_bloc.dart';
import '../bloc/app_state.dart';
import 'age_selection.dart'; // Ensure this import exists

class FinalPage extends StatelessWidget {
  const FinalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.cyanAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                      elevation: 10,
                      shadowColor: Colors.black45,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Final Selection",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent,
                              ),
                            ),
                            const Divider(thickness: 2),
                            _buildInfoRow(
                                "Age",
                                state.age == 3
                                    ? "2-3"
                                    : state.age == 5
                                        ? "4-5"
                                        : "6-7"),
                            _buildInfoRow(
                                "Character", state.characterNumber.toString()),
                            _buildInfoRow(
                                "Dress", state.characterLook.toString()),
                            _buildInfoRow(
                                "Color", state.characterColor.toString()),
                            _buildInfoRow(
                                "Transport", state.transport.toString()),
                            if (state.age! >= 5)
                              _buildInfoRow("Phone", state.phone.toString()),
                            if (state.age! >= 6)
                              _buildInfoRow(
                                  "Profession", state.profession.toString()),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Restart Button
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        context.read<AppBloc>().add(ResetState());
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SelectionPage()),
                        );
                      },
                      icon: const Icon(Icons.refresh, color: Colors.white),
                      label: const Text(
                        "Restart",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoRow(String title, String? value) {
    if (value == null) return const SizedBox.shrink();

    if (title == "Transport" || title == "Phone" || title == "Profession") {
      value = value.split('/').last.split('.').first;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$title:",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Text(
            value,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.blueGrey),
          ),
        ],
      ),
    );
  }
}
