// ignore_for_file: avoid_print

import 'dart:math';

import "package:flutter/material.dart";
import 'package:zoom_app/controllers/jitsimeet_controller.dart';
import 'package:zoom_app/views/screens/video_call_screen.dart';
import 'package:zoom_app/views/screens/widgets/reusable_icon.dart';

class MeetingScreen extends StatefulWidget {
  const MeetingScreen({Key? key}) : super(key: key);

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  final int range = 100000000;
  final JitsiMeetController _jitsiMeetController = JitsiMeetController();

  createMeeting() async {
    try {
      var random = Random();
      String roomName = (random.nextInt(range) + range).toString();

      await _jitsiMeetController.createMeeting(
        roomName: roomName,
        isAudioMuted: true,
        isVideoMuted: true,
      );
    } catch (e) {
      print("createMeeting: $e");
    }
  }

  joinMeeting() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return const VideoCallScreen();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ReuseAbleIcon(
                icon: Icons.videocam,
                text: "New Meeting",
                onPressed: createMeeting,
              ),
              ReuseAbleIcon(
                icon: Icons.add_box_rounded,
                text: "Join Meeting",
                onPressed: joinMeeting,
              ),
              ReuseAbleIcon(
                icon: Icons.calendar_today,
                text: "Schedule",
                onPressed: () {},
              ),
              ReuseAbleIcon(
                icon: Icons.screen_share_outlined,
                text: "Share Screen",
                onPressed: () {},
              ),
            ],
          ),
          const Expanded(
            child: Center(
              child: Text(
                "Create / Join Meeting",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
