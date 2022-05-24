import 'package:agora_uikit/agora_uikit.dart';
import 'package:getx_agora_uikit/app/constants/agora_constant.dart';

class AgoraUtil {
  late AgoraClient _client;
  AgoraClient get client => _client;

  AgoraUtil() {
    _client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: AgoraConstant.appId,
        channelName: "test",
      ),
      enabledPermission: [
        Permission.camera,
        Permission.microphone,
      ],
    );
  }

  void initialize() async => await _client.initialize();
}
