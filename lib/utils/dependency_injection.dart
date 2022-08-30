
import 'package:connectivity/network/controllers/network_controller.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void init() async {
    //services
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}