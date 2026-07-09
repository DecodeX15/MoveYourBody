import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_scaffold.dart';
import '../widgets/session_summary_card.dart';
import '../widgets/exercise_tile.dart';
import '../widgets/instructions_card.dart';

class SessionDetailsScreen extends StatelessWidget {
  const SessionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;

    return AppScaffold(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 16,
          bottom: 70 + bottomInset,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => context.pop(),
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerLeft,
                ),
                const Expanded(
                  child: Text(
                    "Session Details",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 48),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              "Personalized workout Training",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w800,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 24),
            const SessionSummaryCard(time: "5 min 25 sec", burn: "25 kcal"),
            const SizedBox(height: 32),
            const Text(
              "Exercises",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const ExerciseTile(
              title: "Squat Kicks",
              duration: "90 seconds",
              imagePath: "assets/images/squat_kicks.png",
            ),
            const ExerciseTile(
              title: "Push ups",
              duration: "90 seconds",
              imagePath: "assets/images/push_ups.png",
            ),
            const ExerciseTile(
              title: "Single leg squat",
              duration: "90 seconds",
              imagePath: "assets/images/single_leg_squat.png",
            ),
            const SizedBox(height: 24),
            const Center(
              child: Text(
                "Preparation time : 5sec\nRest time : 20sec",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const InstructionsCard(),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.play_circle_fill, size: 28),
                  SizedBox(width: 8),
                  Text(
                    "Let's start",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
