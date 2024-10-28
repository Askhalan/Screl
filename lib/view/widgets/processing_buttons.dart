// campaign_form.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screl/core/common/j_gap.dart';
import 'package:screl/core/constants/colors.dart';
import 'package:screl/core/constants/text_strings.dart';
import 'package:screl/data/campaign_form_data.dart';
import 'package:screl/view_model/campaign_form_notifier.dart';
import 'package:screl/view_model/sidebar_view_model.dart';

class ProcessingButtons extends ConsumerWidget {
  const ProcessingButtons({
    super.key,
    required this.formKey,
    required this.currentStep,
    required this.subjectController,
    required this.prevTextController,
    required this.nameController,
    required this.emailController,
    required this.currentFormData,
  });

  final GlobalKey<FormState> formKey;
  final int currentStep;
  final TextEditingController subjectController;
  final TextEditingController prevTextController;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final CampaignFormData currentFormData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: OutlinedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                // Save current form state before saving draft
                ref.read(campaignFormsProvider.notifier).updateFormStep(
                      currentStep,
                      subject: subjectController.text,
                      previewText: prevTextController.text,
                      name: nameController.text,
                      email: emailController.text,
                      runOnce: currentFormData.runOnce,
                      customAudience: currentFormData.customAudience,
                    );
                ref.read(campaignFormsProvider.notifier).saveDraft(currentStep);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Draft saved successfully!')),
                );
              }
            },
            child: Text(
              JTexts.saveDraft,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: JColor.primary),
            ),
          ),
        ),
        const JGap(),
        Flexible(
          flex: 3,
          child: ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();

                // Save form data for current step
                ref.read(campaignFormsProvider.notifier).updateFormStep(
                      currentStep,
                      subject: subjectController.text,
                      previewText: prevTextController.text,
                      name: nameController.text,
                      email: emailController.text,
                      runOnce: currentFormData.runOnce,
                      customAudience: currentFormData.customAudience,
                    );

                if (currentStep == 5) {
                  // If it's the last step, complete the campaign
                  ref.read(campaignFormsProvider.notifier).completeCampaign();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text(
                            'Campaign creation successfull! Check console for data.')),
                  );
                } else {
                  // Move to next step
                  ref.read(campaignProvider.notifier).moveToNextStep();
                }
              }
            },
            child: Text(currentStep == 5 ? 'Complete' : JTexts.nextStep),
          ),
        ),
      ],
    );
  }
}
