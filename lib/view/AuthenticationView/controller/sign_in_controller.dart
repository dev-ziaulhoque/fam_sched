import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/commonStyle/app_constant.dart';
import '../../../core/commonStyle/custom_toast.dart';
import '../../../core/services/auth_services.dart';
import '../../../core/utils/App_loader.dart';
import '../../../core/utils/local_storage.dart';
import '../../homeView/homeView.dart';
import '../widget/alertDiallogWidget.dart';

class SignInController extends GetxController{
  final AuthService authService = AuthService();

  /// sign up
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var isLoading = false.obs;

  Future<void> loginAccount({
    required String email,
    required String password,
  }) async {
    try {
      AppLoader.show(message: 'Please wait...');
      final response = await authService.login(
        email: email,
        password: password,
        fcmToken: ''
      );

      if (response['success'] == true) {
        var accessToken = response['data']['accessToken'] as String;
        var refreshToken = response['data']['refreshToken'] as String;

        LocalStorage.saveData(key: AppConstant.accessToken, data: accessToken);
        LocalStorage.saveData(key: AppConstant.refreshToken, data: refreshToken);

        debugPrint("Login success $accessToken");
        Get.offAll(()=>HomeView());
      }else{
        CustomToast.showToast(message: response['message'], isError: true);
        debugPrint(response['message']);
      }
    } catch (e) {
      debugPrint("Account creation error $e");
      CustomToast.showToast(message: e.toString(), isError: true);
    }finally{
      AppLoader.dismiss();
    }
  }

}