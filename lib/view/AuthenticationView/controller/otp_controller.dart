// otp_controller.dart
import 'dart:async';
import 'package:get/get.dart';
import 'package:gt_tbb/core/commonStyle/app_constant.dart';
import 'package:gt_tbb/core/commonStyle/custom_toast.dart';
import 'package:gt_tbb/core/services/auth_services.dart';
import 'package:gt_tbb/core/utils/App_loader.dart';
import 'package:gt_tbb/core/utils/local_storage.dart';

import '../../../core/utils/import_list.dart';
import '../view/signInView.dart';

class OtpController extends GetxController {
  final AuthService authService = AuthService();

  var remainingSeconds = 60.obs;
  var isResendEnabled = false.obs;
  var isLoading = false.obs;

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    isResendEnabled.value = false;
    remainingSeconds.value = 60;

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
      } else {
        isResendEnabled.value = true;
        timer.cancel();
      }
    });
  }

  Future<void> verifyOtp({required String otp}) async {
    if (!isResendEnabled.value || isLoading.value) return;
    isLoading.value = true;
    AppLoader.show(message: 'Please wait...');
    try {
      final response = await authService.verifyOtp(otp: otp);
      if (response['success'] == true) {
        CustomToast.showToast(message: response['message']);
        Get.offAll(() => SignInView());
      }else{
        debugPrint(response['message']);
        CustomToast.showToast(message: response['message']);
      }
    } catch (e) {
      debugPrint(e.toString());
      CustomToast.showToast(message: e.toString());
    } finally {
      AppLoader.dismiss();
      isLoading.value = false;
    }
  }


  Future<void> resendOtp({required String email}) async {
    if (!isResendEnabled.value || isLoading.value) return;
    isLoading.value = true;
    try {
      final response = await authService.resendOtp(email: email);
      if (response['success'] == true) {
        var token = response['data']['token'];
        debugPrint(token);
        LocalStorage.saveData(key: AppConstant.otpVerifyToken, data: token);
       CustomToast.showToast(message: response['message']);
        startTimer();
      }else{
        CustomToast.showToast(message: response['message']);
      }
    } catch (e) {
      debugPrint(e.toString());
      CustomToast.showToast(message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}