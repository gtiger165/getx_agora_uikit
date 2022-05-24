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
          AgoraVideoButtons(client: controller.agoraClient.client),
        ]),
      ),
    );
  }
}
