import 'package:dartz/dartz.dart';
import 'package:sb_myreports/features/authentication/data/model/cnic_confirmation_request_model.dart';
import 'package:sb_myreports/features/authentication/data/model/cnic_confirmation_response_model.dart';
import 'package:sb_myreports/features/authentication/data/model/otp_request_modal.dart';
import 'package:sb_myreports/features/authentication/data/model/verify_otp_request_model.dart';
import 'package:sb_myreports/features/authentication/data/model/verify_otp_response_model.dart';

import '../../../../core/error/failures.dart';
import '../../data/model/login_user_request_model.dart';
import '../../data/model/login_user_response_model.dart';
import '../../data/model/otp_response_modal.dart';
import '../../data/model/register_user_request_model.dart';
import '../../data/model/register_user_response_model.dart';
import '../../data/model/set_pin_request_model.dart';
import '../../data/model/set_pin_response_model.dart';
import '../../data/model/verify_otp_with_cnic_request_model.dart';
import '../../data/model/verify_otp_with_cnic_response_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, CnicConfirmationResponseModel>> cnicConfirmation(
      CnicConfirmationRequestModel params);
  ////
  Future<Either<Failure, OtpResponseModel>> requestOtp(OtpRequestModel params);

  ///
  Future<Either<Failure, VerifyOtpResponseModel>> verifyOtp(
      VerifyOtpRequestModel params);

  ///
  Future<Either<Failure, SetPinResponseModel>> setPin(
      SetPinRequestModel params);

  ///
  Future<Either<Failure, RegisterUserResponseModel>> registerUser(
      RegisterUserRequestModel params);

  ///
  Future<Either<Failure, LoginUserResponseModel>> loginUser(
      LoginUserRequestModel params);
  //
  Future<Either<Failure, VerifyOtpWithCnicResponseModel>> verifyOtpWithCnic(
      VerifyOtpWithCnicRequestModel params);
}
