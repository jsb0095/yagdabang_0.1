import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:yagdabang/controller/bottom_nav_controller.dart';

import '../controller/UploadContorller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController(), permanent: true);
    Get.put(UploadController(), permanent: true);
  }
}
