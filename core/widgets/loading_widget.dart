import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sb_myreports/core/utils/constants/app_assets.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      AppAssets.loadingLottie,
      height: 120,
      width: 120,
    );
  }
}
