import 'dart:async';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/modals/error_response_model.dart';
import '../../../../core/utils/constants/app_messages.dart';
import '../../../../core/utils/constants/app_url.dart';
import '../models/get_bills_history_request_model.dart';
import '../models/get_bills_history_response_model.dart';
import '../models/get_bills_request_model.dart';
import '../models/get_bills_response_model.dart';
import '../models/get_otp_for_payment_request_model.dart';
import '../models/get_otp_for_payment_response_model.dart';
import '../models/pay_with_zindigi_request_model.dart';
import '../models/pay_with_zindigi_response_model.dart';

abstract class BillsRemoteDataSource {
  Future<GetBillsResponseModel> getBills(GetBillsRequestModel params);
  Future<PayWithZindigiResponseModel> payWithZindigi(
      PayWithZindigiRequestModel params);
  Future<GetOtpForPaymentResponseModel> getOtpForPayment(
      GetOtpForPaymentRequestModel params);
  Future<GetBillsHistoryResponseModel> getBillsHistory(
      GetBillsHistoryRequestModel params);
}

class BillsRemoteDataSourceImp implements BillsRemoteDataSource {
  Dio dio;
  BillsRemoteDataSourceImp({required this.dio});

  @override
  Future<GetBillsResponseModel> getBills(GetBillsRequestModel params) async {
    String url = AppUrl.baseUrl + AppUrl.getBills + "userId=" + params.userId;

    try {
      final response = await dio.get(
        url,
      );

      if (response.statusCode == 200) {
        return GetBillsResponseModel.fromJson(response.data);
      }

      throw const SomethingWentWrong(AppMessages.somethingWentWrong);
    } on DioError catch (exception) {
      // Logger().v(exception.response!.statusCode);
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
  Future<PayWithZindigiResponseModel> payWithZindigi(
      PayWithZindigiRequestModel params) async {
    String url = AppUrl.baseUrl + AppUrl.payWithZindigi;

    try {
      final response = await dio.post(url, data: params.toJson());

      // var decryptedResponse = Encryption.decryptObject(response.data['Text']);
      // var jsonResponse = jsonDecode(decryptedResponse);

      if (response.statusCode == 200) {
        var object = PayWithZindigiResponseModel();

        // var object = GetPaymentRateListResponse.fromJson(jsonResponse);

        return object;
      }

      throw const SomethingWentWrong(AppMessages.somethingWentWrong);
    } on DioError catch (exception) {
      Logger().i('returning error');
      if (exception.type == DioErrorType.connectTimeout) {
        throw TimeoutException(AppMessages.timeOut);
      } else {
        // var decryptedResponse = Encryption.decryptObject(exception.response?.data['Text']);
        // var jsonResponse = jsonDecode(decryptedResponse);
        ErrorResponseModel errorResponseModel =
            ErrorResponseModel.fromJson(exception.response?.data);
        throw SomethingWentWrong(errorResponseModel.msg);
      }
    } catch (e) {
      throw SomethingWentWrong(e.toString());
    }
  }

  @override
  Future<GetOtpForPaymentResponseModel> getOtpForPayment(
      GetOtpForPaymentRequestModel params) async {
    String url = AppUrl.baseUrl + AppUrl.getOtpForPayment;

    try {
      final response = await dio.post(
        url,
        data: params.toJson(),
      );

      if (response.statusCode == 200) {
        return GetOtpForPaymentResponseModel.fromJson(response.data);
      }

      throw const SomethingWentWrong(AppMessages.somethingWentWrong);
    } on DioError catch (exception) {
      // Logger().v(exception.response!.statusCode);
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
  Future<GetBillsHistoryResponseModel> getBillsHistory(
      GetBillsHistoryRequestModel params) async {
    String url =
        AppUrl.baseUrl + AppUrl.getBillHistory + "userId=" + params.userId!;
    print(url);
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        return GetBillsHistoryResponseModel.fromJson(response.data);
      }

      throw const SomethingWentWrong(AppMessages.somethingWentWrong);
    } on DioError catch (exception) {
      // Logger().v(exception.response!.statusCode);
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
