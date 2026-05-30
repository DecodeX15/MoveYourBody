import 'package:flutter/material.dart';
import 'package:template_flutter/features/onboarding/view/goal_screen.dart';

import 'core/theme/app_themes.dart';
import 'features/onboarding/view/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      initialRoute: '/welcome',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/onboarding/goals': (context) => const GoalScreen(),
      },
    );
  }
}
