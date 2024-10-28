import 'package:flutter/material.dart';
import 'package:screl/core/constants/colors.dart';

class SwitchInput extends StatelessWidget {
  const SwitchInput({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

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
              value: value,
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}