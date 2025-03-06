import 'package:child_correction/data/selection_options.dart';
import 'package:child_correction/presentation/bloc/app_event.dart';
import 'package:child_correction/presentation/pages/character_selection.dart';
import 'package:child_correction/presentation/pages/color_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/bloc/app_bloc.dart';

final Map<String, List<String>> characterDressOptions = {
  'first_boy': ['first', 'second'],
  'second_boy': ['first', 'second'],
};

SelectionOptions createFirstBoyDresses(BuildContext context) {
  final state = context.watch<AppBloc>().state;

  List<String> dressList = characterDressOptions[state.characterNumber] ?? ['first'];
  List<String> imageAssets = dressList.map((dress) => "assets/images/${state.characterNumber}/$dress/${state.characterColor}.png").toList();

  return SelectionOptions(
    backgroundImage: "assets/images/background/dress_background.webp",
    imagePaths: dressList,
    imageAssets: imageAssets,
    addingPathName: 'Kiyimni tanlang',

    onRightPressed: (context) =>
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ColorSelection()),
        ),
    onSelectPressed: (context, String dress) {
      context.read<AppBloc>().add(UpdateCharacterLook(dress));
    },
  );
}
