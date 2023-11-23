import 'dart:async';

import 'package:custom_timer/custom_timer.dart';
import 'package:fitness_flutter/core/service/date_service.dart';
import 'package:flutter/material.dart';

class StartWorkoutTimer extends StatefulWidget {
  final int time;
  final bool isPaused;

  StartWorkoutTimer({
    required this.time,
    required this.isPaused,
  });

  @override
  _StartWorkoutTimerState createState() => _StartWorkoutTimerState();
}

class _StartWorkoutTimerState extends State<StartWorkoutTimer> {
  get controller => null;

  @override
  Widget build(BuildContext context) {
    return widget.isPaused ? _createPauseText() : _createCountdownTimer();
  }

  Widget _createCountdownTimer() {
    return CustomTimer(
      // Duration(seconds: widget.time),
      builder: (CustomTimerState state, CustomTimerRemainingTime remaining) {
        return Text(
          "${remaining.minutes}:${remaining.seconds}",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        );
      }, controller: controller,
    );
  }

  Widget _createPauseText() {
    final minutesSeconds = DateService.convertIntoSeconds(widget.time);
    return Text(
      "${minutesSeconds.minutes.toString().padLeft(2, '0')}:${minutesSeconds.seconds.toString().padLeft(2, '0')}",
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class CustomTimerAction {
  static var auto_start;
}
