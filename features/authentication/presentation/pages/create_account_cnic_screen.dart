import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sb_myreports/core/router/app_state.dart';
import 'package:sb_myreports/core/router/models/page_config.dart';
import 'package:sb_myreports/core/utils/Formaters/card_formator.dart';
import 'package:sb_myreports/core/utils/enums/page_state_enum.dart';
import 'package:sb_myreports/core/utils/globals/snack_bar.dart';
import 'package:sb_myreports/core/widgets/custom/continue_button.dart';
import 'package:sb_myreports/features/authentication/presentation/manager/auth_provider.dart';
import '../../../../core/const/color.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/globals/globals.dart';
import '../../../../core/widgets/custom/bottom_sheet_decoration.dart';
import '../../../../core/widgets/custom/custom_textfield.dart';
import '../../../../core/widgets/custom/link_text.dart';

class CreateAccountCNICScreen extends StatelessWidget {
  CreateAccountCNICScreen({Key? key}) : super(key: key);
  AuthProvider authProvider = sl();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: authProvider, child: const CreateAccountCNICScreenContent());
  }
}

class CreateAccountCNICScreenContent extends StatefulWidget {
  const CreateAccountCNICScreenContent({Key? key}) : super(key: key);

  @override
  State<CreateAccountCNICScreenContent> createState() =>
      _CreateAccountCNICScreenContentState();
}

class _CreateAccountCNICScreenContentState
    extends State<CreateAccountCNICScreenContent> {
  bool isCnicSelected = true;

  late MediaQueryData screenData;

  TextEditingController cnicController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  setIsCnic(bool val) {
    setState(() {
      isCnicSelected = val;
      cnicController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    screenData = MediaQuery.of(context);

    return SafeArea(
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
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: sHeadingText,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Create account",
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
                height: screenData.size.height - (250 + screenData.padding.top),
                // isScrollable: true,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (!isCnicSelected) {
                            setIsCnic(true);
                          }
                        },
                        child: Row(
                          children: [
                            Radio(
                              value: isCnicSelected,
                              groupValue: true,
                              onChanged: (value) {
                                if (!isCnicSelected) {
                                  setIsCnic(true);
                                }
                              },
                            ),
                            const Text("CNIC ")
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (!isCnicSelected) {
                            setIsCnic(false);
                          }
                        },
                        child: Row(
                          children: [
                            Radio(
                              value: isCnicSelected,
                              groupValue: false,
                              onChanged: (value) {
                                if (isCnicSelected) {
                                  setIsCnic(false);
                                }
                              },
                            ),
                            const Text("NYCOP ")
                          ],
                        ),
                      ),
                    ],
                  ),
                  Form(
                    key: _formKey,
                    child: CustomTextField(
                      keyboardType: TextInputType.number,
                      controller: cnicController,
                      hintText: isCnicSelected
                          ? "xxxxx-xxxxxxx-x"
                          : "xxxxxx-xxxxxx-x",
                      inputFormaters: [
                        LengthLimitingTextInputFormatter(15),
                        CardFormatter(
                            sample: isCnicSelected
                                ? 'xxxxx-xxxxxxx-x'
                                : 'xxxxxx-xxxxxx-x',
                            separator: '-')
                      ],
                      onChange: (p0) {
                        if (cnicController.text.length == 7 ||
                            cnicController.text.length == 8 ||
                            cnicController.text.length == 15) {
                          cnicController.selection = TextSelection.fromPosition(
                              TextPosition(offset: cnicController.text.length));
                        }
                      },
                      validator: (text) {
                        if (text != null) {
                          if (text.isEmpty) {
                            return "Field cannot be submitted empty";
                          } else if (isCnicSelected
                              ? !RegExp(r'^[0-9+]{5}-[0-9+]{7}-[0-9]{1}$')
                                  .hasMatch(text)
                              : !RegExp(r'^[0-9+]{6}-[0-9+]{6}-[0-9]{1}$')
                                  .hasMatch(text)) {
                            return "Invalid Cnic Formate";
                          }
                        } else {
                          return "Field cannot be submitted empty";
                        }
                        return null;
                      },
                      // onChange: (text) {
                      //   if (text.length == 5 || text.length == 13) {
                      //     cnicController.text += "-";
                      //     cnicController.selection =
                      //         TextSelection.fromPosition(TextPosition(
                      //             offset: cnicController.text.length));
                      //     // cnicNode.requestFocus();

                      //   }
                      // },
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 200,
                        child: ContinueButton(
                          text: "Submit",
                          loadingNotifier:
                              context.read<AuthProvider>().cnicLoading,
                          onPressed: () async {
                            if (!_formKey.currentState!.validate()) {
                              ShowSnackBar.show("CNIC Needed");
                            } else {
                              await context
                                  .read<AuthProvider>()
                                  .cnicConfirmation(cnicController.text);
                            }
                          },
                        ),
                      )),
                  SizedBox(height: 30.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Expanded(child: Divider(thickness: 2)),
                        Text("  OR  "),
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
                        title: "Already Have an Account?",
                      ),
                      LinkText(
                        title: " Sign in",
                        color: Colors.orange,
                        onTap: () {
                          AppState state = sl();
                          state.goToNext(PageConfigs.pinCodeScreenConfig,
                              pageState: PageState.replace);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
