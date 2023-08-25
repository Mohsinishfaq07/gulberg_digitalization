import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomOtpFields extends StatelessWidget {
  const CustomOtpFields(
      {this.controller,
      this.errorStream,
      this.onCompleted,
      required this.onChanged,
      this.beforeTextPaste,
      this.size,
      this.length = 4,
      Key? key})
      : super(key: key);
  final TextEditingController? controller;
  final StreamController<ErrorAnimationType>? errorStream;
  final Function(String)? onCompleted;
  final Function(String) onChanged;
  final int length;
  final double? size;

  final bool Function(String?)? beforeTextPaste;
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      mainAxisAlignment: MainAxisAlignment.center,
      cursorHeight: 16.sp,
      appContext: context,
      pastedTextStyle: const TextStyle(
        // color: Theme.of(context).primaryColor,
        fontWeight: FontWeight.normal,
      ),
      length: length,
      backgroundColor: Colors.transparent,
      obscureText: true,
      obscuringCharacter: '*',
      animationType: AnimationType.slide,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.circle,

        // borderRadius: BorderRadius.circular(70.r),
        fieldHeight: size ?? 45.w,
        fieldWidth: size ?? 45.w,
        borderWidth: 1.w,
        fieldOuterPadding: const EdgeInsets.all(3),
        activeFillColor: Colors.white.withOpacity(0.1),
        activeColor: Colors.green,
        inactiveFillColor: Colors.white.withOpacity(0.1),
        inactiveColor: Colors.green,
        errorBorderColor: Colors.redAccent,
        selectedFillColor: Colors.white.withOpacity(0.1),
        selectedColor: Colors.white.withOpacity(0.1),
      ),
      cursorColor: Colors.green,
      animationDuration: const Duration(milliseconds: 300),
      textStyle: TextStyle(fontSize: 16.sp, height: 1.8.h),
      enableActiveFill: true,
      errorAnimationController: errorStream,
      controller: controller,
      keyboardType: TextInputType.number,
      autoDisposeControllers: true,
      boxShadows: const [
        BoxShadow(
          offset: Offset(0, 2),
          color: Colors.transparent,
          blurRadius: 1,
        )
      ],
      onCompleted: onCompleted,
      onChanged: onChanged,
      beforeTextPaste: beforeTextPaste,
    );
  }
}
