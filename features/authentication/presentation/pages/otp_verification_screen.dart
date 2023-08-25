import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sb_myreports/core/utils/globals/snack_bar.dart';
import 'package:sb_myreports/core/widgets/loading_widget.dart';
import 'package:sb_myreports/features/authentication/presentation/manager/auth_provider.dart';

import '../../../../core/const/color.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/globals/globals.dart';
import '../../../../core/widgets/custom/bottom_sheet_decoration.dart';
import '../../../../core/widgets/custom/continue_button.dart';
import '../../../../core/widgets/custom/custom_otp_field.dart';

class OTPVerificationScreen extends StatefulWidget {
  /// calls the [onSend] method if provided else calls the [requestOtp] method from [AuthProvider].
  /// similarly calls [onVerify] method if provided else calls [verifyOtp] method from [AuthProvider]
  const OTPVerificationScreen({
    Key? key,
    this.onSend,
    this.onVerify,
    this.sendRequestNotifier,
    this.verifyRequestNotifier,
    this.queryOnSendOnStartUp = true,
  }) : super(key: key);

  /// whether to call the [onSend] method in Init function or not
  final bool queryOnSendOnStartUp;
  final Future? Function()? onSend;
  final Future? Function(String)? onVerify;
  final ValueNotifier<bool>? sendRequestNotifier;
  final ValueNotifier<bool>? verifyRequestNotifier;

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final AuthProvider authProvider = sl();
  TextEditingController otpCont = TextEditingController();
  Timer? requestOtpTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (widget.queryOnSendOnStartUp) {
        await requestOTP();
      } else {
        startTicker();
      }
    });
  }

  /// requests otp and if returned false,
  /// then resets the resend button
  /// if returned true then [startTicker] is called
  requestOTP() async {
    late bool isOtpSent;
    if (widget.onSend != null) {
      isOtpSent = await widget.onSend!();
    } else {
      isOtpSent = await authProvider.requestOtp();
      // await authProvider.requestOtp(providedNumber: "923041160017");
    }
    if (isOtpSent) {
      authProvider.isOtpRequested = true;
      startTicker();
    } else {
      if (widget.sendRequestNotifier != null) {
        widget.sendRequestNotifier!.value = false;
      }
    }
  }

  startTicker() {
    requestOtpTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (timer.tick == 90) {
          requestOtpTimer!.cancel();
        } else {}
        if (mounted) {
          setState(() {});
        }
      },
    );
  }

  @override
  void dispose() {
    /// disposes the timer on pop
    /// and resets the onverificationComplete function
    if (requestOtpTimer != null) {
      requestOtpTimer!.cancel();
    }
    authProvider.onVerificationComplete = null;
    authProvider.isOtpRequested = false;
    authProvider.isRegistering = true;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: authProvider,
      builder: (context, child) => SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: cAccentColor,
            body: Stack(children: [
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    SizedBox(height: 30.h),
                    Image.asset(
                      AppAssets.logo2Image,
                      height: 50,
                    ),
                    SizedBox(height: 30.h),
                    const Text(
                      "OTP Verification",
                      style: TextStyle(
                        fontSize: sHeadingText,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.sp),
                      child: const Text(
                        "Enter the OTP received on your mobile number.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: sBodyText,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: BottomSheetDecoration(
                  children: [
                    CustomOtpFields(
                      length: 5,
                      controller: otpCont,
                      onChanged: (text) async {
                        if (text.length == 5 && authProvider.isOtpRequested) {
                          if (widget.onVerify != null) {
                            await widget.onVerify!(text);
                          } else {
                            bool isOtpWrong = await authProvider.verifyOtp(
                                number: authProvider.number, otpCode: text);
                            if (isOtpWrong) {
                              otpCont.text = "";
                            }
                          }
                        }
                        if (text.length == 5 && !authProvider.isOtpRequested) {
                          ShowSnackBar.show(
                              "Please wait for Otp before entering the pin! Or press the resend button",
                              color: Colors.orange);
                        }
                      },
                    ),
                    SizedBox(height: 15.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.sp),
                      child: Text(
                        "Please click 'Resend' it you don't receive OTP within ${requestOtpTimer == null ? 90 : (90 - requestOtpTimer!.tick)} seconds.",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 200,
                        child: ContinueButton(
                          text: "Resend",
                          loadingNotifier: widget.sendRequestNotifier ??
                              context.read<AuthProvider>().requestOtpLoading,
                          onPressed: ((requestOtpTimer?.tick ?? 0) == 90 ||
                                  !authProvider.isOtpRequested)
                              ? () async {
                                  await requestOTP();
                                }
                              : null,
                        ),
                      ),
                    ),
                    SizedBox(height: 250.h),
                  ],
                ),
              ),
              ValueListenableBuilder<bool>(
                valueListenable: widget.verifyRequestNotifier != null
                    ? widget.verifyRequestNotifier!
                    : authProvider.verifyingOtpLoading,
                builder: (context, value, child) => !value
                    ? const SizedBox()
                    : Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          // height: MediaQuery.of(context).size.height,
                          // width: MediaQuery.of(context).size.width,
                          child: Container(
                            height: 100,
                            width: 100,
                            padding: const EdgeInsets.all(25),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black12,
                            ),
                            child: FittedBox(
                                child: Transform.scale(
                                    scale: 2.5, child: const LoadingWidget())),
                          ),
                        ),
                      ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
