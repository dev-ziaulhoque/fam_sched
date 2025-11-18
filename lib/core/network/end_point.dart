class EndPoint {
  static const String BASE_URL = 'http://103.186.20.117:6109/api/v1';

  /// login url
  static const String CREAET_ACCOUNT = '$BASE_URL/users';
  static const String LOGIN = '$BASE_URL/auth/login';
  static const String REFRESH_TOKEN = '$BASE_URL/auth/refresh-token';

  /// forgot password url
  static const String FORGOT_PASSWORD = '$BASE_URL/auth/forgot-password';
  static const String RESET_PASSWORD = '$BASE_URL/auth/reset-password';

  /// profile url
  static const String MY_PROFILE = '$BASE_URL/users/my-profile';
  static const String UPDATE_PROFILE = '$BASE_URL/users/update-my-profile';

  /// otp
  static const String VERIFY_OTP = '$BASE_URL/otp/verify-otp';
  static const String RESEND_OTP = '$BASE_URL/otp/resend-otp';

  /// setting url
  static const String CHANGE_PASSWORD = '$BASE_URL/auth/change-password';
  static const String DELETE_ACCOUNT = '$BASE_URL/users/delete-my-account';
}