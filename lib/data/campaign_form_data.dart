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
}