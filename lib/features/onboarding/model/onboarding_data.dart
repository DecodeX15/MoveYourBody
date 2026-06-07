import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_data.freezed.dart';

@freezed
abstract class OnboardingData with _$OnboardingData {
  const factory OnboardingData({
    @Default({}) Set<String> goalTags,
    @Default('') String customGoal,
    @Default({}) Set<String> healthIssueTags,
    @Default('') String customHealthIssue,
    String? difficulty,
    String? intensity,
    @Default({}) Set<String> targetBodyRegion,
    @Default({}) Set<String> equipments,
    String? username,
    double? height,
    double? weight,
    int? age,
  }) = _OnboardingData;
}
