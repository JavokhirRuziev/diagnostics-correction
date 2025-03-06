import 'package:flutter/material.dart';

import '../../data/first_boy_colors.dart';
import '../widgets/screen_template.dart';

class ColorSelection extends StatelessWidget {
  const ColorSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTemplate(options: createBoyColors(context)),
    );
  }
}
