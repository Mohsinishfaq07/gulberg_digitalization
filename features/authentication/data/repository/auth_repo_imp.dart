import 'package:dartz/dartz.dart';
import 'package:sb_myreports/features/authentication/data/model/cnic_confirmation_request_model.dart';
import 'package:sb_myreports/features/authentication/data/model/cnic_confirmation_response_model.dart';
import 'package:sb_myreports/features/authentication/data/model/login_user_response_model.dart';
import 'package:sb_myreports/features/authentication/data/model/login_user_request_model.dart';
import 'package:sb_myreports/features/authentication/data/model/otp_request_modal.dart';
import 'package:sb_myreports/features/authentication/data/model/verify_otp_response_model.dart';
import 'package:sb_myreports/features/authentication/data/model/verify_otp_request_model.dart';
import 'package:sb_myreports/features/authentication/data/model/verify_otp_with_cnic_response_model.dart';
import 'package:sb_myreports/features/authentication/data/model/verify_otp_with_cnic_request_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/constants/app_messages.dart';
import '../../../../core/utils/network/network_info.dart';
import '../../domain/repository/auth_repo.dart';
import '../data_sources/auth_remote_data_source.dart';
import '../model/otp_response_modal.dart';
import '../model/register_user_request_model.dart';
import '../model/register_user_response_model.dart';
import '../model/set_pin_request_model.dart';
import '../model/set_pin_response_model.dart';

class AuthRepoImp extends AuthRepository {
  final NetworkInfo networkInfo;

  final AuthRemoteDataSource remoteDataSource;

  AuthRepoImp({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, OtpResponseModel>> requestOtp(
      OtpRequestModel params) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure(AppMessages.noInternet));
    }
    try {
      return Right(await remoteDataSource.requestOtp(params));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e));
    }
  }

  @override
  Future<Either<Failure, VerifyOtpResponseModel>> verifyOtp(
      VerifyOtpRequestModel params) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure(AppMessages.noInternet));
    }
    try {
      return Right(await remoteDataSource.verifyOtp(params));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e));
    }
  }

  @override
  Future<Either<Failure, CnicConfirmationResponseModel>> cnicConfirmation(
      CnicConfirmationRequestModel params) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure(AppMessages.noInternet));
    }
    try {
      return Right(await remoteDataSource.cnicConfirmation(params));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e));
    }
  }

  @override
  Future<Either<Failure, SetPinResponseModel>> setPin(
      SetPinRequestModel params) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure(AppMessages.noInternet));
    }
    try {
      return Right(await remoteDataSource.setPin(params));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e));
    }
  }

  @override
  Future<Either<Failure, RegisterUserResponseModel>> registerUser(
      RegisterUserRequestModel params) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure(AppMessages.noInternet));
    }
    try {
      return Right(await remoteDataSource.registerUser(params));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e));
    }
  }

  @override
  Future<Either<Failure, LoginUserResponseModel>> loginUser(
      LoginUserRequestModel params) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure(AppMessages.noInternet));
    }
    try {
      return Right(await remoteDataSource.loginUser(params));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e));
    }
  }

  @override
  Future<Either<Failure, VerifyOtpWithCnicResponseModel>> verifyOtpWithCnic(
      VerifyOtpWithCnicRequestModel params) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure(AppMessages.noInternet));
    }
    try {
      return Right(await remoteDataSource.verifyOtpWithCnic(params));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e));
    }
  }
}
