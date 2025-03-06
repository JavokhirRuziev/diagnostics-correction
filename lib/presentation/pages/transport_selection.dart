import 'package:child_correction/presentation/pages/final_page.dart';
import 'package:child_correction/presentation/pages/phone_selection.dart';
import 'package:child_correction/presentation/pages/selection_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/app_bloc.dart';
import '../bloc/app_event.dart';
import 'age_selection.dart';

class TransportSelectionPage extends StatefulWidget {
  const TransportSelectionPage({super.key});

  @override
  State<TransportSelectionPage> createState() => _TransportSelectionPageState();
}

class _TransportSelectionPageState extends State<TransportSelectionPage> {
  final List<String> transportImages = [
    'assets/images/next/transport/airplane.png',
    'assets/images/next/transport/bicycle.png',
    'assets/images/next/transport/car.png',
    'assets/images/next/transport/yacht.png',
  ];

  late String selectedTransport;

  @override
  void initState() {
    super.initState();
    selectedTransport = transportImages[0]; // Default selection
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/images/background/transport_background.webp"),
            fit: BoxFit.cover,
            opacity: 0.5,
          ),
        ),
        child: Center(
          child: Padding(
            padding:const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        width: 180,
                        height: 180,
                        padding: const EdgeInsets.all(16),
                        child:Image.asset(selectedTransport, fit: BoxFit.contain),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: transportImages.map((transport) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedTransport = transport;
                              });
                              context
                                  .read<AppBloc>()
                                  .add(UpdateTransport(transport));
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: selectedTransport == transport
                                      ? Colors.blueAccent
                                      : Colors.white,
                                  width: selectedTransport == transport ? 3 : 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  if (selectedTransport == transport)
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
                                    Image.asset(transport, fit: BoxFit.contain),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
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
                          MaterialPageRoute(
                            builder: (context) {
                              final appState = context.read<AppBloc>().state;
                              return appState.age! >= 3
                                  ? const PhoneSelectionPage()
                                  : const FinalPage();
                            },
                          ),
                        );
                      },
                      icon: const Icon(Icons.check_circle, color: Colors.white),
                      label: const Text(
                        "Tanlash",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
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
