import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sb_myreports/core/router/app_state.dart';
import 'package:sb_myreports/core/router/models/page_config.dart';
import 'package:sb_myreports/core/widgets/custom/continue_button.dart';

import '../../../../core/const/color.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/enums/page_state_enum.dart';
import '../../../../core/utils/globals/globals.dart';
import '../../../../core/widgets/custom/bottom_sheet_decoration.dart';
import '../../../../core/widgets/custom/link_text.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    ValueNotifier currentPageIndex = ValueNotifier(0);
    List<String> pages = [
      AppAssets.billIlustration,
      AppAssets.moneyIlustration,
      AppAssets.complaintIlustration,
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                  height: MediaQuery.of(context).size.height - 200,
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      Image.asset(
                        AppAssets.gulbergLogoImage,
                        height: 65,
                      ),
                      const SizedBox(height: 50),
                      Container(
                          height: MediaQuery.of(context).size.height -
                              200 -
                              100 -
                              100,
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: PageView.builder(
                              onPageChanged: (value) {
                                currentPageIndex.value = value;
                              },
                              controller: pageController,
                              itemCount: pages.length,
                              itemBuilder: ((context, index) {
                                return Card(
                                  elevation: 5,
                                  child: Center(
                                    child: Image.asset(
                                      pages[index],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                );
                              }))),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(31, 117, 117, 117),
                              ),
                              child: ValueListenableBuilder(
                                  valueListenable: currentPageIndex,
                                  builder: ((context, value, child) {
                                    return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: List<Widget>.generate(
                                            pages.length,
                                            (index) => Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 0),
                                                child: InkWell(
                                                  onTap: () {
                                                    // _pageViewController.animateToPage(index,
                                                    //     duration: const Duration(milliseconds: 300),
                                                    //     curve: Curves.easeIn);
                                                  },
                                                  child: Container(
                                                    height: 6,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Color.fromARGB(
                                                          31, 117, 117, 117),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          height: 10,
                                                          width: 25,
                                                          decoration: BoxDecoration(
                                                              color: value ==
                                                                      index
                                                                  ? Theme.of(
                                                                          context)
                                                                      .primaryColor
                                                                      .withOpacity(
                                                                          0.6)
                                                                  : Colors
                                                                      .transparent,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                          .all(
                                                                      Radius.circular(
                                                                          15))),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ))));
                                  })),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Row(mainAxisSize: MainAxisSize.max, children: [
                  Expanded(
                      child: BottomSheetDecoration(
                          // height: 110,
                          isScrollable: true,
                          backgroundColor: cAccentColor,
                          children: [
                        Column(
                          children: [
                            SizedBox(
                              width: 170,
                              height: 35,
                              child: ContinueButton(
                                backgroundColor: Colors.white.withOpacity(0.9),
                                textStyle: const TextStyle(
                                    color: Color.fromARGB(255, 22, 79, 125)),
                                text: "Creat Account",
                                onPressed: () {
                                  AppState state = sl();
                                  state.goToNext(
                                      PageConfigs.createAccountCnicScreenConfig,
                                      pageState: PageState.replace);
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20.sp,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: LinkText(
                                      title: "Already have an account ?",
                                      color: Colors.yellow[700]!),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: SizedBox(
                                    height: 35,
                                    child: ContinueButton(
                                      backgroundColor:
                                          Colors.white.withOpacity(0.9),
                                      textStyle: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 22, 79, 125)),
                                      text: "Login",
                                      onPressed: () {
                                        AppState state = sl();
                                        state.goToNext(
                                            PageConfigs.pinCodeScreenConfig,
                                            pageState: PageState.replace);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ]))
                ]))
          ]),
        ),
      ),
    );
  }
}
