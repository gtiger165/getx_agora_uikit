import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_agora_uikit/app/util/agora_util.dart';

class HomeController extends GetxController {
  final agoraClient = AgoraUtil();

  @override
  void onInit() {
    super.onInit();
    agoraClient.initialize();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void onMicPressed() async {}

  void onCallEnd() {
    agoraClient.leaveChannel().then((value) {
      debugPrint("on leave channel success");
    });
  }

  void onSwitchCameraPressed() async {}

  void onToggledCameraPressed() async {}
}
