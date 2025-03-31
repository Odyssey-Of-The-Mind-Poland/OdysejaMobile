import 'dart:io';

import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/injectable.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';
import 'package:odyssey_mobile/core/data/services/store_service.dart';
import 'package:odyssey_mobile/core/data/services/url_service.dart';
import 'package:odyssey_mobile/l10n/strings.dart';
import 'package:odyssey_mobile/widgets/main_button.dart';
import 'package:odyssey_mobile/widgets/ootm_bottom_sheet.dart';

class AppUpdateRecommendedBottomSheet extends StatelessWidget {
  const AppUpdateRecommendedBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        OotmBottomSheetHeader(text: AppStrings.appUpdateHeader),
        const SizedBox(height: 16),
        Text(AppStrings.appUpdateRecommendedBody1),
        const SizedBox(height: 24),
        Text('${AppStrings.appUpdateRecommendedBody2} $_store'),
        const SizedBox(height: 16),
        MainButton.primary(
          label: AppStrings.appUpdateButton,
          onPressed: () async {
            final urlSuccess = await UrlLauncher.openUrl(sl<StoreService>().storeUrl);
            if (context.mounted) {
              return Navigator.of(context).pop(urlSuccess);
            }
          },
          iconData: OotmIcons.check,
        )
      ],
    );
  }

  // TODO: Move to StoreService?
  String get _store =>
      Platform.isIOS ? AppStrings.appUpdateAppStore : AppStrings.appUpdatePlayStore;
}
