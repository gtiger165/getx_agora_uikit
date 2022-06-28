import 'dart:developer';

import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_agora_uikit/app/util/agora_util.dart';

class HomeController extends FullLifeCycleController with FullLifeCycleMixin {
  late AgoraUtil agoraClient;

  @override
  void onInit() {
    super.onInit();
    agoraClient = AgoraUtil(
      "channel-name",
      AgoraRtcEventHandlers(
        joinChannelSuccess: (channel, uid, elapsed) => debugPrint(
            "HomeController - joinChannelSuccess: succes on joining channel -> $channel, elapsed -> $elapsed"),
        onError: (e) => debugPrint("HomeController - onError: on error $e"),
        leaveChannel: (stats) => debugPrint(
            "HomeController - leaveChannel: success on leave channel"),
        userJoined: (uid, elapsed) => debugPrint(
            "HomeController - userJoined: remote user $uid success joined at $elapsed"),
        rejoinChannelSuccess: (channel, uid, elapsed) => debugPrint(
            "HomeController - rejoinChannelSuccess: remote user $uid rejoin on $channel, on time $elapsed"),
      ),
    );
    agoraClient.initialize();
  }

  @override
  void onReady() {
    super.onReady();
    log("HomeController - onReady: executed");
  }

  @override
  void onClose() async {
    log("HomeController - onClose: executed");
    await agoraClient.leaveChannel();
  }

  @override
  InternalFinalCallback<void> get onDelete {
    log("HomeController - onDelete: executed");
    return super.onDelete;
  }

  @override
  InternalFinalCallback<void> get onStart {
    log("HomeController - onStart: executed");
    return super.onStart;
  }

  @override
  void onDetached() {
    log("HomeController - onDetached: executed");
  }

  @override
  void onInactive() {
    log("HomeController - onInactive: executed");
  }

  @override
  void onPaused() {
    log("HomeController - onPaused: executed");
  }

  @override
  void onResumed() {
    log("HomeController - onResumed: executed");
  }

  void onMicPressed() async {}

  void onCallEnd() async {
    await agoraClient.leaveChannel();
    debugPrint("on leave channel success");
  }

  void onSwitchCameraPressed() async {}

  void onToggledCameraPressed() async {}
}
