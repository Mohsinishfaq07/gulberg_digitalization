import 'package:dartz/dartz.dart';
import 'package:sb_myreports/features/authentication/data/model/cnic_confirmation_response_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/model/cnic_confirmation_request_model.dart';
import '../../data/model/login_user_request_model.dart';
import '../../data/model/login_user_response_model.dart';
import '../../data/model/otp_request_modal.dart';
import '../../data/model/otp_response_modal.dart';
import '../../data/model/register_user_request_model.dart';
import '../../data/model/register_user_response_model.dart';
import '../../data/model/set_pin_request_model.dart';
import '../../data/model/set_pin_response_model.dart';
import '../../data/model/verify_otp_request_model.dart';
import '../../data/model/verify_otp_response_model.dart';
import '../repository/auth_repo.dart';

class CnicConfirmationUseCase extends UseCase<CnicConfirmationResponseModel,
    CnicConfirmationRequestModel> {
  AuthRepository repository;
  CnicConfirmationUseCase(this.repository);

  @override
  Future<Either<Failure, CnicConfirmationResponseModel>> call(
      CnicConfirmationRequestModel params) async {
    return await repository.cnicConfirmation(params);
  }
}

class RequestOtpUsecase extends UseCase<OtpResponseModel, OtpRequestModel> {
  AuthRepository repository;
  RequestOtpUsecase(this.repository);

  @override
  Future<Either<Failure, OtpResponseModel>> call(OtpRequestModel params) async {
    return await repository.requestOtp(params);
  }
}

class VerifyOtpUsecase extends UseCase<VerifyOtpResponseModel, VerifyOtpRequestModel> {
  AuthRepository repository;
  VerifyOtpUsecase(this.repository);

  @override
  Future<Either<Failure, VerifyOtpResponseModel>> call(
      VerifyOtpRequestModel params) async {
    return await repository.verifyOtp(params);
  }
}

class SetPinUsecase extends UseCase<SetPinResponseModel, SetPinRequestModel> {
  AuthRepository repository;
  SetPinUsecase(this.repository);

  @override
  Future<Either<Failure, SetPinResponseModel>> call(
      SetPinRequestModel params) async {
    return await repository.setPin(params);
  }
}

class RegisterUserUsecase
    extends UseCase<RegisterUserResponseModel, RegisterUserRequestModel> {
  AuthRepository repository;
  RegisterUserUsecase(this.repository);

  @override
  Future<Either<Failure, RegisterUserResponseModel>> call(
      RegisterUserRequestModel params) async {
    return await repository.registerUser(params);
  }
}

class LoginUserUsecase
    extends UseCase<LoginUserResponseModel, LoginUserRequestModel> {
  AuthRepository repository;
  LoginUserUsecase(this.repository);

  @override
  Future<Either<Failure, LoginUserResponseModel>> call(
      LoginUserRequestModel params) async {
    return await repository.loginUser(params);
  }
}
