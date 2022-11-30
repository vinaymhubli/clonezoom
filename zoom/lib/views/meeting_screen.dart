import 'dart:math';
import 'package:flutter/material.dart';
import 'package:zoom/resources/jitsi.dart';
import 'package:zoom/utils/colors.dart';
import 'package:zoom/widget/meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({Key? key}) : super(key: key);

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/video-call');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
              onPressed: createNewMeeting,
              text: 'Meeting',
              icon: Icons.videocam,
            ),
            HomeMeetingButton(
              onPressed: () => joinMeeting(context),
              text: 'Join',
              icon: Icons.add_box_rounded,
            ),
            HomeMeetingButton(
              onPressed: () {},
              text: 'Schedule',
              icon: Icons.calendar_today,
            ),
            HomeMeetingButton(
              onPressed: () {},
              text: 'Invite',
              icon: Icons.share_outlined,
            )
            
          ],
        ),
        const Expanded(
          child: Center(
            child: Text(
              'Start or join a meeting',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: footerColor
              ),
            ),
          ),
        ),
      ],
    );
  }
}