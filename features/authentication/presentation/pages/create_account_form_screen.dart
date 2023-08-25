import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sb_myreports/core/router/app_state.dart';
import 'package:sb_myreports/core/router/models/page_config.dart';
import 'package:sb_myreports/features/authentication/presentation/manager/auth_provider.dart';

import '../../../../core/const/color.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/globals/globals.dart';
import '../../../../core/widgets/custom/bottom_sheet_decoration.dart';
import '../../../../core/widgets/custom/continue_button.dart';
import '../../../../core/widgets/custom/custom_textfield.dart';

class CreateAccountFormScreen extends StatefulWidget {
  const CreateAccountFormScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountFormScreen> createState() =>
      _CreateAccountFormScreenState();
}

class _CreateAccountFormScreenState extends State<CreateAccountFormScreen> {
  late MediaQueryData screenData;
  FocusNode pinNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController pinController = TextEditingController();
  AuthProvider authProvider = sl();

  @override
  Widget build(BuildContext context) {
    screenData = MediaQuery.of(context);

    return ChangeNotifierProvider.value(
        value: authProvider,
        builder: (context, child) {
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
                      height: screenData.size.height -
                          (250 + screenData.padding.top),
                      isScrollable: true,
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 20, bottom: 0),
                      children: [
                        CustomTextField(
                          title: "CNIC/NICOP",
                          controller: TextEditingController(
                              text: context
                                  .read<AuthProvider>()
                                  .cnicResponseModel!
                                  .data!
                                  .cNIC),
                          putTitleInRow: true,
                          titleWidth: 80,
                          hintText: "xxxxxxxxxxxxxx",
                          isReadOnly: true,
                        ),
                        SizedBox(height: 15.h),
                        CustomTextField(
                          title: "Name",
                          controller: TextEditingController(
                              text: context
                                  .read<AuthProvider>()
                                  .cnicResponseModel!
                                  .data!
                                  .memberName),
                          putTitleInRow: true,
                          titleWidth: 80,
                          hintText: "Chandio",
                          isReadOnly: true,
                        ),
                        SizedBox(height: 15.h),
                        CustomTextField(
                          title: "Contact",
                          controller: TextEditingController(
                              text: context
                                  .read<AuthProvider>()
                                  .cnicResponseModel!
                                  .data!
                                  .phone),
                          isReadOnly: true,
                          putTitleInRow: true,
                          titleWidth: 80,
                          hintText: "03148596965",
                        ),
                        SizedBox(height: 15.h),
                        ExpansionTile(
                          title: const Text("Property Details"),
                          initiallyExpanded: true,
                          children: List.generate(
                            context
                                .read<AuthProvider>()
                                .cnicResponseModel!
                                .data!
                                .inventory!
                                .length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Table(
                                border: TableBorder.all(
                                    borderRadius: BorderRadius.circular(10),
                                    width: 2.0,
                                    color: Colors.black45),
                                columnWidths: const <int, TableColumnWidth>{
                                  0: FlexColumnWidth(),
                                  1: FlexColumnWidth(),
                                },
                                children: [
                                  customTableRow(
                                      "House No/Plot",
                                      context
                                          .read<AuthProvider>()
                                          .cnicResponseModel!
                                          .data!
                                          .inventory!
                                          .first
                                          .plotNo!),
                                  customTableRow(
                                      "Street No",
                                      context
                                          .read<AuthProvider>()
                                          .cnicResponseModel!
                                          .data!
                                          .inventory!
                                          .first
                                          .street!),
                                  customTableRow(
                                      "Block No",
                                      context
                                          .read<AuthProvider>()
                                          .cnicResponseModel!
                                          .data!
                                          .inventory!
                                          .first
                                          .blockID!),
                                  customTableRow(
                                      "Phase",
                                      context
                                          .read<AuthProvider>()
                                          .cnicResponseModel!
                                          .data!
                                          .inventory!
                                          .first
                                          .phaseID!),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: 200,
                            child: ContinueButton(
                              text: "Submit",
                              loadingNotifier: context
                                  .read<AuthProvider>()
                                  .registeringUserLoading,
                              onPressed: () async {
                                // if (!_formKey.currentState!.validate()) {
                                //   ShowSnackBar.show(
                                //       "Pin needed For Account creation");
                                // } else {

                                AppState state = sl();
                                state
                                    .goToNext(PageConfigs.creatPinScreenConfig);
                                // }
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  )
                ]),
              ),
            ),
          );
        });
  }

  TableRow customTableRow(String title, String value) {
    return TableRow(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.sp, top: 10, bottom: 10),
          child: Text(title),
        ),
        Padding(
          padding:
              EdgeInsets.only(left: 10.sp, top: 10, bottom: 10, right: 20.sp),
          child: Align(alignment: Alignment.centerRight, child: Text(value)),
        ),
      ],
    );
  }
}
