import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/l10n/strings.dart';
import 'package:odyssey_mobile/app/themes/themes.dart';
import 'package:odyssey_mobile/presentation/components/search_field.dart';
import 'package:odyssey_mobile/presentation/components/search_result_list_tile.dart';
import 'package:odyssey_mobile/app/routing/router.dart';
import 'package:odyssey_mobile/presentation/schedule_screen/bloc/schedule_search_bloc.dart';
import 'package:odyssey_mobile/widgets/top_bar.dart';

@RoutePage()
class ScheduleSearchScreen extends StatefulWidget {
  const ScheduleSearchScreen({super.key});

  @override
  State<ScheduleSearchScreen> createState() => _ScheduleSearchScreenState();
}

class _ScheduleSearchScreenState extends State<ScheduleSearchScreen> {
  // Just nope, but no time.
  String? tryForInitialValue(ScheduleSearchState state) {
    return state is SearchResult ? state.originalPhrase : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar.backAction(
        titleWidget: BlocBuilder<ScheduleSearchBloc, ScheduleSearchState>(
          builder: (context, state) {
            return Row(
              children: [
                Expanded(
                  child: SearchField(
                    initialValue: tryForInitialValue(state),
                    onClearCallback: () =>
                        context.read<ScheduleSearchBloc>().add(const SearchRequest('')),
                    onChange: (value) =>
                        context.read<ScheduleSearchBloc>().add(SearchRequest(value)),
                  ),
                ),
              ],
            );
          },
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
