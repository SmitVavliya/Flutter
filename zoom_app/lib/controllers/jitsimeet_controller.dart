// ignore_for_file: avoid_print

import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_app/controllers/auth_controller.dart';
import 'package:zoom_app/controllers/firestore_controller.dart';

class JitsiMeetController {
  final AuthController _authController = AuthController();
  final FirestoreController _firestoreController = FirestoreController();

  createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String? username,
  }) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360

      String? displayName = username;
      if (username != null) {
        displayName = _authController.currentUser?.displayName;
      }

      var options = JitsiMeetingOptions(room: roomName)
        ..userDisplayName = displayName
        ..userEmail = _authController.currentUser?.email
        ..userAvatarURL = _authController.currentUser?.photoURL
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;

      if (roomName.isNotEmpty) {
        _firestoreController.addmeetingToFirestore(roomName);
      }

      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print("error: $error");
    }
  }
}
