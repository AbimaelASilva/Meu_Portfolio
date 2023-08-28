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
          SizedBox(
            height: 200,
            width: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                ConfigApp.coverPhoto,
                fit: BoxFit.cover,
              ),
            ),
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
