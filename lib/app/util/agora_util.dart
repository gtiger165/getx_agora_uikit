import 'dart:math';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:agora_uikit/controllers/rtc_buttons.dart';
import 'package:getx_agora_uikit/app/constants/agora_constant.dart';

class AgoraUtil {
  late AgoraClient _client;
  late RtcEngine? _engine;
  AgoraClient get client => _client;
  final String channelName;
  final AgoraRtcEventHandlers eventHandlers;

  AgoraUtil(this.channelName, this.eventHandlers) {
    _client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: AgoraConstant.appId,
        channelName: channelName,
        tokenUrl: AgoraConstant.tokenUrl,
        rtmEnabled: false,
        uid: Random().nextInt(1000),
      ),
      enabledPermission: [
        Permission.camera,
        Permission.microphone,
      ],
      agoraEventHandlers: eventHandlers,
    );
  }

  void initialize() async {
    await _client.initialize();
    _engine = _client.sessionController.value.engine;
  }

  Future<void> _enableAudio() async => await _engine?.enableAudio();
  Future<void> _disableAudio() async => await _engine?.disableAudio();

  Future<void> _enableVideo() async => await _engine?.enableVideo();
  Future<void> _disableVideo() async => await _engine?.disableVideo();

  Future<void> toogleAudio(bool isToogledAudio) async =>
      isToogledAudio ? await _enableAudio() : await _disableAudio();
  Future<void> toggleCamera(bool isToggledCamera) async =>
      isToggledCamera ? await _enableVideo() : await _disableVideo();
  Future<void> leaveChannel() async =>
      await endCall(sessionController: _client.sessionController);
}
