import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(children: [
          AgoraVideoViewer(client: controller.agoraClient.client),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              color: Colors.grey[500],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    iconSize: 20.0,
                    onPressed: controller.onMicPressed,
                    icon: Icon(Icons.mic),
                  ),
                  IconButton(
                    iconSize: 36.0,
                    onPressed: controller.onCallEnd,
                    icon: Icon(Icons.call_end),
                  ),
                  IconButton(
                    iconSize: 20.0,
                    onPressed: controller.onSwitchCameraPressed,
                    icon: Icon(Icons.cameraswitch),
                  ),
                  IconButton(
                    iconSize: 20.0,
                    onPressed: controller.onToggledCameraPressed,
                    icon: Icon(Icons.toggle_on_outlined),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
