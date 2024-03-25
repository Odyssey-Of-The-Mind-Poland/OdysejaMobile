import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/consts/ootm_icons.dart';
import 'package:odyssey_mobile/consts/strings.dart';
import 'package:odyssey_mobile/consts/themes.dart';
import 'package:odyssey_mobile/presentation/components/search_field.dart';
import 'package:odyssey_mobile/presentation/components/search_result_list_tile.dart';
import 'package:odyssey_mobile/presentation/router.dart';
import 'package:odyssey_mobile/presentation/schedule_screen/bloc/schedule_search_bloc.dart';

@RoutePage()
class ScheduleSearchScreen extends StatefulWidget {
  const ScheduleSearchScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleSearchScreen> createState() => _ScheduleSearchScreenState();
}

class _ScheduleSearchScreenState extends State<ScheduleSearchScreen> {
  // Just nope, but no time.
  String? tryForInitialValue(BuildContext context) {
    final state = context.read<ScheduleSearchBloc>().state;
    return state is SearchResult ? state.originalPhrase : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            Expanded(
                child: SearchField(
              initialValue: tryForInitialValue(context),
              onClearCallback: () =>
                  context.read<ScheduleSearchBloc>().add(const SearchRequest('')),
              onChange: (value) => context.read<ScheduleSearchBloc>().add(SearchRequest(value)),
            )),
            Container(
              height: 44,
              width: 44,
              margin: const EdgeInsets.only(left: 16, right: 8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppValues.defaultBrRadius),
                  color: AppColors.primaryOrange),
              child: const Icon(OotmIcons.search, color: AppColors.pureWhite),
            ),
          ],
        ),
      ),
      body: BlocBuilder<ScheduleSearchBloc, ScheduleSearchState>(
        builder: (context, state) {
          if (state is SearchResult) {
            return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.performances.length,
                itemBuilder: (context, i) => SearchResultListTile(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        context.router.push(ScheduleSearchResultRoute(
                          performance: state.performances[i],
                        ));
                      },
                      performance: state.performances[i],
                      searchPhrase: state.searchPhrase,
                    ));
          } else if (state is SearchEmpty) {
            return const Center(
                child: Text(AppStrings.emptyResultsFailure, style: AppTextStyles.h1grey));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
