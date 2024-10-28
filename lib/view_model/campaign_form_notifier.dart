import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:screl/data/campaign_form_data.dart';

final campaignFormsProvider =
    StateNotifierProvider<CampaignFormsNotifier, Map<int, CampaignFormData>>(
        (ref) {
  return CampaignFormsNotifier();
});

class CampaignFormsNotifier extends StateNotifier<Map<int, CampaignFormData>> {
  CampaignFormsNotifier() : super({}) {
    _loadFromCache();
  }

  Future<void> _loadFromCache() async {
    final box = await Hive.openBox<Map<dynamic, dynamic>>('campaign_forms');
    final cachedData = box.get('all_forms');
    if (cachedData != null) {
      state = Map.from(cachedData.map((key, value) =>
          MapEntry(int.parse(key.toString()), CampaignFormData(
            subject: value['subject'],
            previewText: value['previewText'],
            name: value['name'],
            email: value['email'],
            runOnce: value['runOnce'] ?? false,
            customAudience: value['customAudience'] ?? false,
            currentStep: value['currentStep'] ?? 1,
          ))));
    }
  }

  Future<void> _saveToCache() async {
    final box = await Hive.openBox<Map<dynamic, dynamic>>('campaign_forms');
    final dataToSave = state.map((key, value) => MapEntry(key.toString(), value.toJson()));
    await box.put('all_forms', dataToSave);
  }

  void updateFormStep(
    int step, {
    String? subject,
    String? previewText,
    String? name,
    String? email,
    bool? runOnce,
    bool? customAudience,
  }) {
    final currentFormData = state[step] ?? CampaignFormData();
    state = {
      ...state,
      step: currentFormData.copyWith(
        subject: subject ?? currentFormData.subject,
        previewText: previewText ?? currentFormData.previewText,
        name: name ?? currentFormData.name,
        email: email ?? currentFormData.email,
        runOnce: runOnce ?? currentFormData.runOnce,
        customAudience: customAudience ?? currentFormData.customAudience,
        currentStep: step,
      ),
    };
    _saveToCache();
  }

  void saveDraft(int step) {
    _saveToCache();
  }

  void completeCampaign() {
    final allFormsData = state.map((key, value) => MapEntry(
          'Step $key',
          value.toJson(),
        ));
    
    // Print the JSON data to console
    debugPrint('Complete Campaign Data:');
    debugPrint(const JsonEncoder.withIndent('  ').convert(allFormsData));
  }
}