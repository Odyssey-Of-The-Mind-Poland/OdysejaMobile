import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/app/ootm_icons.dart';
import 'package:odyssey_mobile/app/strings.dart';
import 'package:odyssey_mobile/app/themes.dart';

import 'package:odyssey_mobile/domain/entities/performance.dart';
import 'package:odyssey_mobile/presentation/helpers/snackbar_helper.dart';
import 'package:odyssey_mobile/presentation/main_view/bloc/update_favourites_bloc.dart';

class PerformanceCardTop extends StatefulWidget {
  const PerformanceCardTop({Key? key, required this.performance, required this.height})
      : super(key: key);

  final Performance performance;
  final double height;
  @override
  State<PerformanceCardTop> createState() => _PerformanceCardTopState();
}

class _PerformanceCardTopState extends State<PerformanceCardTop> {
  late bool isFavourite;

  @override
  void initState() {
    super.initState();
    isFavourite = widget.performance.isFavourite;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => showModalDialog(context: context, widget: SizedBox()),
      onTap: () => showSnackBar(context: context, text: AppStrings.soonImplemented),
      child: SizedBox(
        height: widget.height,
        child: BlocListener<UpdateFavouritesBloc, UpdateFavouritesState>(
          // listenWhen: (_, c) =>
          //     c is UpdateFavouritesSuccess &&
          //     c.performance.performanceId == widget.performance.performanceId,
          listener: (context, state) {
            if (state is UpdateFavouritesError) {
              showSnackBar(context: context, text: state.failure.errorMessage);
            } else if (state is UpdateFavouritesSuccess) {
              setState(() {
                isFavourite = state.performance.isFavourite;
              });
            }
          },
          child: Row(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    widget.performance.performance,
                    textAlign: TextAlign.center,
                    style: isFavourite
                        ? AppTextStyles.h2.copyWith(color: AppColors.primaryOrange)
                        : AppTextStyles.h2,
                  )),
              Expanded(
                  child: Text(
                widget.performance.team,
                style: AppTextStyles.bodyText1,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )),
              SizedBox(
                  width: 32,
                  child: Icon(
                    OotmIcons.forward,
                    color: isFavourite ? AppColors.primaryOrange : null,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
