import 'package:get/get.dart';
import 'package:getx_agora_uikit/app/modules/home/bindings/home_binding.dart';
import 'package:getx_agora_uikit/app/modules/home/views/home_view.dart';

class CallController extends GetxController {
  void toVcallPage() {
    Get.to(() => HomeView(), binding: HomeBinding());
  }
}
