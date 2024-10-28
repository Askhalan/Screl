// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:screl/core/common/j_gap.dart';

class TextInput extends StatelessWidget {
  TextInput(
      {super.key,
      this.isDescription = true,
      this.maxLine = 1,
      required this.hintText,
      required this.labelText,
      this.descriptionText = '',
      this.controller,
      this.onChanged,
      this.validator});
  final bool isDescription;
  final int maxLine;
  final String hintText;
  final String labelText;
  final String descriptionText;
  final TextEditingController? controller;
  void Function(String)? onChanged;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        JGap(h: 4),
        SizedBox(
          height: maxLine > 1 ? maxLine * 24.0 : null,
          child: TextFormField(
            controller: controller,
            onChanged: onChanged,
            validator: validator,
            minLines: maxLine,
            maxLines: null,
            decoration: InputDecoration(
              hintText: hintText,
            ),
          ),
        ),
        JGap(h: 4),
        Text(
          descriptionText,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        JGap(h: 4),
      ],
    );
  }
}
