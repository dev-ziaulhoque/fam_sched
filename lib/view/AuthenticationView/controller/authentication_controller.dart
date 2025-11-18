import 'package:get/get.dart';
import 'package:gt_tbb/core/commonStyle/custom_toast.dart';
import 'package:gt_tbb/core/services/auth_services.dart';
import 'package:gt_tbb/core/utils/App_loader.dart';

import '../../../core/commonStyle/app_constant.dart';
import '../../../core/utils/import_list.dart';
import '../../../core/utils/local_storage.dart';
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
      AppLoader.show(message: 'Creating Account...');
      final response = await authService.createAccount(
        name: name,
        email: email,
        password: password,
      );

      if (response['success'] == true) {
        var otpToken = response['data']['otpToken']['token'] as String;
        LocalStorage.saveData(key: AppConstant.otpVerifyToken, data: otpToken);

        debugPrint("Account created successfully");
        showDialog(
          context: context,
          builder: (context) => CustomCenterDialog(
            title: "Check Your Email",
            subTitle: "We have sent instruction to your email please check",
            onTap: () {
              Navigator.pop(context);
              Get.to(()=>SignUpOtpVerifyView(email: email,));
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
      AppLoader.dismiss();
    }
  }

  /// sign in

}