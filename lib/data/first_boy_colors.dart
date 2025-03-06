import 'package:child_correction/data/selection_options.dart';
import 'package:child_correction/presentation/bloc/app_event.dart';
import 'package:child_correction/presentation/pages/transport_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/bloc/app_bloc.dart';


SelectionOptions createBoyColors(BuildContext context) {
  final state = context.watch<AppBloc>().state;

  final Map<String, List<String>> lookColorOptions =
  state.characterNumber == "first_boy" ? {
    'first': ['blue', 'gray', 'green', 'pink', 'red', 'yellow'],
    'second': ['black', 'blue', 'green', 'orange', 'red','yellow'],
  }:
  {
    'first': ['blue', 'green', 'orange', 'red'],
    'second': ['blue', 'green','orange', 'red'],
  };

  List<String> colorList = lookColorOptions[state.characterLook]!;
  List<String> colorAssets = colorList.map((color) => "assets/images/${state.characterNumber}/${state.characterLook}/$color.png").toList();

  return SelectionOptions(
    backgroundImage: "assets/images/background/color_background.jpg",
    imageAssets:colorAssets,
    imagePaths: colorList,
    addingPathName: 'Kiyim rangini tanlang',

    onRightPressed: (context) =>
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TransportSelectionPage()),
        ),
    onSelectPressed: (context, String color) {
      context.read<AppBloc>().add(UpdateCharacterColor(color));
    },
  );
}
