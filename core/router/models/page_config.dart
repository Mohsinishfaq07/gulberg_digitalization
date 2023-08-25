import 'package:sb_myreports/core/router/models/page_keys.dart';
import 'package:sb_myreports/core/router/models/page_paths.dart';

import '../pages.dart';

class PageConfigs {
  static PageConfiguration splashPageConfig = const PageConfiguration(
      key: PageKeys.splashPageKey,
      path: PagePaths.splashPagePath,
      uiPage: Pages.splashPage);
  static PageConfiguration onBoardPageConfig = const PageConfiguration(
      key: PageKeys.onBoardPageKey,
      path: PagePaths.onboardPagePath,
      uiPage: Pages.onBoardScreen);
  static PageConfiguration creatPinScreenConfig = const PageConfiguration(
      key: PageKeys.creatPinScreenKey,
      path: PagePaths.creatPinScreenPath,
      uiPage: Pages.creatPinScreen);
  static PageConfiguration selectLocationOnMapScreenConfig =
      const PageConfiguration(
          key: PageKeys.selectLocationOnMaPScreenKey,
          path: PagePaths.selectLocationOnMapScreenPath,
          uiPage: Pages.selectLocationOnMap);
  static PageConfiguration creatWalletAccountConfig = const PageConfiguration(
      key: PageKeys.creatWalletAccountScreenKey,
      path: PagePaths.creatWalletAccountScreenPath,
      uiPage: Pages.creatWalletAccountScreen);
  static PageConfiguration billsHistoryScreenConfig = const PageConfiguration(
      key: PageKeys.billHistoryPageKey,
      path: PagePaths.billistoryPagePath,
      uiPage: Pages.billsHistoryPage);
  static PageConfiguration createAccountFormScreenConfig =
      const PageConfiguration(
          key: PageKeys.creatAccountFormScreenKey,
          path: PagePaths.creatAccountFormScreenPath,
          uiPage: Pages.creatAccountFormScreen);
  static PageConfiguration createAccountCnicScreenConfig =
      const PageConfiguration(
          key: PageKeys.createAccountCNICScreenKey,
          path: PagePaths.createAccountCNICScreenPath,
          uiPage: Pages.createAccountCNICScreen);
  static PageConfiguration otpVerficationConfig = const PageConfiguration(
      key: PageKeys.otpVerificationScreenKey,
      path: PagePaths.otpVerificationScreenPath,
      uiPage: Pages.otpVerificationScreen);
  static PageConfiguration pinCodeScreenConfig = const PageConfiguration(
      key: PageKeys.pinCodeScreenKey,
      path: PagePaths.pinCodeScreenPath,
      uiPage: Pages.pinCodeScreen);
  static PageConfiguration dashboardScreenPageConfig = const PageConfiguration(
      key: PageKeys.dashboardScreenPageKey,
      path: PagePaths.dashboardScreenPagePath,
      uiPage: Pages.dashboardScreen);
  static PageConfiguration billPaymentScreenConfig = const PageConfiguration(
      key: PageKeys.billPaymentsPageKey,
      path: PagePaths.billPaymentsPagePath,
      uiPage: Pages.billPayments);
  static PageConfiguration selectaccountScreenConfig = const PageConfiguration(
      key: PageKeys.selectaccountPageKey,
      path: PagePaths.selectaccountPagePath,
      uiPage: Pages.selectaccount);
  static PageConfiguration payNowScreenConfig = const PageConfiguration(
      key: PageKeys.payNowPageKey,
      path: PagePaths.payNowPagePath,
      uiPage: Pages.payNowScreen);
  static PageConfiguration transactionDetailScreenConfig =
      const PageConfiguration(
          key: PageKeys.transactionDetailPageKey,
          path: PagePaths.transactionDetailPagePath,
          uiPage: Pages.transactionDetail);
  static PageConfiguration complaintsScreenConfig = const PageConfiguration(
      key: PageKeys.complaintsScreenPageKey,
      path: PagePaths.complaintsScreenPagePath,
      uiPage: Pages.complaintsScreen);
  static PageConfiguration ownpropertyScreenConfig = const PageConfiguration(
      key: PageKeys.ownpropertyScreenPageKey,
      path: PagePaths.ownPropertyScreenPagePath,
      uiPage: Pages.ownproperty);
  static PageConfiguration complaintDetailsScreenConfig =
      const PageConfiguration(
          key: PageKeys.complaintDetailScreenPageKey,
          path: PagePaths.complaintDetailScreenPagePath,
          uiPage: Pages.complaintDetail);

  static PageConfiguration walletPageConfig = const PageConfiguration(
      key: PageKeys.walletPageKey,
      path: PagePaths.walletPagePath,
      uiPage: Pages.walletPage);

  static PageConfiguration linkZindigiAccountPageConfig =
      const PageConfiguration(
          key: PageKeys.linkZindigiAccountPageKey,
          path: PagePaths.linkAccountPagePath,
          uiPage: Pages.linkZindigiAccontPage);
  static PageConfiguration payfastPageConfig = const PageConfiguration(
      key: PageKeys.payFastPageKey,
      path: PagePaths.payFastPagePath,
      uiPage: Pages.payfastPage);
}
