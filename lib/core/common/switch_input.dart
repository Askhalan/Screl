// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:screl/core/constants/colors.dart';

class SwitchInput extends StatelessWidget {
  const SwitchInput({
    super.key,
    required this.label,
  });

  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(
          width: 50,
          child: Transform.scale(
            scale: 0.8,
            alignment: Alignment.centerRight,
            child: Switch(
              inactiveTrackColor: JColor.secondary,
              value: true,
              onChanged: (bool value) {},
            ),
          ),
        ),
      ],
    );
  }
}
