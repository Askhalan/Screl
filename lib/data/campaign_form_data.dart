import 'package:hive/hive.dart';

part 'campaign_form_data.g.dart';

@HiveType(typeId: 1)
class CampaignFormData extends HiveObject {
  @HiveField(0)
  String? subject;

  @HiveField(1)
  String? previewText;

  @HiveField(2)
  String? name;

  @HiveField(3)
  String? email;

  @HiveField(4)
  bool runOnce;

  @HiveField(5)
  bool customAudience;

  @HiveField(6)
  int currentStep;

  CampaignFormData({
    this.subject,
    this.previewText,
    this.name,
    this.email,
    this.runOnce = false,
    this.customAudience = false,
    this.currentStep = 1,
  });
  CampaignFormData copyWith({
    String? subject,
    String? previewText,
    String? name,
    String? email,
    bool? runOnce,
    bool? customAudience,
    int? currentStep,
  }) {
    return CampaignFormData(
      subject: subject ?? this.subject,
      previewText: previewText ?? this.previewText,
      name: name ?? this.name,
      email: email ?? this.email,
      runOnce: runOnce ?? this.runOnce,
      customAudience: customAudience ?? this.customAudience,
      currentStep: currentStep ?? this.currentStep,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'subject': subject,
      'previewText': previewText,
      'name': name,
      'email': email,
      'runOnce': runOnce,
      'customAudience': customAudience,
      'currentStep': currentStep,
    };
  }
}
