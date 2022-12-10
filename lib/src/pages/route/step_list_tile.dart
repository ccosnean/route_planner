import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_planner/src/domain/route_step.dart';
import 'package:route_planner/src/domain/weather.dart';
import 'package:route_planner/src/pages/route/bloc/route_bloc.dart';
import 'package:route_planner/src/pages/route/bloc/route_event.dart';
import 'package:route_planner/src/pages/route/bloc/route_state.dart';

class StepListTile extends StatefulWidget {
  final RouteStep step;

  const StepListTile({Key? key, required this.step}) : super(key: key);

  @override
  State<StepListTile> createState() => _StepListTileState();
}

class _StepListTileState extends State<StepListTile>
    with AutomaticKeepAliveClientMixin {
  RouteBloc? _bloc;
  Weather? weather;

  @override
  void initState() {
    super.initState();

    _bloc = BlocProvider.of<RouteBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.step.direction ?? 'straight';

    if (weather == null) {
      _bloc?.add(LocationShown(widget.step.location));
    }

    return BlocBuilder<RouteBloc, RouteState>(
      buildWhen: (p, c) =>
          c is WeatherForLocation && c.location == widget.step.location,
      builder: (context, state) {
        final isLoading = state is LoadingWeatherForLocation;

        if (state is FetchedWeatherForLocation) {
          weather = state.weather;
        }

        return ListTile(
          leading: CircleAvatar(
            child: Icon(_iconForTitle(title)),
          ),
          title: Text(title),
          subtitle: Text(_buildSubtitle()),
          trailing: isLoading
              ? const SizedBox(
                  width: 15,
                  height: 15,
                  child: CircularProgressIndicator(),
                )
              : SizedBox(
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (weather != null)
                        Text(weather!.temperature.toInt().toString()),
                      const Icon(Icons.thermostat),
                    ],
                  ),
                ),
        );
      },
    );
  }

  String _buildSubtitle() {
    if (weather != null) {
      return weather!.description;
    }

    final location = widget.step.location;
    return '${location.lat.toString()}, ${location.lng.toString()}';
  }

  IconData _iconForTitle(String title) {
    switch (title) {
      case 'turn-right':
        return Icons.turn_right;
      case 'turn-slight-right':
        return Icons.turn_slight_right;
      case 'turn-sharp-right':
        return Icons.turn_sharp_right;
      case 'turn-left':
        return Icons.turn_left;
      case 'turn-slight-left':
        return Icons.turn_slight_left;
      case 'turn-sharp-left':
        return Icons.turn_sharp_left;
      case 'roundabout-left':
        return Icons.roundabout_left;
      case 'roundabout-right':
        return Icons.roundabout_right;
      case 'ramp-left':
        return Icons.roundabout_left;
      case 'ramp-right':
        return Icons.roundabout_right;
      case 'fork-right':
        return Icons.fork_right;
      case 'fork-left':
        return Icons.fork_left;
      case 'merge':
        return Icons.merge;
      case 'straight':
        return Icons.straight;

      default:
        return Icons.question_mark;
    }
  }

  @override
  bool get wantKeepAlive => true;
}
