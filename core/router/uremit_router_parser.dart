import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'models/page_config.dart';
import 'models/page_paths.dart';
import 'pages.dart';

class UremitRouterParser extends RouteInformationParser<PageConfiguration> {
  @override
  Future<PageConfiguration> parseRouteInformation(
      RouteInformation routeInformation) {
    final uri = Uri.parse(routeInformation.location ?? '');

    if (uri.pathSegments.isEmpty) {
      return SynchronousFuture(PageConfigs.splashPageConfig);
    }

    final path = '/' + uri.pathSegments[0];

    switch (path) {
      case PagePaths.splashPagePath:
        return SynchronousFuture(PageConfigs.splashPageConfig);
      default:
        return SynchronousFuture(PageConfigs.splashPageConfig);
    }
  }

  @override
  RouteInformation restoreRouteInformation(PageConfiguration configuration) {
    switch (configuration.uiPage) {
      case Pages.splashPage:
        return const RouteInformation(location: PagePaths.splashPagePath);
      case Pages.onBoardScreen:
        return const RouteInformation(location: PagePaths.onboardPagePath);

      case Pages.creatAccountFormScreen:
        return const RouteInformation(
            location: PagePaths.creatAccountFormScreenPath);
      case Pages.creatPinScreen:
        return const RouteInformation(location: PagePaths.creatPinScreenPath);
      case Pages.creatWalletAccountScreen:
        return const RouteInformation(
            location: PagePaths.creatWalletAccountScreenPath);
      case Pages.billsHistoryPage:
        return const RouteInformation(location: PagePaths.billistoryPagePath);
      case Pages.createAccountCNICScreen:
        return const RouteInformation(
            location: PagePaths.createAccountCNICScreenPath);
      case Pages.otpVerificationScreen:
        return const RouteInformation(
            location: PagePaths.otpVerificationScreenPath);
      case Pages.pinCodeScreen:
        return const RouteInformation(location: PagePaths.pinCodeScreenPath);

      case Pages.dashboardScreen:
        return const RouteInformation(
            location: PagePaths.dashboardScreenPagePath);
      case Pages.billPayments:
        return const RouteInformation(location: PagePaths.billPaymentsPagePath);
      case Pages.selectaccount:
        return const RouteInformation(
            location: PagePaths.selectaccountPagePath);
      case Pages.payNowScreen:
        return const RouteInformation(location: PagePaths.payNowPagePath);
      case Pages.transactionDetail:
        return const RouteInformation(
            location: PagePaths.transactionDetailPagePath);
      case Pages.selectLocationOnMap:
        return const RouteInformation(
            location: PagePaths.selectLocationOnMapScreenPath);
      case Pages.complaintsScreen:
        return const RouteInformation(
            location: PagePaths.complaintsScreenPagePath);
      case Pages.ownproperty:
        return const RouteInformation(
            location: PagePaths.ownPropertyScreenPagePath);
      case Pages.complaintDetail:
        return const RouteInformation(
            location: PagePaths.complaintDetailScreenPagePath);
      case Pages.walletPage:
        return const RouteInformation(location: PagePaths.walletPagePath);
      case Pages.linkZindigiAccontPage:
        return const RouteInformation(location: PagePaths.linkAccountPagePath);

      case Pages.payfastPage:
        return const RouteInformation(location: PagePaths.payFastPagePath);
    }
  }
}
