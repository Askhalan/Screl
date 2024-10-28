// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class JGap extends StatelessWidget {
  const JGap({
    super.key,
    this.h = 10,
    this.w = 10,  this.more = 1,
  });
  final double h;
  final double w;
  final double more;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h * more,
      width: w * more,
    );
  }
}
