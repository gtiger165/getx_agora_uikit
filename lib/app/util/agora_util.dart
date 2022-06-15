import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:getx_agora_uikit/app/constants/agora_constant.dart';

class AgoraUtil {
  late AgoraClient _client;
  late RtcEngine? _engine;
  AgoraClient get client => _client;

  AgoraUtil() {
    _client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: AgoraConstant.appId,
        channelName: AgoraConstant.tempChannel,
        tempToken: AgoraConstant.tempToken,
      ),
      enabledPermission: [
        Permission.camera,
        Permission.microphone,
      ],
      agoraEventHandlers: AgoraEventHandlers(
        joinChannelSuccess: (channel, uid, elapsed) =>
            debugPrint("succes on joining channel -> $channel"),
        onError: (e) => debugPrint("on error $e"),
        leaveChannel: (stats) => debugPrint("success on leave channel"),
      ),
    );
  }

  void initialize() async {
    _engine = _client.sessionController.value.engine;
    await _client.initialize();
  }

  Future<void> _enableAudio() async => await _engine?.enableAudio();
  Future<void> _disableAudio() async => await _engine?.disableAudio();

  Future<void> _enableVideo() async => await _engine?.enableVideo();
  Future<void> _disableVideo() async => await _engine?.disableVideo();

  Future<void> toogleAudio(bool isToogledAudio) async =>
      isToogledAudio ? await _enableAudio() : await _disableAudio();
  Future<void> toggleCamera(bool isToggledCamera) async =>
      isToggledCamera ? await _enableVideo() : await _disableVideo();
  Future<void> leaveChannel() async => await _engine?.leaveChannel();
}
