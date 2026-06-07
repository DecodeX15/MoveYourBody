import 'package:go_router/go_router.dart';

import '../../features/onboarding/view/body_region_screen.dart';
import '../../features/onboarding/view/difficulty_level.dart';
import '../../features/onboarding/view/equipment_screen.dart';
import '../../features/onboarding/view/goal_screen.dart';
import '../../features/onboarding/view/health_issues.dart';
import '../../features/onboarding/view/intensity_level.dart';
import '../../features/onboarding/view/resultscreen.dart';
import '../../features/onboarding/view/user_details.dart';
import '../../features/onboarding/view/welcome_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const WelcomeScreen()),

    GoRoute(
      path: '/onboarding/goals',
      builder: (context, state) => const GoalScreen(),
    ),

    GoRoute(
      path: '/onboarding/health-issues',
      builder: (context, state) => const HealthIssuesScreen(),
    ),

    GoRoute(
      path: '/onboarding/difficulty',
      builder: (context, state) => const DifficultyScreen(),
    ),

    GoRoute(
      path: '/onboarding/intensity',
      builder: (context, state) => const IntensityScreen(),
    ),

    GoRoute(
      path: '/onboarding/target-body-region',
      builder: (context, state) => const BodyRegionScreen(),
    ),

    GoRoute(
      path: '/onboarding/equipments',
      builder: (context, state) => const EquipmentScreen(),
    ),

    GoRoute(
      path: '/onboarding/userdata',
      builder: (context, state) => const UserdataScreen(),
    ),

    GoRoute(
      path: '/onboarding/result',
      builder: (context, state) => const ResultScreen(),
    ),
  ],
);
