import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class TodaySessionCard extends StatelessWidget {
  const TodaySessionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.fitness_center, color: AppColors.primary),
              const SizedBox(width: 10),
              Text(
                "Today's session",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...[
            'Squat Kicks . intermediate . 90s',
            'Push Ups . beginner . 90s',
            'Single Leg Squat . advanced . 90s',
          ].map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  const Icon(Icons.circle, size: 8, color: AppColors.primary),
                  const SizedBox(width: 10),
                  Text(
                    e,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.black,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.play_arrow),
                SizedBox(width: 8),
                Text("Start Session"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
