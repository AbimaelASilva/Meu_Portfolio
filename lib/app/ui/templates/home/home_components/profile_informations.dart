import 'package:flutter/material.dart';

import '../../../ui.dart';

class ProfileInformations extends StatelessWidget {
  const ProfileInformations({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Abimael Andrade',
          style: ProTextStyles.bold28,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: ProSpaces.proSpaces8,
          ),
          child: Text(
            'Mobile/Web Apps Developer ',
            style: ProTextStyles.medium12.copyWith(
                fontSize: ProFontSizes.size16, color: ProColors.grayMedium),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
