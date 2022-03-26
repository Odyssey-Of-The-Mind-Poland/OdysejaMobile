import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/asset_paths.dart';
import 'package:odyssey_mobile/app/strings.dart';
import 'package:odyssey_mobile/app/themes.dart';
import 'package:odyssey_mobile/presentation/components/image_tile.dart';

class WelcomeFirstPageContent extends StatelessWidget {
  const WelcomeFirstPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        children: const [
          Text(
            AppStrings.welcomeScreenPage1Title,
            style: AppTextStyles.h0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 32.0),
            child: Text(AppStrings.welcomeScreenPage1Content,
                style: AppTextStyles.h3special, textAlign: TextAlign.center),
          ),
          Spacer(flex: 1),
          SizedBox(
            width: 180,
            child: ImageTile(AssetPaths.ootmLogo),
          ),
          Spacer(flex: 2)
        ],
      ),
    );
  }
}
