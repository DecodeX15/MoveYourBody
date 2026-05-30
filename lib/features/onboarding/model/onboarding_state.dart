class OnboardingState {
  final Set<String> goalTags;
  final String customGoal;

  const OnboardingState({this.goalTags = const {}, this.customGoal = ''});
  OnboardingState copyWith({Set<String>? goalTags, String? customGoal}) {
    return OnboardingState(
      goalTags: goalTags ?? this.goalTags,
      customGoal: customGoal ?? this.customGoal,
    );
  }
}