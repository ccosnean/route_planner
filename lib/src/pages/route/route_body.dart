import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_planner/src/pages/route/bloc/route_event.dart';
import 'package:route_planner/src/pages/route/step_list_tile.dart';

import 'bloc/route_bloc.dart';
import 'bloc/route_state.dart';

class RouteBody extends StatefulWidget {
  const RouteBody({Key? key}) : super(key: key);

  @override
  State<RouteBody> createState() => _RouteBodyState();
}

class _RouteBodyState extends State<RouteBody> {
  RouteBloc? _bloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    _bloc ??= BlocProvider.of<RouteBloc>(context)..add(PagePushed());

    return BlocBuilder<RouteBloc, RouteState>(
      buildWhen: (p, c) => c is FetchedRoute || c is Loading,
      builder: (context, state) {
        if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FetchedRoute) {
          final distance = state.route.distance / 1000;
          final duration = state.route.duration / 60 / 60;

          return Column(
            children: [
              Material(
                elevation: 4,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                  decoration: BoxDecoration(
                    color: cs.primary,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          '${state.origin} ➞ ${state.destination}',
                          style: TextStyle(
                            color: cs.onPrimary,
                          ),
                        ),
                      ),
                      Text(
                        '${distance.toStringAsFixed(2)} Km',
                        style: TextStyle(
                          color: cs.onPrimary,
                        ),
                      ),
                      Text(
                        ' ~ ',
                        style: TextStyle(color: cs.onPrimary),
                      ),
                      Text(
                        '${duration.toStringAsPrecision(2)} hours',
                        style: TextStyle(
                          color: cs.onPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: state.route.steps?.length ?? 0,
                  itemBuilder: (context, index) {
                    final step = state.route.steps![index];

                    return StepListTile(
                      key: ValueKey(step.location),
                      step: step,
                    );
                  },
                  separatorBuilder: (c, i) => const Divider(),
                ),
              ),
            ],
          );
        }

        return Container();
      },
    );
  }

  @override
  void dispose() {
    _bloc?.close();

    super.dispose();
  }
}
