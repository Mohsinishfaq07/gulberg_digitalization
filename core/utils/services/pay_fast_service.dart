import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../modals/get_payfast_token_response_model.dart';
import '../../modals/payfast_get_token_request_model.dart';
import '../constants/app_url.dart';
import 'date_format_service.dart';

class PayfastPaymentService {
  static const String baseUrl = 'https://ipguat.apps.net.pk/'; // UAT
  // static const String baseUrl = 'https://ipg1.apps.net.pk/'; //Live
  static const String _getTokenUrl =
      '${baseUrl}Ecommerce/api/Transaction/GetAccessToken';

  static const String redirectionUrl =
      '${baseUrl}Ecommerce/api/Transaction/PostTransaction';

  static const String merchantKey = '16590';
  static const String merchantName = 'sha';

  static const String securedKey = 'VxN4nKgUhZfdyUV1FFYFjCLK'; // U   AT
  // static const String securedKey = 'vhlNYippf-v0oKT1lhMBdjkJ'; //live
  static const String country = 'Pakistan';
  static const String currency = 'PKR';
  static const String version = '1.1';
  static const String proCode = '00';

  static const String ridePaymentCheckoutUrl =
      '${AppUrl.baseUrl}api/payment/payfast/checkout';
  static const String ridePaymentSuccessUrl =
      '${AppUrl.baseUrl}api/payment/payfast/success?';
  static const String ridePaymentFailureUrl =
      '${AppUrl.baseUrl}api/payment/payfast/failure?';
  static const String accountRechargeCheckoutUrl =
      '${AppUrl.baseUrl}api/payment/payfast/recharge/checkout';
  static const String accountRechargeSuccessUrl =
      '${AppUrl.baseUrl}api/payment/payfast/recharge/success?';
  static const String accountRechargeFailureUrl =
      '${AppUrl.baseUrl}api/payment/payfast/recharge/failure?';

  static String getDate() {
    return DateFormatService.formattedDate(DateTime.now().toString(),
        dateFormatType: DateFormatType.year);
  }

  static Future<GetFastPayTokenResponseModel> getToken(
      String amount, String basketId) async {
    try {
      final body = GetFastPayTokenRequestModel(
          MERCHANTID: merchantKey,
          SECUREDKEY: securedKey,
          BASKETID: basketId,
          TXNAMT: amount);
      Logger().v(body.toJson());
      Logger().v(_getTokenUrl);

      final response = await Dio().post(_getTokenUrl, data: body.toJson());
      Logger().v(response);
      return GetFastPayTokenResponseModel.fromJson(response.data);
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
