// lib/viewmodel/campaign_view_model.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screl/core/constants/text_strings.dart';
import 'package:screl/data/form_step_model.dart';


final campaignProvider = StateNotifierProvider<CampaignViewModel, List<FormStepModel>>((ref) {
  return CampaignViewModel();
});

class CampaignViewModel extends StateNotifier<List<FormStepModel>> {
  CampaignViewModel()
      : super([
         const FormStepModel(title: JTexts.step1Title, label:  JTexts.step1Label, stepNumber: 1,isActive: true),
         const FormStepModel(title: JTexts.step2Title, label:  JTexts.step2Label, stepNumber: 2),
         const FormStepModel(title: JTexts.step3Title, label:  JTexts.step3Label, stepNumber: 3),
         const FormStepModel(title: JTexts.step4Title, label:  JTexts.step4Label, stepNumber: 4),
         const FormStepModel(title: JTexts.step5Title, label:  JTexts.step5Label, stepNumber: 5),
          
        ]);



  void moveToNextStep() {
    final currentActiveIndex = state.indexWhere((step) => step.isActive);
    if (currentActiveIndex < state.length - 1) {
      state = [
        for (var i = 0; i < state.length; i++)
          if (i == currentActiveIndex)
            state[i].copyWith(isActive: false, isCompleted: true)
          else if (i == currentActiveIndex + 1)
            state[i].copyWith(isActive: true)
          else
            state[i]
      ];
    }
  }

  void goToStep(int stepNumber) {
    if (stepNumber <= getCurrentStep() + 1) {
      state = [
        for (var step in state)
          if (step.stepNumber == stepNumber)
            step.copyWith(isActive: true)
          else if (step.stepNumber < stepNumber)
            step.copyWith(isCompleted: true, isActive: false)
          else
            step.copyWith(isActive: false)
      ];
    }
  }

  int getCurrentStep() {
    return state.indexWhere((step) => step.isActive);
  }
}