import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:gt_tbb/core/network/base_client.dart';
import '../commonStyle/app_constant.dart';
import '../network/end_point.dart';
import '../utils/local_storage.dart';

class AuthService {
  final _baseClient = BaseClient();

  // Login
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
    required String fcmToken,
  }) async {
    final response = await _baseClient.post(
      endpoint: EndPoint.LOGIN,
      body: {
        'email': email,
        'password': password,
        'fcmToken': fcmToken,
      },
    );
    return response.data;
  }

  // create account
  Future<Map<String, dynamic>> createAccount({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await _baseClient.post(
        endpoint: EndPoint.CREAET_ACCOUNT,
        body: {
          "name": name,
          "email": email,
          "password": password,
        }
    );
    return response.data;
  }

  /// forgot password
  Future<Map<String, dynamic>> forgotPassword({
    required String email,
  }) async {
    final response = await _baseClient.post(
      endpoint: EndPoint.FORGOT_PASSWORD,
      body: {
        "email": email
      },
    );
    return response.data;
  }

  /// reset password
  Future<Map<String, dynamic>> resetPassword({
    required String newPassword,
    required String confirmPassword,
  }) async {
    final token = LocalStorage.getData(key: AppConstant.refreshToken);
    final response = await _baseClient.post(
      endpoint: EndPoint.RESET_PASSWORD,
      headers: {
        'Content-Type': 'application/json',
        'token': token,
      },
      body: {
        "newPassword": newPassword,
        "confirmPassword": confirmPassword
      },
    );
    return response.data;
  }

  /// change password
  Future<Map<String, dynamic>> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    final token = LocalStorage.getData(key: AppConstant.accessToken);
    final response = await _baseClient.patch(
      endpoint: EndPoint.CHANGE_PASSWORD,
      headers: {
        'Authorization': 'Bearer $token',
      },
      body: {
        "oldPassword": oldPassword,
        "newPassword": newPassword,
        "confirmPassword": confirmPassword
      },
    );
    return response.data;
  }



  // Get Profile
  Future<Map<String, dynamic>> getProfile() async {
    final token = LocalStorage.getData(key: AppConstant.accessToken);
    final response = await _baseClient.get(
      endpoint: EndPoint.MY_PROFILE,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    return response.data;
  }

  // Update Profile (without image)
  Future<Map<String, dynamic>> updateProfile({
    required String name,
    String? phone,
    String? bio,
  }) async {
    final token = LocalStorage.getData(key: AppConstant.accessToken);
    final response = await _baseClient.put(
      endpoint: EndPoint.UPDATE_PROFILE,
      body: {
        'name': name,
        if (phone != null) 'phone': phone,
        if (bio != null) 'bio': bio,
      },
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    return response.data;
  }

  /*// Update Profile (with image) - Multipart not working
  Future<Map<String, dynamic>> updateProfileWithImage({
    File? profileImage, // Make optional
    required String firstName,
    required String lastName,
    required String contactNumber,
    required String dateOfBirth,
    required String gender,
  }) async {
    final token = LocalStorage.getData(key: AppConst.accessToken);

    // Build FormData conditionally
    Map<String, dynamic> fields = {
      'firstName': firstName,
      'lastName': lastName,
      'contactNumber': contactNumber,
      'dob': dateOfBirth,
      'gender': gender,
    };

    // Only add image if provided
    if (profileImage != null) {
      fields['profileImage'] = await dio.MultipartFile.fromFile(
        profileImage.path,
        filename: 'profile_${DateTime.now().millisecondsSinceEpoch}.jpg',
      );
    }

    final formData = dio.FormData.fromMap(fields);

    final response = await _baseClient.putMultipart(
      endpoint: EndPoint.updateProfile,
      formData: formData,
      headers: {
        'Authorization': 'Bearer $token',
      },
      onSendProgress: (sent, total) {
        if (total != 0) {
          Get.find<ProfileController>().uploadProgress.value = sent / total;
        }
      },
    );

    return response.data;
  }
*/

  // working
  Future<Map<String, dynamic>> updateProfileWithImage({
    File? profileImage,
    required String firstName,
    required String lastName,
    required String contactNumber,
    required String dateOfBirth,
    required String gender,
  }) async {
    final token = LocalStorage.getData(key: AppConstant.accessToken);

    // 1. Data object
    Map<String, dynamic> dataFields = {
      'firstName': firstName.trim(),
      'lastName': lastName.trim(),
      'contactNumber': contactNumber.trim(),
      'dob': dateOfBirth.trim(),
      'gender': gender,
    };

    // 2. JSON string এ convert করো
    String dataJsonString = jsonEncode(dataFields);

    // 3. FormData
    Map<String, dynamic> fields = {
      'data': dataJsonString, // <-- String পাঠাও
    };

    if (profileImage != null) {
      fields['profileImage'] = await dio.MultipartFile.fromFile(
        profileImage.path,
        filename: 'profile_${DateTime.now().millisecondsSinceEpoch}.jpg',
      );
    }

    final formData = dio.FormData.fromMap(fields);

    final response = await _baseClient.putMultipart(
      endpoint: EndPoint.UPDATE_PROFILE,
      formData: formData,
      headers: {
        'Authorization': 'Bearer $token',
      },
      onSendProgress: (sent, total) {
        /*if (total != 0) {
          Get.find<ProfileController>().uploadProgress.value = sent / total;
        }*/
      },
    );

    return response.data;
  }

  /// deleteAccount
  Future<Map<String, dynamic>> accountDelete() async {
    final token = LocalStorage.getData(key: AppConstant.accessToken);
    final response = await _baseClient.delete(
      endpoint: EndPoint.DELETE_ACCOUNT,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    return response.data;
  }
}