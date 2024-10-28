// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class JItemGap extends StatelessWidget {
  const JItemGap({
    super.key,
    this.h = 8,
    this.w = 8,
  });
  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h,
      width: w,
    );
  }
}
