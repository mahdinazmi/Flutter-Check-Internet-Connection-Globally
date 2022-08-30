import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  late ConnectivityResult result;
  late StreamSubscription < ConnectivityResult > _streamSubscription;
  @override
  Future < void > onInit() async {
    super.onInit();
    _initConnectivity();
    _streamSubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future < void > _initConnectivity() async {
    result = await _connectivity.checkConnectivity();
    return _updateConnectionStatus(result);
  }

 void  _updateConnectionStatus(ConnectivityResult result) {
    if (kDebugMode) print("STATUS : " + result.toString());

    if (result == ConnectivityResult.none) {
      Get.rawSnackbar(
        messageText: const Text(
            'PLEASE CONNECT TO THE INTERNET.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14
            ),
          ),
          isDismissible: false,
          duration: const Duration(days: 1),
          backgroundColor: Colors.red[400] !,
          icon: const Icon(Icons.wifi_off, color: Colors.white, size: 35, ),
          margin: EdgeInsets.zero,
          snackStyle: SnackStyle.GROUNDED
      );
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
  }

}