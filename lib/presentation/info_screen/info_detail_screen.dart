import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/core/data/failures.dart';
import 'package:odyssey_mobile/core/data/services/url_service.dart';
import 'package:odyssey_mobile/core/domain/info.dart';
import 'package:odyssey_mobile/design_system/components/accent_top_bar.dart';
import 'package:odyssey_mobile/presentation/helpers/tile_style.dart';
import 'package:odyssey_mobile/presentation/main_view/bloc/city_data_bloc.dart';
import 'package:odyssey_mobile/widgets/snackbar.dart';

@RoutePage()
class InfoDetailScreen extends StatelessWidget {
  const InfoDetailScreen({required this.info, this.embedded = false, super.key});

  final Info info;

  /// The info is the only one of its city and is shown as the Info tab itself: no back button and
  /// no category name.
  final bool embedded;

  @override
  Widget build(BuildContext context) {
    final style = TileStyles.forInfo(info, position: info.number);
    final theme = Theme.of(context);
    final categoryName = embedded ? null : _categoryName(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AccentSliverTopBar(
            title: info.infoName,
            subtitle: categoryName,
            glyph: style.glyph,
            color: style.color,
            showBack: !embedded,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: DefaultTextStyle.merge(
                style: theme.t.bodyMediumRegular,
                child: HtmlWidget(
                  info.infoText,
                  onTapUrl: (url) => _launchURL(url, context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// An info keeps the id of its category in [Info.number]; the name comes from the loaded city.
  String? _categoryName(BuildContext context) {
    final state = context.read<CityDataBloc>().state;
    if (state is! CityDataSuccess) return null;
    for (final group in state.cityData.infoGroups) {
      if (group.number == info.number) return group.name;
    }
    return null;
  }

  Future<bool> _launchURL(String? url, BuildContext context) async {
    if (url == null) {
      return false;
    }
    if (!await UrlLauncher.openUrl(url) && context.mounted) {
      showSnackBar(
        context: context,
        text: const UrlLauncherFailure().errorMessage,
        type: SnackBarType.error,
      );
      return false;
    }
    return true;
  }
}
