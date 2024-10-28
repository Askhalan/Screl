// lib/view/widgets/sidebar.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screl/core/constants/colors.dart';
import 'package:screl/core/constants/sizes.dart';
import 'package:screl/view_model/sidebar_view_model.dart';

class Sidebar extends ConsumerWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final campaignSteps = ref.watch(campaignProvider);

    return Container(
      width: 350,
      decoration: BoxDecoration(
        color: JColor.white,
        borderRadius: BorderRadius.circular(JSize.borderRadLg),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: campaignSteps.length,
            itemBuilder: (BuildContext context, int index) {
              final step = campaignSteps[index];
              return ListTile(
                onTap: () {
                  // ref.read(campaignProvider.notifier).goToStep(step.stepNumber);
                },
                leading: Container(
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
                ),
                title: Text(
                  step.title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: step.isActive
                            ? JColor.primary
                            : JColor.dark.withOpacity(0.5),
                      ),
                ),
                subtitle: Text(
                  step.label,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              );
            },
          ),
          // Rest of your help section remains the same
        ],
      ),
    );
  }
}
