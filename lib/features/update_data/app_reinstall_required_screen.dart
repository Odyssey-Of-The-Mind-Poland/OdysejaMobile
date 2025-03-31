import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:odyssey_mobile/app/injectable.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/config/asset_paths.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';
import 'package:odyssey_mobile/core/data/services/store_service.dart';
import 'package:odyssey_mobile/core/data/services/url_service.dart';
import 'package:odyssey_mobile/l10n/strings.dart';
import 'package:odyssey_mobile/widgets/main_button.dart';
import 'package:odyssey_mobile/widgets/snackbar.dart';

// TODO: Add support for impossible updates.
@RoutePage()
class AppReinstallRequiredScreen extends StatelessWidget {
  const AppReinstallRequiredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: Theme.of(context).brightness == Brightness.light
          ? SystemUiOverlayStyle.dark
          : SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Theme.of(context).extension<OotmBottomSheetTheme>()?.backgroundColor,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
              bottom: max(MediaQuery.viewPaddingOf(context).bottom, 16), left: 16, right: 16),
          child: MainButton.primary(
            onPressed: () async {
              final urlSuccess = await UrlLauncher.openUrl(sl<StoreService>().storeUrl);
              if (urlSuccess || !context.mounted) {
                return;
              }
              showSnackBar(
                context: context,
                text: AppStrings.unknownFailureMessage,
                type: SnackBarType.error,
              );
            },
            label: AppStrings.appUpdateButton,
            iconData: OotmIcons.check,
          ),
        ),
        body: SafeArea(child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: const _Body(),
              ),
            );
          },
        )),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ..._nonExpandingSpacer(flex: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(AssetPaths.appLogo, height: 64, width: 64),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(AppStrings.appReinstallHeader, style: Theme.of(context).t.h1),
              ),
              const SizedBox(height: 16),
              Text(
                AppStrings.appReinstallBody1,
                style: Theme.of(context).t.bodyMediumRegular,
              ),
              const SizedBox(height: 24),
              Text(
                AppStrings.appReinstallBody2,
                style: Theme.of(context).t.bodyMediumRegular,
              ),
              const SizedBox(height: 8),
            ],
          ),
          ..._nonExpandingSpacer(flex: 3),
        ],
      ),
    );
  }

  /// Mimicks [Spacer] behaviour without breaking single-page-or-scrollable layout.
  Iterable<Widget> _nonExpandingSpacer({required int flex}) =>
      Iterable.generate(flex, (_) => const SizedBox.shrink());
}
