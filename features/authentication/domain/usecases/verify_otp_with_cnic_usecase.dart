import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/model/verify_otp_with_cnic_request_model.dart';
import '../../data/model/verify_otp_with_cnic_response_model.dart';
import '../repository/auth_repo.dart';

class VerifyOtpWithCnicUseCase extends UseCase<VerifyOtpWithCnicResponseModel,
    VerifyOtpWithCnicRequestModel> {
  AuthRepository repository;
  VerifyOtpWithCnicUseCase(this.repository);

  @override
  Future<Either<Failure, VerifyOtpWithCnicResponseModel>> call(
      VerifyOtpWithCnicRequestModel params) async {
    return await repository.verifyOtpWithCnic(params);
  }
}
