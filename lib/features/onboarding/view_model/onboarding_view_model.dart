import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/onboarding_state.dart';

class OnboardingViewModel extends Notifier<OnboardingState> {
  @override
  OnboardingState build() {
    return const OnboardingState();
  }

  void toggleGoal(String goal) {
    final updatedGoals = Set<String>.from(state.goalTags);
    if (updatedGoals.contains(goal)) {
      updatedGoals.remove(goal);
    } else {
      updatedGoals.add(goal);
    }

    state = state.copyWith(goalTags: updatedGoals);
  }

  void updateCustomGoal(String value) {
    state = state.copyWith(customGoal: value);
  }
}

final onboardingProvider =
    NotifierProvider<OnboardingViewModel, OnboardingState>(
      OnboardingViewModel.new,
    );
