import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class WeekSelector extends StatelessWidget {
  const WeekSelector({super.key});

  @override
  Widget build(BuildContext context) {
    const days = ["S", "M", "T", "W", "T", "F", "S"];

    const selectedIndex = 2;

    return SizedBox(
      height: 62,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (_, index) {
          final selected = index == selectedIndex;

          return Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: selected
                      ? Colors.white
                      : AppColors.primary.withValues(alpha: .85),
                  borderRadius: BorderRadius.circular(14),

                  boxShadow: selected
                      ? [
                          BoxShadow(
                            color: Colors.white.withValues(alpha: .15),
                            blurRadius: 14,
                          ),
                        ]
                      : [],
                ),
                child: Center(
                  child: Text(
                    days[index],
                    style: TextStyle(
                      color: selected ? Colors.black : Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 6),

              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                  color: selected ? AppColors.primaryLight : Colors.transparent,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
