// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screl/core/theme/theme.dart';
import 'package:screl/data/campaign_form_data.dart';
import 'package:screl/view/form_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CampaignFormDataAdapter());
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //  debugShowMaterialGrid: true,
      debugShowCheckedModeBanner: false,
      theme: JAppTheme.lightTheme,
      // darkTheme: JAppTheme.darkTheme,
      home: ScnForm(),
    );
  }
}
