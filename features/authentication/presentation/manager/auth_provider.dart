import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:logger/logger.dart';
import 'package:sb_myreports/core/router/app_state.dart';
import 'package:sb_myreports/core/router/models/page_config.dart';
import 'package:sb_myreports/core/utils/services/shared_prefrences_service.dart';
import 'package:sb_myreports/core/widgets/custom_dialogue.dart';
import 'package:sb_myreports/features/authentication/data/model/cnic_confirmation_request_model.dart';
import 'package:sb_myreports/features/authentication/data/model/cnic_confirmation_response_model.dart';
import 'package:sb_myreports/features/authentication/data/model/login_user_response_model.dart';
import 'package:sb_myreports/features/authentication/data/model/verify_otp_request_model.dart';
import 'package:sb_myreports/features/authentication/domain/usecases/auth_usecases.dart';
import 'package:sb_myreports/features/authentication/presentation/pages/otp_verification_screen.dart';
import 'package:sb_myreports/features/authentication/presentation/pages/pin_code_screen.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/enums/page_state_enum.dart';
import '../../../../core/utils/globals/globals.dart';
import '../../../../core/utils/globals/snack_bar.dart';
import '../../data/model/login_user_request_model.dart';
import '../../data/model/otp_request_modal.dart';
import '../../data/model/register_user_request_model.dart';
import '../../data/model/register_user_response_model.dart';
import '../../data/model/set_pin_request_model.dart';
import '../../data/model/verify_otp_with_cnic_request_model.dart';
import '../../domain/usecases/verify_otp_with_cnic_usecase.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider(
    this._requestOtpUsecase,
    this._verifyOtpUsecase,
    this._cnicConfirmationUsecase,
    this._registerUserUsecase,
    this._setPinUsecase,
    this._loginUserUsecase,
    this.sharedPrefrencesService,
    this._verifyOtpWithCnicOtpUsecase,
  );

  ///Services
  final SharedPrefrencesService sharedPrefrencesService;

  ///
  bool isRegistering = false;
  bool isOtpRequested = false;

  /// will be called when [verifyOtp] is called and verification completes
  Function()? onVerificationComplete;

  /// will be called when [setPin]  is called and pin is created
  Function()? onPinSet;

  /// incase direct login when otp was not provided in the beginning
  String? number;
  // responses
  LoginUserResponseModel? currentUser;
  CnicConfirmationResponseModel? cnicResponseModel;
  RegisterUserResponseModel? registerUserResponseModel;

  //usecases
  final RequestOtpUsecase _requestOtpUsecase;
  final VerifyOtpWithCnicUseCase _verifyOtpWithCnicOtpUsecase;
  final VerifyOtpUsecase _verifyOtpUsecase;
  final RegisterUserUsecase _registerUserUsecase;
  final SetPinUsecase _setPinUsecase;
  final LoginUserUsecase _loginUserUsecase;
  final CnicConfirmationUseCase _cnicConfirmationUsecase;

  //valuenotifiers

  ValueNotifier<bool> requestOtpLoading = ValueNotifier(false);
  ValueNotifier<bool> verifyingOtpLoading = ValueNotifier(false);
  ValueNotifier<bool> verifyingOtpWithCnicLoading = ValueNotifier(false);
  ValueNotifier<bool> registeringUserLoading = ValueNotifier(false);
  ValueNotifier<bool> loginUserLoading = ValueNotifier(false);
  ValueNotifier<bool> cnicLoading = ValueNotifier(false);
  ValueNotifier<bool> setPinLoading = ValueNotifier(false);

  //usecases calls
  /// checks and get the user Data if found and Navigates
  /// towards [OTPVerificationScreen] screen
  Future<void> cnicConfirmation(String cnicNumber) async {
    cnicLoading.value = true;
    var params = CnicConfirmationRequestModel(cnicNo: cnicNumber);
    var loginEither = await _cnicConfirmationUsecase(params);
    if (loginEither.isLeft()) {
      handleError(loginEither);
      cnicLoading.value = false;
    } else if (loginEither.isRight()) {
      return loginEither.foldRight(true, (response, previous) async {
        cnicLoading.value = false;
        cnicResponseModel = response;
        ShowSnackBar.show("Otp has been sent");
        await Future.delayed(const Duration(seconds: 1));
        isRegistering = true;
        AppState state = sl();
        isOtpRequested = true;
        state.addWidget(
            page: PageConfigs.otpVerficationConfig,
            child: OTPVerificationScreen(
                queryOnSendOnStartUp: false,
                onSend: cnicConfirmationResend,
                sendRequestNotifier: cnicLoading,
                onVerify: verifyOtpWithCnic,
                verifyRequestNotifier: verifyingOtpWithCnicLoading));
      });
    }
  }

  /// is used to get and request user details and otp while creating
  /// account when the user presses the resend button
  Future<bool> cnicConfirmationResend() async {
    cnicLoading.value = true;
    var params =
        CnicConfirmationRequestModel(cnicNo: cnicResponseModel!.data!.cNIC!);
    var loginEither = await _cnicConfirmationUsecase(params);
    if (loginEither.isLeft()) {
      handleError(loginEither);
      cnicLoading.value = false;
    } else if (loginEither.isRight()) {
      return loginEither.foldRight(true, (response, previous) async {
        cnicLoading.value = false;
        cnicResponseModel = response;
        ShowSnackBar.show("Otp has been sent");
        return true;
      });
    }
    return false;
  }

  /// verifies the otp that was sent along with [cnicConfirmation]
  /// or [cnicConfirmationResend] method in order to create account

  Future<void> verifyOtpWithCnic(String otp) async {
    verifyingOtpWithCnicLoading.value = true;

    var params = VerifyOtpWithCnicRequestModel(
      otp: otp,
      cnic: cnicResponseModel!.data!.cNIC,
    );
    var loginEither = await _verifyOtpWithCnicOtpUsecase(params);
    if (loginEither.isLeft()) {
      handleError(loginEither);
      verifyingOtpWithCnicLoading.value = false;
    } else if (loginEither.isRight()) {
      loginEither.foldRight(null, (response, previous) async {
        /// setting verification to go to [CreateAccountFormScreen]
        AppState state = sl();
        bool isRegistered = await registerUser();
        verifyingOtpWithCnicLoading.value = false;

        if (!isRegistered) {
          requestOtpLoading.value = false;
          await Future.delayed(const Duration(seconds: 1));
          state.moveToBackScreen();
          return false;
        }
        state.goToNext(PageConfigs.createAccountFormScreenConfig);
        return true;
      });
    }
  }

  /// requests otp for the provided number declared in [AuthProvider]
  /// or providerNumber variable or gets it from [cnicResponseModel] in case of
  /// registration.
  /// if user not exists then shows the message and go back to previous screen
  Future<bool> requestOtp({String? providedNumber}) async {
    requestOtpLoading.value = true;

    late OtpRequestModel params;
    if (number != null) {
      params = OtpRequestModel(mobile: number!);
    } else if (providedNumber != null) {
      params = OtpRequestModel(mobile: providedNumber);
    } else if (cnicResponseModel != null) {
      params = OtpRequestModel(mobile: cnicResponseModel!.data!.phone!);
    } else {}
    Logger().i("otp sent to user");

    var requestEither = await _requestOtpUsecase(params);
    if (requestEither.isLeft()) {
      requestEither.fold((l) async {
        if (l.message == "User not exist!") {
          handleError(requestEither);
          await Future.delayed(const Duration(seconds: 1));
          AppState state = sl();
          state.moveToBackScreen();
        } else {
          handleError(requestEither);
        }
      }, (r) => null);

      requestOtpLoading.value = false;
      return false;
    } else if (requestEither.isRight()) {
      requestEither.foldRight(null, (response, previous) async {
        requestOtpLoading.value = false;
        isOtpRequested = true;
        ShowSnackBar.show("Otp has been sent");
        return true;
      });
    } else {}
    return false;
  }

  /// Verifies the Otp code for the number and
  /// calls the function[onVerificationComplete] if provided to [AuthProvider]
  /// and resets it to null when [OtpVerificationScreen] is disposed
  /// return true if has any errors for pincode field to reset.
  Future<bool> verifyOtp({String? number, required String otpCode}) async {
    verifyingOtpLoading.value = true;

    late VerifyOtpRequestModel params;
    if (number != null) {
      params = VerifyOtpRequestModel(mobile: number, otp: otpCode);
    } else if (cnicResponseModel != null) {
      params = VerifyOtpRequestModel(
        mobile: cnicResponseModel!.data!.phone!,
        otp: otpCode,
        // cnic: currentUser!.data!.cNIC!,
      );
    } else {}

    var verifyEither = await _verifyOtpUsecase(params);
    if (verifyEither.isLeft()) {
      handleError(verifyEither);
      verifyingOtpLoading.value = false;
      return true;
    } else if (verifyEither.isRight()) {
      verifyEither.foldRight(null, (response, previous) async {
        if (onVerificationComplete != null) {
          await onVerificationComplete!();
        }
        verifyingOtpLoading.value = false;
      });
    }
    return false;
  }

  /// Registers the user after otp verification
  Future<bool> registerUser() async {
    registeringUserLoading.value = true;

    RegisterUserRequestModel params = RegisterUserRequestModel(
        mobile: cnicResponseModel!.data!.phone,
        cNIC: cnicResponseModel!.data!.cNIC,
        name: cnicResponseModel!.data!.memberName);

    var registerEither = await _registerUserUsecase(params);
    if (registerEither.isLeft()) {
      handleError(registerEither);
      registeringUserLoading.value = false;
      return false;
    } else if (registerEither.isRight()) {
      return registerEither.foldRight(true, (response, previous) async {
        registeringUserLoading.value = false;
        currentUser = LoginUserResponseModel.fromJson(response.toJson());
        // Logger().i(response.);
        registerUserResponseModel = response;
        Logger().i("User Registered");
        return true;
        // ShowSnackBar.show("You have registered Successfully");
      });
    }
    return false;
  }

  /// Logs the user but incase if the pin for account is not created
  /// then navigates the user to [OTPVerificationScreen] and upon
  /// verification, sends the user to create pin
  Future<bool> loginUser(String phone, String pincode) async {
    loginUserLoading.value = true;

    LoginUserRequestModel params =
        LoginUserRequestModel(mobile: phone, pIN: pincode);
    var loginEither = await _loginUserUsecase(params);
    if (loginEither.isLeft()) {
      loginEither.fold((l) async {
        if (l.message == "Set your PIN!") {
          handleError(loginEither);
          await Future.delayed(const Duration(seconds: 1));
          AppState state = sl();
          number = phone;
          onVerificationComplete = () {
            state.goToNext(PageConfigs.creatPinScreenConfig);
          };
          onPinSet = () {
            ShowSnackBar.show(
                "Pin Created Successfully. Please login to continue");
            state.goToNext(PageConfigs.pinCodeScreenConfig,
                pageState: PageState.replaceAll);
          };

          state.goToNext(PageConfigs.otpVerficationConfig);
        } else {
          handleError(loginEither);
        }
      }, (r) => null);
      loginUserLoading.value = false;

      return true;
    } else if (loginEither.isRight()) {
      loginEither.foldRight(null, (response, previous) async {
        loginUserLoading.value = false;
        // Logger().i(response.);
        changeUserDetails(response);
        ShowSnackBar.show("Logined Successfully");
        // WalletProvider walletProvider = sl();

        // /// fetches the wallet amount
        // if (currentUser!.data!.zindigiWallet?.linked ?? false) {
        //   walletProvider.getWalletInfo();
        // }

        AppState state = sl();
        state.goToNext(PageConfigs.dashboardScreenPageConfig,
            pageState: PageState.replaceAll);
      });
    }
    return false;
  }

  /// Login using local auth
  Future<void> loginWithLocalAuth() async {
    try {
      final LocalAuthentication auth = LocalAuthentication();
      final bool didAuthenticate = await auth.authenticate(
          localizedReason: 'Please authenticate to login');
      if (didAuthenticate) {
        String? credentials =
            await sharedPrefrencesService.getLoginCredentials();

        /// authenticated and credentials available
        if (credentials != null) {
          currentUser = LoginUserResponseModel.fromJson(
              json.decode(credentials) as Map<String, dynamic>);
          ShowSnackBar.show("Logined Successfully");
          print(currentUser!.data!.toJson());
          // WalletProvider walletProvider = sl();
          // if (currentUser!.data!.zindigiWallet?.linked ?? false) {
          //   walletProvider.getWalletInfo();
          // }
          AppState state = sl();
          state.goToNext(PageConfigs.dashboardScreenPageConfig,
              pageState: PageState.replaceAll);
        } else {
          /// no credentials found
          ShowSnackBar.show("Please Login first in order to use it",
              color: Colors.red);
        }
      } else {}
    } catch (e) {
      ShowSnackBar.show("Sorry an error Occured during authenticating",
          color: Colors.red);
    }
  }

  /// setup pin for new user or the one who forgot it.
  /// gets the number from [cnicResponseModel] incase of registeration.
  /// Incase of forget password, then [number] should be provided.
  /// Upon Pin creation, calls the [onPinSet] function if not null
  /// else shows zindigi account creation dialoge and navigates user based on his response
  Future<bool> setPin(String otp) async {
    setPinLoading.value = true;
    late String numb;
    if (number != null) {
      numb = number!;
    } else {
      numb = cnicResponseModel!.data!.phone!;
    }
    SetPinRequestModel params = SetPinRequestModel(
      mobile: numb,
      pIN: otp,
    );

    var setPinEither = await _setPinUsecase(params);
    if (setPinEither.isLeft()) {
      handleError(setPinEither);
      setPinLoading.value = false;
      return true;
    } else if (setPinEither.isRight()) {
      setPinEither.foldRight(null, (response, previous) async {
        setPinLoading.value = false;
        // setPinResponseModel = response;
        Logger().i("Pin Successfully added");
        ShowSnackBar.show("Pin Successfully Created");
        if (onPinSet != null) {
          return await onPinSet!();
        } else {
          changeUserDetails(
              LoginUserResponseModel.fromJson(currentUser!.toJson()));

          /// prompts the user based on [isZindigi] variable in
          /// [registerUserResponseModel] and navigates to their
          /// respective screens
          bool creatAccount = await showZindigiAccountDialog(
              description: !registerUserResponseModel!.data!.isZindigi!
                  ? null
                  : "you already have Zindigi account do you want to Link your Zindigi account?");
          AppState state = sl();
          if (creatAccount && registerUserResponseModel!.data!.isZindigi!) {
            state.replacefirstAndAddAnotherPage(
                PageConfigs.dashboardScreenPageConfig,
                [PageConfigs.linkZindigiAccountPageConfig]);
          } else if (creatAccount &&
              !registerUserResponseModel!.data!.isZindigi!) {
            state.replacefirstAndAddAnotherPage(
                PageConfigs.dashboardScreenPageConfig,
                [PageConfigs.creatWalletAccountConfig]);
          } else {
            state.goToNext(PageConfigs.dashboardScreenPageConfig,
                pageState: PageState.replaceAll);
          }
        }
      });
    }
    return false;
  }

  /// SAVES user [LoginUserResponseModel] locally that is available
  /// for local auth login in [loginWithLocalAuth]
  saveLoginCredentialsLocally(Map<String, dynamic> data) {
    String credentials = jsonEncode(data);
    sharedPrefrencesService.setLoginCredentials(credentials);
  }

  /// clears user credentials and navigates the user
  /// towards [PinCodeScreen]
  logoutUser() {
    sharedPrefrencesService.clearLoginCredentials();
    AppState state = sl();
    state.goToNext(PageConfigs.pinCodeScreenConfig,
        pageState: PageState.replaceAll);
  }

  /// change current user details and notifies the Ui
  /// and save it in local storage
  changeUserDetails(LoginUserResponseModel userData) {
    currentUser = userData;
    saveLoginCredentialsLocally(userData.toJson());
    notifyListeners();
  }

  // Error Handling
  void handleError(Either<Failure, dynamic> either) {
    either.fold(
        (l) => ShowSnackBar.show(l.message, color: Colors.red), (r) => null);
  }
}
