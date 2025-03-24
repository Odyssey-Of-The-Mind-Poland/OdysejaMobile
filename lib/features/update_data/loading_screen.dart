import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            // TODO: implement updateRequired screen.
            context.router.replaceAll([const MainRoute()]);
          }
        },
        child: BlocBuilder<UpdateBloc, UpdateState>(
          builder: (context, state) {
            if (state is UpdateFailed && !state.offlineModeAvailable) {
              // TODO: Implement proper no data widget.
              return ErrorBody(state.failure);
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
