import 'package:get/get.dart';
import 'package:gt_tbb/core/commonStyle/custom_toast.dart';
import 'package:gt_tbb/core/services/auth_services.dart';

import '../../../core/utils/import_list.dart';
import '../view/signUpOtpView.dart';

class AuthenticationController extends GetxController{
  final AuthService authService = AuthService();

  /// sign up
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();



  var isLoading = false.obs;

  Future<void> createAccount({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
}) async {
    try {
      isLoading.value = true;
      final response = await authService.createAccount(
        name: name,
        email: email,
        password: password,
      );

      if (response['success'] == true) {
        debugPrint("Account created successfully");
        showDialog(
          context: context,
          builder: (context) => CustomCenterDialog(
            title: "Check Your Email",
            subTitle: "We have sent instruction to your email please check",
            onTap: () {
              Navigator.pop(context);
              Get.to(()=>SignUpOtpVerifyView());
            },
          ),
        );
      }else{
        CustomToast.showToast(message: response['message'], isError: true);
        debugPrint(response['message']);
      }
    } catch (e) {
      debugPrint("Account creation error $e");
      CustomToast.showToast(message: e.toString(), isError: true);
    }finally{
      isLoading.value = false;
    }
  }

  /// sign in



}