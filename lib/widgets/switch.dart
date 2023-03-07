import 'package:flutter/material.dart';

class MusicSwitch extends StatefulWidget {
  final bool isplay;

  const MusicSwitch({required this.isplay});

  @override
  State<MusicSwitch> createState() => _MusicSwitchState();
}

class _MusicSwitchState extends State<MusicSwitch> {
  bool on = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.0,
      height: 80.0,
      child: Center(
        child: Column(
          children: [
            Transform.scale(
              scale: 1.5,
              child: Switch(
                activeColor: Colors.greenAccent,
                inactiveTrackColor: Colors.grey,
                value: on,
                onChanged: (bool value) {
                  setState(
                    () {
                      on = value;
                    },
                  );
                },
              ),
            ),
            Text(
              "Sound ${on ? "On" : "Off"}",
              style: const TextStyle(color: Colors.white, fontSize: 15.0),
            ),
          ],
        ),
      ),
    );
  }
}
