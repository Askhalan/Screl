// lib/view/widgets/sidebar.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screl/core/common/j_gap.dart';
import 'package:screl/core/constants/colors.dart';
import 'package:screl/view_model/sidebar_view_model.dart';

class MobileProgressbar extends ConsumerWidget {
  const MobileProgressbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final campaignSteps = ref.watch(campaignProvider);

    return SizedBox(
      height: 50,
      child: ListView.separated(
        
        separatorBuilder: (context, index) {
        return const JGap();
      },
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: campaignSteps.length,
        itemBuilder: (BuildContext context, int index) {
          final step = campaignSteps[index];
          return Container(
            height: 40,width: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: step.isActive
                      ? null
                      : Border.all(
                          width: 0.5,
                          color: step.isCompleted
                              ? JColor.primary
                              : JColor.dark)),
              child: CircleAvatar(
                  backgroundColor:
                      step.isActive ? JColor.primary : JColor.white,
                  child: Text(
                    "${step.stepNumber}",
                    style: step.isActive
                        ? const TextStyle(color: JColor.white)
                        : TextStyle(color: JColor.dark.withOpacity(0.5)),
                  )),
            );
        },
      ),
    );
  }
}
