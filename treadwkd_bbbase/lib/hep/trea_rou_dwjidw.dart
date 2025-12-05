import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TreaRouDwjidw {
  static toJdeidedelde({
    required String routerName,
    Map<String, dynamic>? params,
  }){
    Get.toNamed(routerName,arguments: params);
  }

  static offFekjiodejod({
    required String routerName,
    Map<String, dynamic>? params,
  }){
    Get.offNamed(routerName,arguments: params);
  }

  static offAllfwdjowjdow({
    required String routerName,
    Map<String, dynamic>? params,
  }){
    Get.offAllNamed(routerName,arguments: params);
  }

  static showDdjwidjow({
    required Widget child,
    Color? barrierColor,
  }){
    Get.dialog(
      child,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.8),
    );
  }

  static backdwhudie(){
    Get.back();
  }

  static toHomedwhidhiw({required String str}){
    Get.until((route)=>route.settings.name==str);
  }

  static Map<String, dynamic> getPwjidjwodw(){
    try {
      return Get.arguments as Map<String, dynamic>;
    } catch (e) {
      return {};
    }
  }
}