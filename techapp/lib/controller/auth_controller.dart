import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final codeControllers = List.generate(5, (_) => TextEditingController());
  final codeFocusNodes = List.generate(5, (_) => FocusNode());
  final codeValue = ''.obs;

  String get verificationCode => codeControllers.map((c) => c.text).join();

  void updateCode() {
    codeValue.value = verificationCode;
  }

  void clearCode() {
    for (final controller in codeControllers) {
      controller.clear();
    }
    codeFocusNodes.first.requestFocus();
    updateCode();
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    for (final controller in codeControllers) {
      controller.dispose();
    }
    for (final focus in codeFocusNodes) {
      focus.dispose();
    }
    super.onClose();
  }
}
