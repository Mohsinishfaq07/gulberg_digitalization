class AppUrl {
  // static const String baseUrl = 'https://qa-uremitapi.appinsnap.com/api/v1/';
  static const String mapKey = "AIzaSyDtBoDqh6Vr0qg9q9iKLotrmq19d67rBj8";
  // static const String baseUrl = 'http://52.230.119.123:3015/api/v1/';
  static const String baseUrl = 'http://52.230.119.123:3010/api/v1/';

  /// Auth Urls
  static const String cnicConfirmation = 'auth/cnicVerification';
  static const String requestOtp = 'auth/otpRequest';
  static const String verifyOtp = 'auth/verifyOTP';
  static const String setPin = 'user/setPIN';
  static const String registerUser = 'user/register';
  static const String loginUser = 'auth/login';
  static const String verifyOtpWithCnci = 'auth/cnicValidation';

  /// wallet urls
  static const String createWalletAccount = 'zindigi/accountOpening';
  static const String createWalletAccountOtpGeneration =
      'zindigi/generateOTPAccOpening';
  static const String createWalletAccountVerification =
      'zindigi/verifyOTPAccOpening';
  static const String getWalletInfo = 'zindigi/balanceInquiry';
  static const String linkAccountVerification = 'zindigi/verifyAccountToLink';
  static const String linkZindigiAccount = 'zindigi/linkAccount';
  static const String unlinkZindigiAccount = 'zindigi/deLinkAccount';
  static const String unlinkAccountVerification = 'zindigi/deLinkAccountOTP';

  /// bill urls
  static const String getBills = 'bill?';
  static const String payWithZindigi = 'zindigi/payment';
  static const String getOtpForPayment = 'zindigi/paymentInquiry';
  static const String getBillHistory = 'history?';

  ///payfast urls
  static const String payfastSuccessUrl = 'payment/payfast/success/';
  static const String payfastFailureUrl = 'payment/payfast/failure?';
  static const String payfastCheckoutUrl = 'payment/payfast/checkout/';
}
