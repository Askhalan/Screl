import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:screl/data/campaign_form_data.dart';

final campaignFormProvider =
    StateNotifierProvider<CampaignFormNotifier, CampaignFormData>((ref) {
  return CampaignFormNotifier();
});

class CampaignFormNotifier extends StateNotifier<CampaignFormData> {
  CampaignFormNotifier() : super(CampaignFormData()) {
    _loadFromCache();
  }

  Future<void> _loadFromCache() async {
    final box = await Hive.openBox<CampaignFormData>('campaign_form');
    final cachedData = box.get('current_form');
    if (cachedData != null) {
      state = cachedData;
    }
  }

  Future<void> _saveToCache() async {
    final box = await Hive.openBox<CampaignFormData>('campaign_form');
    await box.put('current_form', state);
  }

  void updateStep1({
    String? subject,
    String? previewText,
    String? name,
    String? email,
    bool? runOnce,
    bool? customAudience,
  }) {
    state = CampaignFormData(
      subject: subject ?? state.subject,
      previewText: previewText ?? state.previewText,
      name: name ?? state.name,
      email: email ?? state.email,
      runOnce: runOnce ?? state.runOnce,
      customAudience: customAudience ?? state.customAudience,
      currentStep: state.currentStep,
    );
    _saveToCache();
  }

  void moveToNextStep() {
    state = CampaignFormData(
      subject: state.subject,
      previewText: state.previewText,
      name: state.name,
      email: state.email,
      runOnce: state.runOnce,
      customAudience: state.customAudience,
      currentStep: state.currentStep + 1,
    );
    _saveToCache();
  }

  void goToStep(int step) {
    state = CampaignFormData(
      subject: state.subject,
      previewText: state.previewText,
      name: state.name,
      email: state.email,
      runOnce: state.runOnce,
      customAudience: state.customAudience,
      currentStep: step,
    );
    _saveToCache();
  }
}