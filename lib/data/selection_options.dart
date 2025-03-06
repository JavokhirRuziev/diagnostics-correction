import 'package:flutter/material.dart';

class SelectionOptions {
  final List<String> imagePaths;
  final String addingPathName;
  final void Function(BuildContext) onRightPressed;
  final void Function(BuildContext, String) onSelectPressed;
  final List<String> imageAssets;
  final String backgroundImage;

  SelectionOptions({
    required this.backgroundImage,
    required this.imageAssets,
    required this.onSelectPressed,
    required this.imagePaths,
    required this.addingPathName,
    required this.onRightPressed,
  });
}
