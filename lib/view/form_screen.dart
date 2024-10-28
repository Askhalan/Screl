// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:screl/core/common/j_gap.dart';
import 'package:screl/core/constants/sizes.dart';
import 'package:screl/core/utils/devices/screen_size.dart';
import 'package:screl/view/basic_details/basic_details_form.dart';
import 'package:screl/view/widgets/sidebar.dart';

class ScnHome extends StatelessWidget {
  const ScnHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final isDesktop = ScreenSize.isDesktop(context);

          if (isDesktop) {
            return Container(
              height: ScreenSize.getScreenHeight(context) * 0.92,
              padding: const EdgeInsets.symmetric(
                  vertical: JSize.defaultPaddingValue * 2,
                  horizontal: JSize.defaultPaddingValue * 15),
              child: Row(
                children: [
                  Flexible(child: CampaignForm()),
                  JGap(more: 2),
                  Sidebar(),
                ],
              ),
            );
          }
          return Flexible(child: CampaignForm());
        },
      ),
    );
  }
}
