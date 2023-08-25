import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sb_myreports/core/utils/constants/app_assets.dart';
import 'package:sb_myreports/core/utils/globals/globals.dart';
import 'package:sb_myreports/core/widgets/custom/continue_button.dart';

Future<void> showCustomDialog(
    {required Widget child, Widget? title, List<Widget>? action}) {
  return showDialog<void>(
    context: navigatorKeyGlobal.currentContext!,
    builder: (BuildContext context) {
      return AlertDialog(
        title: title,
        content: child,
        actions: <Widget>[if (action != null) ...action],
      );
    },
  );
}

Future<bool> showZindigiAccountDialog({String? description}) async {
  bool? value = await showDialog<bool>(
    context: navigatorKeyGlobal.currentContext!,
    builder: (BuildContext context) {
      return AlertDialog(
        title: SvgPicture.asset(AppAssets.alertSvg, height: 40, width: 40),
        content: Text(
          description ??
              "You are offered to open a complimentary Basic Level Zindigi Digital Mobile Banking Account. Would you like to avail this offer?",
          textAlign: TextAlign.center,
          style:
              Theme.of(navigatorKeyGlobal.currentContext!).textTheme.bodyText2,
        ),
        actions: <Widget>[
          SizedBox(
            height: 40,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500),
                          color: Theme.of(navigatorKeyGlobal.currentContext!)
                              .primaryColor),
                      child: ContinueButton(
                        text: "No",
                        textStyle: TextStyle(
                            color: Theme.of(navigatorKeyGlobal.currentContext!)
                                .primaryColor),
                        backgroundColor: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                      child: ContinueButton(
                    text: "Yes",
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                  )),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      );
    },
  );
  if (value != null) {
    if (value) {
      return true;
    }
  }
  return false;
}
