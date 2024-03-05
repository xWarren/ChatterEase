import '../../../core/data/model/onboarding_model.dart';
import '../../../core/resources/assets.dart';
import '../../../core/resources/strings.dart';

List onboardingList = [
  const OnboardingModel(
    image: Assets.onboardingOne,
    title: Strings.onboardingTitleOne,
    description: Strings.onboardingDescriptionOne
  ),
  const OnboardingModel(
    image: Assets.onboardingTwo,
    title: Strings.onboardingTitleTwo,
    description: Strings.onboardingDescriptionTwo
  ),
  const OnboardingModel(
    image: Assets.onboardingThree,
    title: Strings.onboardingTitleThree,
    description: Strings.onboardingDescriptionThree
  )
];