import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/features/update_data/domain/app_update_status.dart';
import 'package:odyssey_mobile/presentation/components/error_body.dart';
import 'package:odyssey_mobile/features/update_data/bloc/update_bloc.dart';
import 'package:odyssey_mobile/app/routing/router.dart';

@RoutePage()
class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<UpdateBloc, UpdateState>(
        listener: (context, state) {
          if (state is UpdateFinished || state is UpdateFailed && state.offlineModeAvailable) {
            context.router.replaceAll([const MainRoute()]);
          } else if (state is AppUpdateRequired) {
            context.router.replaceAll([
              AppUpdateRequiredRoute(
                updateImpossible: state.status == AppUpdateStatus.impossible,
                availableOffline: state.offlineAvailable,
              )
            ]);
          }
        },
        child: BlocBuilder<UpdateBloc, UpdateState>(
          builder: (context, state) {
            if (state is UpdateFailed && !state.offlineModeAvailable) {
              // TODO: Implement nicer no data widget.
              return ErrorBody(state.failure);
            }
            // TODO: Implement nicer loading widget.
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
