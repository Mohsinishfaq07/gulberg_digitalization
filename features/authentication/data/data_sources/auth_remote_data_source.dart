import 'dart:async';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:sb_myreports/features/authentication/data/model/cnic_confirmation_request_model.dart';
import 'package:sb_myreports/features/authentication/data/model/cnic_confirmation_response_model.dart';
import 'package:sb_myreports/features/authentication/data/model/otp_request_modal.dart';
import 'package:sb_myreports/features/authentication/data/model/verify_otp_request_model.dart';
import 'package:sb_myreports/features/authentication/data/model/verify_otp_response_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/modals/error_response_model.dart';
import '../../../../core/utils/constants/app_messages.dart';
import '../../../../core/utils/constants/app_url.dart';
import '../model/login_user_request_model.dart';
import '../model/login_user_response_model.dart';
import '../model/otp_response_modal.dart';
import '../model/register_user_request_model.dart';
import '../model/register_user_response_model.dart';
import '../model/set_pin_request_model.dart';
import '../model/set_pin_response_model.dart';
import '../model/verify_otp_with_cnic_request_model.dart';
import '../model/verify_otp_with_cnic_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<OtpResponseModel> requestOtp(OtpRequestModel params);

  ///
  Future<VerifyOtpResponseModel> verifyOtp(VerifyOtpRequestModel params);

  ///
  Future<RegisterUserResponseModel> registerUser(
      RegisterUserRequestModel params);

  ///
  Future<LoginUserResponseModel> loginUser(LoginUserRequestModel params);

  ///
  Future<SetPinResponseModel> setPin(SetPinRequestModel params);

  ///
  Future<CnicConfirmationResponseModel> cnicConfirmation(
      CnicConfirmationRequestModel params);

  ///
  Future<VerifyOtpWithCnicResponseModel> verifyOtpWithCnic(
      VerifyOtpWithCnicRequestModel params);
}

class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  Dio dio;
  AuthRemoteDataSourceImp({required this.dio});

  //! Login API CALL

  @override
  Future<OtpResponseModel> requestOtp(OtpRequestModel params) async {
    String url = AppUrl.baseUrl + AppUrl.requestOtp;

    try {
      final response = await dio.post(url, data: params.toJson());

      if (response.statusCode == 200) {
        var object = OtpResponseModel.fromJson(response.data);

        return object;
      } else if (response.statusCode == 401) {
        throw "User not Found.";
      }

      throw const SomethingWentWrong(AppMessages.somethingWentWrong);
    } on DioError catch (exception) {
      Logger().i('returning error');
      if (exception.type == DioErrorType.connectTimeout) {
        throw TimeoutException(AppMessages.timeOut);
      } else {
        ErrorResponseModel errorResponseModel =
            ErrorResponseModel.fromJson(exception.response?.data);
        throw SomethingWentWrong(errorResponseModel.msg);
      }
    } catch (e) {
      throw SomethingWentWrong(e.toString());
    }
  }

  //! Signup API CALL

  @override
  Future<VerifyOtpResponseModel> verifyOtp(VerifyOtpRequestModel params) async {
    String url = AppUrl.baseUrl + AppUrl.verifyOtp;

    try {
      final response = await dio.post(url, data: params.toJson());

      if (response.statusCode == 200) {
        var object = VerifyOtpResponseModel.fromJson(response.data);

        return object;
      }

      throw const SomethingWentWrong(AppMessages.somethingWentWrong);
    } on DioError catch (exception) {
      Logger().i('returning error');
      if (exception.type == DioErrorType.connectTimeout) {
        throw TimeoutException(AppMessages.timeOut);
      } else {
        ErrorResponseModel errorResponseModel =
            ErrorResponseModel.fromJson(exception.response?.data);
        throw SomethingWentWrong(errorResponseModel.msg);
      }
    } catch (e) {
      throw SomethingWentWrong(e.toString());
    }
  }

  @override
  Future<CnicConfirmationResponseModel> cnicConfirmation(
      CnicConfirmationRequestModel params) async {
    String url = AppUrl.baseUrl + AppUrl.cnicConfirmation;

    try {
      final response = await dio.post(url, data: params.toJson());
      if (response.statusCode == 200) {
        var object = CnicConfirmationResponseModel.fromJson(response.data);

        return object;
      }

      throw const SomethingWentWrong(AppMessages.somethingWentWrong);
    } on DioError catch (exception) {
      print(exception.toString());
      Logger().i('returning error');
      if (exception.type == DioErrorType.connectTimeout) {
        throw TimeoutException(AppMessages.timeOut);
      } else {
        ErrorResponseModel errorResponseModel =
            ErrorResponseModel.fromJson(exception.response?.data);
        throw SomethingWentWrong(errorResponseModel.msg);
      }
    } catch (e) {
      throw SomethingWentWrong(e.toString());
    }
  }

  @override
  Future<RegisterUserResponseModel> registerUser(
      RegisterUserRequestModel params) async {
    String url = AppUrl.baseUrl + AppUrl.registerUser;

    try {
      final response = await dio.post(url, data: params.toJson());
      if (response.statusCode == 201) {
        var object = RegisterUserResponseModel.fromJson(response.data);

        return object;
      }

      throw const SomethingWentWrong(AppMessages.somethingWentWrong);
    } on DioError catch (exception) {
      Logger().i('returning error');
      if (exception.type == DioErrorType.connectTimeout) {
        throw TimeoutException(AppMessages.timeOut);
      } else {
        ErrorResponseModel errorResponseModel =
            ErrorResponseModel.fromJson(exception.response?.data);
        throw SomethingWentWrong(errorResponseModel.msg);
      }
    } catch (e) {
      throw SomethingWentWrong(e.toString());
    }
  }

  @override
  Future<SetPinResponseModel> setPin(SetPinRequestModel params) async {
    String url = AppUrl.baseUrl + AppUrl.setPin;

    try {
      final response = await dio.post(url, data: params.toJson());
      if (response.statusCode == 200) {
        var object = SetPinResponseModel.fromJson(response.data);

        return object;
      }

      throw const SomethingWentWrong(AppMessages.somethingWentWrong);
    } on DioError catch (exception) {
      Logger().i('returning error');
      if (exception.type == DioErrorType.connectTimeout) {
        throw TimeoutException(AppMessages.timeOut);
      } else {
        ErrorResponseModel errorResponseModel =
            ErrorResponseModel.fromJson(exception.response?.data);
        throw SomethingWentWrong(errorResponseModel.msg);
      }
    } catch (e) {
      throw SomethingWentWrong(e.toString());
    }
  }

  @override
  Future<LoginUserResponseModel> loginUser(LoginUserRequestModel params) async {
    String url = AppUrl.baseUrl + AppUrl.loginUser;
    try {
      final response = await dio.post(url, data: params.toJson());
      if (response.statusCode == 200) {
        var object = LoginUserResponseModel.fromJson(response.data);
        return object;
      } else if (response.statusCode == 401) {
        throw ("Pin not set");
      }

      throw const SomethingWentWrong(AppMessages.somethingWentWrong);
    } on DioError catch (exception) {
      Logger().i('returning error');
      if (exception.type == DioErrorType.connectTimeout) {
        throw TimeoutException(AppMessages.timeOut);
      } else {
        ErrorResponseModel errorResponseModel =
            ErrorResponseModel.fromJson(exception.response?.data);
        throw SomethingWentWrong(errorResponseModel.msg);
      }
    } catch (e) {
      throw SomethingWentWrong(e.toString());
    }
  }

  @override
  Future<VerifyOtpWithCnicResponseModel> verifyOtpWithCnic(
      VerifyOtpWithCnicRequestModel params) async {
    String url = AppUrl.baseUrl + AppUrl.verifyOtpWithCnci;
    try {
      final response = await dio.post(url, data: params.toJson());
      if (response.statusCode == 200) {
        var object = VerifyOtpWithCnicResponseModel();
        return object;
      }

      throw const SomethingWentWrong(AppMessages.somethingWentWrong);
    } on DioError catch (exception) {
      Logger().i('returning error');
      if (exception.type == DioErrorType.connectTimeout) {
        throw TimeoutException(AppMessages.timeOut);
      } else {
        ErrorResponseModel errorResponseModel =
            ErrorResponseModel.fromJson(exception.response?.data);
        throw SomethingWentWrong(errorResponseModel.msg);
      }
    } catch (e) {
      throw SomethingWentWrong(e.toString());
    }
  }
}
