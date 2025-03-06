import 'package:flutter/material.dart';

import '../../data/first_boy_dresses.dart';
import '../widgets/screen_template.dart';

class DressSelection extends StatelessWidget {
  const DressSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTemplate(options: createFirstBoyDresses(context)),
    );
  }
}
