import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sb_myreports/core/router/app_state.dart';
import 'package:sb_myreports/core/router/models/page_config.dart';
import 'package:sb_myreports/core/utils/globals/snack_bar.dart';
import 'package:sb_myreports/features/authentication/presentation/manager/auth_provider.dart';

import '../../../../core/const/color.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/enums/page_state_enum.dart';
import '../../../../core/utils/globals/globals.dart';
import '../../../../core/utils/validators/form_validator.dart';
import '../../../../core/widgets/custom/bottom_sheet_decoration.dart';
import '../../../../core/widgets/custom/custom_otp_field.dart';
import '../../../../core/widgets/custom/custom_textfield.dart';
import '../../../../core/widgets/custom/link_text.dart';
import '../../../../core/widgets/loading_widget.dart';

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({Key? key}) : super(key: key);

  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  late MediaQueryData screenData;

  final AuthProvider authProvider = sl();

  TextEditingController numberCont = TextEditingController();

  TextEditingController pinCont = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

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
                      "Welcome Back !",
                      style: TextStyle(
                        fontSize: sHeadingText,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "Stay Signed in with your account",
                      style: TextStyle(
                        fontSize: sBodyText,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
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
                  // isScrollable: true,
                  children: [
                    Form(
                      key: _formKey,
                      child: CustomTextField(
                        title: "Mobile Number",
                        controller: numberCont,
                        keyboardType: TextInputType.number,
                        hintText: "03485896125",
                        validator: FormValidators.validatePhone,
                        inputFormaters: [
                          LengthLimitingTextInputFormatter(12),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text("Pin"),
                    CustomOtpFields(
                        length: 5,
                        controller: pinCont,
                        onChanged: (p0) {
                          if (p0.length == 5) {
                            if (!_formKey.currentState!.validate()) {
                            } else {
                              String number =
                                  "92" + numberCont.text.substring(1);
                              authProvider.loginUser(number, pinCont.text);
                            }
                          }
                        }),
                    Align(
                      alignment: Alignment.centerRight,
                      child: LinkText(
                        title: "Forget password?",
                        color: Colors.red,
                        onTap: () {
                          if (!_formKey.currentState!.validate()) {
                            ShowSnackBar.show(
                                "Please Enter phone number to proceed",
                                color: Colors.red);
                          } else {
                            String number = "92" + numberCont.text.substring(1);
                            authProvider.number = number;
                            authProvider.onVerificationComplete = () {
                              AppState state = sl();
                              state.goToNext(PageConfigs.creatPinScreenConfig);
                            };
                            authProvider.onPinSet = () async {
                              await Future.delayed(
                                  const Duration(milliseconds: 1500));
                              ShowSnackBar.show(
                                  'Please Login With your new pin to continue');
                              AppState state = sl();
                              state.goToNext(PageConfigs.pinCodeScreenConfig,
                                  pageState: PageState.replaceAll);
                            };
                            AppState state = sl();
                            state.goToNext(PageConfigs.otpVerficationConfig);
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 25.h),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () => authProvider.loginWithLocalAuth(),
                        child: SvgPicture.asset(
                          AppAssets.fingerprintSvg,
                          height: 50,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.center,
                      child: LinkText(
                        title: " Login with fingerprint/FACE ID?",
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          Expanded(child: Divider(thickness: 2)),
                          Text(
                            "  Or  ",
                            style: TextStyle(color: Colors.black38),
                          ),
                          Expanded(child: Divider(thickness: 2)),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LinkText(
                          title: "Don,t Have an Account?",
                        ),
                        LinkText(
                          title: " Sign up",
                          color: Colors.orange,
                          onTap: () {
                            AppState state = sl();
                            state.goToNext(
                                PageConfigs.createAccountCnicScreenConfig,
                                pageState: PageState.replace);
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
              ValueListenableBuilder<bool>(
                valueListenable: authProvider.loginUserLoading,
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
