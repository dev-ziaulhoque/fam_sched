import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;

/// Complete BaseClient - Sob kicu handle korbe
/// - GET, POST, PUT, DELETE, PATCH
/// - Multipart/FormData (image, file upload)
/// - Download files
/// - Upload progress tracking
/// - Download progress tracking
/// - Error handling
/// - Logging

class BaseClient {
  // ==========================================
  // Singleton Pattern
  // ==========================================
  static final BaseClient _instance = BaseClient._internal();
  factory BaseClient() => _instance;
  BaseClient._internal();

  late Dio _dio;

  // ==========================================
  // Initialize - App start e ekbar call korbe
  // ==========================================
  void init({
    String? baseUrl,
    Map<String, dynamic>? headers,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Duration? sendTimeout,
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? '',
        connectTimeout: connectTimeout ?? const Duration(seconds: 60),
        receiveTimeout: receiveTimeout ?? const Duration(seconds: 60),
        sendTimeout: sendTimeout ?? const Duration(seconds: 60),
        headers: headers ?? {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        validateStatus: (status) => true,
      ),
    );

    // Interceptor for logging
    _dio.interceptors.add(_createInterceptor());
  }

  // ==========================================
  // Interceptor - Automatic logging
  // ==========================================
  InterceptorsWrapper _createInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        debugPrint("┌────────────────────────────────────────────────────────");
        debugPrint("│ 🚀 REQUEST");
        debugPrint("├────────────────────────────────────────────────────────");
        debugPrint("│ Method: ${options.method}");
        debugPrint("│ URL: ${options.baseUrl}${options.path}");
        debugPrint("│ Headers: ${options.headers}");

        if (options.queryParameters.isNotEmpty) {
          debugPrint("│ Query Params: ${options.queryParameters}");
        }

        if (options.data != null) {
          if (options.data is FormData) {
            final formData = options.data as FormData;
            debugPrint("│ Content-Type: multipart/form-data");
            debugPrint("│ Fields: ${formData.fields}");
            debugPrint("│ Files: ${formData.files.length} file(s)");
            for (var file in formData.files) {
              debugPrint("│   - ${file.key}: ${file.value.filename}");
            }
          } else {
            debugPrint("│ Body: ${options.data}");
          }
        }

        debugPrint("└────────────────────────────────────────────────────────");
        handler.next(options);
      },
      onResponse: (response, handler) {
        debugPrint("┌────────────────────────────────────────────────────────");
        debugPrint("│ ✅ RESPONSE");
        debugPrint("├────────────────────────────────────────────────────────");
        debugPrint("│ Status Code: ${response.statusCode}");
        debugPrint("│ Data: ${response.data}");
        debugPrint("└────────────────────────────────────────────────────────");
        handler.next(response);
      },
      onError: (error, handler) {
        debugPrint("┌────────────────────────────────────────────────────────");
        debugPrint("│ ❌ ERROR");
        debugPrint("├────────────────────────────────────────────────────────");
        debugPrint("│ Type: ${error.type}");
        debugPrint("│ Message: ${error.message}");
        debugPrint("│ Status Code: ${error.response?.statusCode}");
        debugPrint("└────────────────────────────────────────────────────────");
        handler.next(error);
      },
    );
  }

  // ==========================================
  // GET Request
  // ==========================================
  Future<Response> get({
    required String endpoint,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: params,
        options: Options(headers: headers),
        cancelToken: cancelToken,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // ==========================================
  // POST Request (JSON)
  // ==========================================
  Future<Response> post({
    required String endpoint,
    dynamic body,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: body,
        queryParameters: params,
        options: Options(headers: headers),
        cancelToken: cancelToken,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // ==========================================
  // POST Request (Multipart/FormData)
  // ==========================================
  Future<Response> postMultipart({
    required String endpoint,
    required FormData formData,
    Map<String, dynamic>? headers,
    Function(int sent, int total)? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: formData,
        options: Options(
          headers: {
            ...?headers,
            'Content-Type': 'multipart/form-data',
          },
        ),
        onSendProgress: onSendProgress,
        cancelToken: cancelToken,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // ==========================================
  // PUT Request (JSON)
  // ==========================================
  Future<Response> put({
    required String endpoint,
    dynamic body,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: body,
        queryParameters: params,
        options: Options(headers: headers),
        cancelToken: cancelToken,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // ==========================================
  // PUT Request (Multipart/FormData)
  // ==========================================
  Future<Response> putMultipart({
    required String endpoint,
    required FormData formData,
    Map<String, dynamic>? headers,
    Function(int sent, int total)? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: formData,
        options: Options(
          headers: {
            ...?headers,
            'Content-Type': 'multipart/form-data',
          },
        ),
        onSendProgress: onSendProgress,
        cancelToken: cancelToken,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // ==========================================
  // PATCH Request (JSON)
  // ==========================================
  Future<Response> patch({
    required String endpoint,
    dynamic body,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.patch(
        endpoint,
        data: body,
        queryParameters: params,
        options: Options(headers: headers),
        cancelToken: cancelToken,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // ==========================================
  // PATCH Request (Multipart/FormData)
  // ==========================================
  Future<Response> patchMultipart({
    required String endpoint,
    required FormData formData,
    Map<String, dynamic>? headers,
    Function(int sent, int total)? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.patch(
        endpoint,
        data: formData,
        options: Options(
          headers: {
            ...?headers,
            'Content-Type': 'multipart/form-data',
          },
        ),
        onSendProgress: onSendProgress,
        cancelToken: cancelToken,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // ==========================================
  // DELETE Request
  // ==========================================
  Future<Response> delete({
    required String endpoint,
    dynamic body,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete(
        endpoint,
        data: body,
        queryParameters: params,
        options: Options(headers: headers),
        cancelToken: cancelToken,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // ==========================================
  // Download File
  // ==========================================
  Future<Response> downloadFile({
    required String url,
    required String savePath,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    Function(int received, int total)? onReceiveProgress,
    CancelToken? cancelToken,
    bool deleteOnError = true,
  }) async {
    try {
      final response = await _dio.download(
        url,
        savePath,
        queryParameters: params,
        options: Options(headers: headers),
        onReceiveProgress: onReceiveProgress,
        cancelToken: cancelToken,
        deleteOnError: deleteOnError,
      );
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // ==========================================
  // Upload File (Generic method)
  // ==========================================
  Future<Response> uploadFile({
    required String endpoint,
    required File file,
    String fileKey = 'file',
    String? filename,
    Map<String, dynamic>? additionalData,
    Map<String, dynamic>? headers,
    Function(int sent, int total)? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        fileKey: await MultipartFile.fromFile(
          file.path,
          filename: filename ?? file.path.split('/').last,
        ),
        ...?additionalData,
      });

      return await postMultipart(
        endpoint: endpoint,
        formData: formData,
        headers: headers,
        onSendProgress: onSendProgress,
        cancelToken: cancelToken,
      );
    } catch (e) {
      rethrow;
    }
  }

  // ==========================================
  // Upload Multiple Files
  // ==========================================
  Future<Response> uploadMultipleFiles({
    required String endpoint,
    required List<File> files,
    String filesKey = 'files',
    List<String>? filenames,
    Map<String, dynamic>? additionalData,
    Map<String, dynamic>? headers,
    Function(int sent, int total)? onSendProgress,
    CancelToken? cancelToken,
    bool usePatch = false, // NEW
  }) async {
    try {
      List<MultipartFile> multipartFiles = [];

      for (int i = 0; i < files.length; i++) {
        multipartFiles.add(
          await MultipartFile.fromFile(
            files[i].path,
            filename: filenames != null && filenames.length > i
                ? filenames[i]
                : files[i].path.split('/').last,
          ),
        );
      }

      FormData formData = FormData.fromMap({
        filesKey: multipartFiles,
        ...?additionalData,
      });

      if (usePatch) {
        return await patchMultipart(
          endpoint: endpoint,
          formData: formData,
          headers: headers,
          onSendProgress: onSendProgress,
          cancelToken: cancelToken,
        );
      } else {
        return await postMultipart(
          endpoint: endpoint,
          formData: formData,
          headers: headers,
          onSendProgress: onSendProgress,
          cancelToken: cancelToken,
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  // ==========================================
  // Upload from Bytes (for web)
  // ==========================================
  Future<Response> uploadFromBytes({
    required String endpoint,
    required Uint8List bytes,
    required String filename,
    String fileKey = 'file',
    Map<String, dynamic>? additionalData,
    Map<String, dynamic>? headers,
    Function(int sent, int total)? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        fileKey: MultipartFile.fromBytes(bytes, filename: filename),
        ...?additionalData,
      });

      return await postMultipart(
        endpoint: endpoint,
        formData: formData,
        headers: headers,
        onSendProgress: onSendProgress,
        cancelToken: cancelToken,
      );
    } catch (e) {
      rethrow;
    }
  }

  // ==========================================
  // Response Handler
  // ==========================================
  Response _handleResponse(Response response) {
    final statusCode = response.statusCode ?? 0;

    if (statusCode >= 200 && statusCode <= 210) {
      return response;
    } else if (statusCode == 401) {
      _handleUnauthorized(response);
      throw 'Unauthorized access';
    } else if (statusCode == 404) {
      final message = _getErrorMessage(response);
      Get.snackbar('Error', message, snackPosition: SnackPosition.BOTTOM);
      throw 'Page not found';
    } else if (statusCode == 400) {
      final message = _getErrorMessage(response);
      Get.snackbar('Error', message, snackPosition: SnackPosition.BOTTOM);
      throw message;
    } else if (statusCode == 403) {
      final message = _getErrorMessage(response);
      Get.snackbar('Error', message, snackPosition: SnackPosition.BOTTOM);
      throw message;
    } else if (statusCode == 406) {
      final message = _getErrorMessage(response);
      Get.snackbar('Error', message, snackPosition: SnackPosition.BOTTOM);
      throw message;
    } else if (statusCode == 500) {
      throw 'Server error occurred';
    } else {
      final message = _getErrorMessage(response);
      throw message;
    }
  }

  // ==========================================
  // Extract Error Message
  // ==========================================
  String _getErrorMessage(Response response) {
    try {
      if (response.data != null) {
        final data = response.data;

        if (data['message'] != null) {
          return data['message'];
        }

        if (data['errors'] != null) {
          final errors = data['errors'];
          if (errors is String) {
            return errors;
          } else if (errors is Map) {
            final firstKey = errors.keys.first;
            final firstError = errors[firstKey];
            if (firstError is List && firstError.isNotEmpty) {
              return firstError[0];
            }
            return firstError.toString();
          }
        }
      }
    } catch (e) {
      debugPrint('Error parsing message: $e');
    }
    return 'Something went wrong';
  }

  // ==========================================
  // Handle Unauthorized (401)
  // ==========================================
  void _handleUnauthorized(Response response) {
    debugPrint("⚠️ Unauthorized - Redirecting to login");
    // Token clear logic here
    // await LocalStorage.removeData(key: 'token');
    // Get.offAll(() => SignInView());
  }

  // ==========================================
  // Dio Error Handler
  // ==========================================
  String _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timeout';

      case DioExceptionType.badResponse:
        return _getErrorMessage(error.response!);

      case DioExceptionType.cancel:
        return 'Request cancelled';

      case DioExceptionType.connectionError:
        if (error.error is SocketException) {
          return 'No internet connection';
        }
        return 'Connection error';

      default:
        return 'Something went wrong';
    }
  }

  // ==========================================
  // Cancel Request
  // ==========================================
  CancelToken createCancelToken() {
    return CancelToken();
  }

  // ==========================================
  // Logout
  // ==========================================
  void logout() {
    // Clear token logic
    // await LocalStorage.removeData(key: 'token');
    // Get.offAll(() => SignInView());
  }

  // ==========================================
  // Get Dio Instance (jodi advanced use korte chao)
  // ==========================================
  Dio get dio => _dio;
}