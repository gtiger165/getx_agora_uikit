import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/call_controller.dart';

class CallView extends GetView<CallController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CallView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CallView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
