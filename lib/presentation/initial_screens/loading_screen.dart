import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/presentation/components/error_body.dart';
import 'package:odyssey_mobile/presentation/initial_screens/bloc/update_bloc.dart';
import 'package:odyssey_mobile/presentation/router.dart';

@RoutePage()
class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<UpdateBloc, UpdateState>(
        listener: (context, state) {
          if (state is UpdateFinished) {
            context.router.replaceAll([const MainRoute()]);
          }
        },
        child: BlocBuilder<UpdateBloc, UpdateState>(
          builder: (context, state) {
            if (state is UpdateFailed) {
              return ErrorBody(state.failure);
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
