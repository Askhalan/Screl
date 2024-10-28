
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screl/core/constants/colors.dart';
import 'package:screl/core/constants/sizes.dart';
import 'package:screl/core/constants/text_strings.dart';
import 'package:screl/core/common/j_gap.dart';
import 'package:screl/core/common/switch_input.dart';
import 'package:screl/core/common/text_input.dart';
import 'package:screl/core/utils/devices/screen_size.dart';
import 'package:screl/core/utils/validators/validation.dart';
import 'package:screl/data/campaign_form_data.dart';
import 'package:screl/view/widgets/mobile_progress_bar.dart';
import 'package:screl/view/widgets/processing_buttons.dart';
import 'package:screl/view_model/campaign_form_notifier.dart';
import 'package:screl/view_model/sidebar_view_model.dart';

class CampaignForm extends ConsumerWidget {
  CampaignForm({super.key});

  final TextEditingController prevTextController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ScreenSize.isMobile(context);
    final currentStep = ref.watch(campaignProvider
        .select((state) => state.indexWhere((step) => step.isActive) + 1));
    final formsData = ref.watch(campaignFormsProvider);
    final currentFormData = formsData[currentStep] ?? CampaignFormData();

    // Updating controllers with current step data
    prevTextController.text = currentFormData.previewText ?? '';
    subjectController.text = currentFormData.subject ?? '';
    nameController.text = currentFormData.name ?? '';
    emailController.text = currentFormData.email ?? '';

    return Container(
      decoration: BoxDecoration(
          color: JColor.white,
          borderRadius: BorderRadius.circular(JSize.borderRadLg)),
      padding: JSize.defaultPadding,
      child: Form(
        key: formKey,
        child: Column(
          children: [
             Spacer(flex:isMobile ?1: 2),
            isMobile ? const MobileProgressbar() : const SizedBox(),
             Spacer(flex:  isMobile ?1: 1),
            //--- HEADING ---
            Text(JTexts.formTitle,
                style: Theme.of(context).textTheme.headlineLarge),
            Text(JTexts.formSubtitle,
                style: Theme.of(context).textTheme.headlineSmall),
            const Spacer(flex: 3),

            //--- FORM ---
            TextInput(
              hintText: JTexts.enterSub,
              labelText: JTexts.campaignSub,
              controller: subjectController,
              validator: (value) =>
                  JValidator.validateEmptyText(JTexts.campaignSub, value),
            ),
            TextInput(
              controller: prevTextController,
              validator: (value) =>
                  JValidator.validateEmptyText(JTexts.previewText, value),
              hintText: JTexts.enterText,
              labelText: JTexts.previewText,
              isDescription: true,
              descriptionText: JTexts.previewTextDescription,
              maxLine: 5,
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                    child: TextInput(
                  controller: nameController,
                  hintText: JTexts.nameHint,
                  labelText: JTexts.nameLabel,
                  validator: (value) =>
                      JValidator.validateEmptyText(JTexts.nameLabel, value),
                )),
                const JGap(),
                Expanded(
                    child: TextInput(
                  controller: emailController,
                  hintText: JTexts.emailHint,
                  labelText: JTexts.emailLabel,
                  validator: (value) => JValidator.validateEmail(value),
                )),
              ],
            ),

            const Divider(),

            //--- Switch ---
            SwitchInput(
              label: JTexts.runOnceSwitchLabel,
              value: currentFormData.runOnce,
              onChanged: (newValue) {
                ref.read(campaignFormsProvider.notifier).updateFormStep(
                      currentStep,
                      subject: subjectController.text,
                      previewText: prevTextController.text,
                      name: nameController.text,
                      email: emailController.text,
                      runOnce: newValue,
                      customAudience: currentFormData.customAudience,
                    );
              },
            ),
            const Spacer(),
            SwitchInput(
              label: JTexts.customAudienceLabel,
              value: currentFormData.customAudience,
              onChanged: (newValue) {
                ref.read(campaignFormsProvider.notifier).updateFormStep(
                      currentStep,
                      subject: subjectController.text,
                      previewText: prevTextController.text,
                      name: nameController.text,
                      email: emailController.text,
                      runOnce: currentFormData.runOnce,
                      customAudience: newValue,
                    );
              },
            ),
            const Spacer(flex: 2),

            //--- message ---
            RichText(
                text: TextSpan(children: [
              const TextSpan(text: JTexts.messagePart1),
              TextSpan(
                  text: JTexts.messagePart2,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: JColor.primary)),
              const TextSpan(text: JTexts.messagePart3),
            ])),
            const Spacer(flex: 2),
            const Divider(),
            const Spacer(),

            //---- BUTTONS ---
            ProcessingButtons(
                formKey: formKey,
                currentStep: currentStep,
                subjectController: subjectController,
                prevTextController: prevTextController,
                nameController: nameController,
                emailController: emailController,
                currentFormData: currentFormData),
          ],
        ),
      ),
    );
  }
}
