// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screl/core/constants/colors.dart';
import 'package:screl/core/constants/sizes.dart';
import 'package:screl/core/constants/text_strings.dart';
import 'package:screl/core/common/j_gap.dart';
import 'package:screl/core/common/switch_input.dart';
import 'package:screl/core/common/text_input.dart';
import 'package:screl/core/utils/validators/validation.dart';
import 'package:screl/view_model/sidebar_view_model.dart';

class CampaignForm extends ConsumerWidget {
  CampaignForm({super.key});

  final TextEditingController prevTextController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
          color: JColor.white,
          borderRadius: BorderRadius.circular(JSize.borderRadLg)),
      padding: JSize.defaultPadding,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Spacer(flex: 2),
            //--- HEADING ---
            Text(JTexts.formTitle,
                style: Theme.of(context).textTheme.headlineLarge),
            Text(JTexts.formSubtitle,
                style: Theme.of(context).textTheme.headlineSmall),
            Spacer(flex: 3),

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
            Spacer(),
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
                JGap(),
                Expanded(
                    child: TextInput(
                  controller: emailController,
                  hintText: JTexts.emailHint,
                  labelText: JTexts.emailLabel,
                  validator: (value) => JValidator.validateEmail(value),
                )),
              ],
            ),

            Divider(),

            //--- Switch ---

            SwitchInput(label: JTexts.runOnceSwitchLabel),
            Spacer(),
            SwitchInput(label: JTexts.customAudienceLabel),
            Spacer(flex: 2),

            //--- message ---
            RichText(
                text: TextSpan(children: [
              TextSpan(text: JTexts.messagePart1),
              TextSpan(
                  text: JTexts.messagePart2,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: JColor.primary)),
              TextSpan(text: JTexts.messagePart3),
            ])),
            Spacer(flex: 2),
            Divider(),
            Spacer(),

            //---- BUTTONS ---
            Row(
              children: [
                Flexible(
                  flex: 2,
                  child: OutlinedButton(
                    onPressed: () {
                      // Handle save draft
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
                JGap(),
                Flexible(
                  flex: 3,
                  child: ElevatedButton(
                    onPressed: () {
                      // if(){}
                      ref.read(campaignProvider.notifier).moveToNextStep();
                    },
                    child: Text(JTexts.nextStep),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
