import 'dart:async';

import 'package:flutter/material.dart';

import '../utils/duration_formater.dart';

class DurationCounterWidget extends StatefulWidget {
  const DurationCounterWidget(
    this.duration, {
    Key? key,
  }) : super(key: key);

  final Duration duration;

  @override
  State<DurationCounterWidget> createState() => _DurationCounterWidgetState();
}

class _DurationCounterWidgetState extends State<DurationCounterWidget> {
  bool isStarted = false;
  late Duration duration;
  @override
  void initState() {
    duration = widget.duration;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Timer.periodic(const Duration(seconds: 1), (timer) {
          setState(() {
            duration = duration + Duration(seconds: timer.tick);
          });
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 250,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
          ),
          Text(
            format(duration),
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 60,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
