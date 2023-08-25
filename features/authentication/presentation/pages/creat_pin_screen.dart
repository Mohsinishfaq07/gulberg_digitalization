import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sb_myreports/core/utils/globals/snack_bar.dart';
import 'package:sb_myreports/core/widgets/custom/continue_button.dart';
import 'package:sb_myreports/features/authentication/presentation/manager/auth_provider.dart';

import '../../../../core/const/color.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/globals/globals.dart';
import '../../../../core/widgets/custom/bottom_sheet_decoration.dart';
import '../../../../core/widgets/custom/custom_otp_field.dart';

class CreatePinScreen extends StatefulWidget {
  const CreatePinScreen({Key? key}) : super(key: key);

  @override
  State<CreatePinScreen> createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  final AuthProvider authProvider = sl();
  late MediaQueryData screenData;
  TextEditingController pinCont = TextEditingController();
  TextEditingController confirmPinCont = TextEditingController();
  @override
  void dispose() {
    authProvider.onPinSet = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenData = MediaQuery.of(context);

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
                  height:
                      screenData.size.height - (270 + screenData.padding.top),
                  isScrollable: true,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30, child: Text("Pin")),
                        CustomOtpFields(
                          length: 5,
                          size: 40.w,
                          controller: pinCont,
                          onChanged: (p0) {},
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30, child: Text("Confirm Pin")),
                        CustomOtpFields(
                          length: 5,
                          size: 40.w,
                          controller: confirmPinCont,
                          onChanged: (p0) {},
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Align(
                      alignment: Alignment.center,
                      child: ContinueButton(
                        text: "Confirm",
                        loadingNotifier: authProvider.setPinLoading,
                        onPressed: () async {
                          if (pinCont.text.length != 5 ||
                              confirmPinCont.text.length != 5) {
                            ShowSnackBar.show("Provide a 5 digit pin first",
                                color: Colors.red);
                          } else if (pinCont.text != confirmPinCont.text) {
                            ShowSnackBar.show("Pin Donot Match",
                                color: Colors.red);
                          } else {
                            await authProvider.setPin(pinCont.text);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
