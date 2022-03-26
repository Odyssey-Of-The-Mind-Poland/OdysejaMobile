import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/ootm_icons.dart';
import 'package:odyssey_mobile/app/strings.dart';
import 'package:odyssey_mobile/app/themes.dart';
import 'package:odyssey_mobile/presentation/components/function_presentation_tile.dart';

class WelcomeSecondPageContent extends StatelessWidget {
  const WelcomeSecondPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          AppStrings.welcomeScreenPage2Title,
          style: AppTextStyles.h0,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: Column(
            children: const [
              FunctionPresentationTile(
                  icon: OotmIcons.info,
                  title: AppStrings.welcomeScreenPage2Heading1,
                  subtitle: AppStrings.welcomeScreenPage2Content1,
                  iconBackgroundColor: AppColors.lightestBlue,
                  iconColor: AppColors.darkBlue),
              SizedBox(height: 24),
              FunctionPresentationTile(
                  icon: OotmIcons.schedule,
                  title: AppStrings.welcomeScreenPage2Heading2,
                  subtitle: AppStrings.welcomeScreenPage2Content2,
                  iconBackgroundColor: AppColors.lightestGreen,
                  iconColor: AppColors.darkGreen),
              SizedBox(height: 24),
              FunctionPresentationTile(
                  icon: OotmIcons.favEmpty,
                  title: AppStrings.welcomeScreenPage2Heading3,
                  subtitle: AppStrings.welcomeScreenPage2Content3,
                  iconBackgroundColor: AppColors.lightestOrange,
                  iconColor: AppColors.primaryOrange),
            ],
          ),
        ),
        const SizedBox(),
      ],
    );
  }
}
