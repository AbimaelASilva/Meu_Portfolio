import 'package:flutter/material.dart';

import '../../../ui.dart';
import '../../../../config_app.dart';

class ConverPhoto extends StatelessWidget {
  const ConverPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          ProImageNetwork(
            urlImage: ConfigApp.coverPhoto,
          ),
          const Padding(
            padding: EdgeInsets.only(top: ProSpaces.proSpaces20),
            child: ProfileInformations(),
          )
        ],
      ),
    );
  }
}
