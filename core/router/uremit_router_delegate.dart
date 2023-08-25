import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sb_myreports/core/utils/extension/extensions.dart';
import 'package:sb_myreports/features/authentication/presentation/pages/creat_pin_screen.dart';
import 'package:sb_myreports/features/authentication/presentation/pages/create_account_cnic_screen.dart';
import 'package:sb_myreports/features/authentication/presentation/pages/create_account_form_screen.dart';
import 'package:sb_myreports/features/authentication/presentation/pages/onboard_screen.dart';
import 'package:sb_myreports/features/authentication/presentation/pages/otp_verification_screen.dart';
import 'package:sb_myreports/features/authentication/presentation/pages/pin_code_screen.dart';
import 'package:sb_myreports/features/billpayments/presentation/page/bill_history.dart';
import 'package:sb_myreports/features/billpayments/presentation/page/bill_payments.dart';
import 'package:sb_myreports/features/billpayments/presentation/page/pay_now.dart';
import 'package:sb_myreports/features/complaints/presentation/page/complaint_detail.dart';
import 'package:sb_myreports/features/complaints/presentation/page/complaints.dart';
import 'package:sb_myreports/features/complaints/presentation/page/complaints_type/own_property.dart';
import 'package:sb_myreports/features/complaints/presentation/page/select_location_on_map_screen.dart';
import 'package:sb_myreports/features/dashboard/presentation/page/dashboad_page.dart';
import 'package:sb_myreports/features/wallet/presentation/pages/create_wallet_screen.dart';
import 'package:sb_myreports/features/wallet/presentation/pages/link_account_screen.dart';
import 'package:sb_myreports/features/wallet/presentation/pages/wallet_screen.dart';
import '../../features/billpayments/presentation/page/select_account.dart';
import '../../features/splash/presentation/pages/splash_screen.dart';
import '../utils/enums/page_state_enum.dart';
import '../utils/globals/globals.dart';
import 'app_state.dart';
import 'pages.dart';

BuildContext?
    globalHomeContext; // doing this to pop the bottom sheet on home screen

class UremitRouterDelegate extends RouterDelegate<PageConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfiguration> {
  late final AppState appState;
  final List<Page> _pages = [];
  late BackButtonDispatcher backButtonDispatcher;

  List<MaterialPage> get pages => List.unmodifiable(_pages);

  UremitRouterDelegate(this.appState) {
    appState.addListener(() {
      notifyListeners();
    });
  }

  @override
  Widget build(BuildContext context) {
    /// Faulty Code will need to find a way to solve it
    appState.globalErrorShow = (value) {
      context.show(message: value);
    };

    return Container(
      key: ValueKey(pages.last.name),
      child: Navigator(
        key: navigatorKeyGlobal,
        onPopPage: _onPopPage,
        pages: buildPages(),
      ),
    );
  }

  List<Page> buildPages() {
    switch (appState.currentAction.state) {
      case PageState.none:
        break;
      case PageState.addPage:
        addPage(appState.currentAction.page!);
        break;
      case PageState.remove:
        removePage(appState.currentAction.page!);
        break;

      case PageState.pop:
        pop();
        break;
      case PageState.addAll:
        for (var page in appState.currentAction.pages!) {
          addPage(page);
        }
        break;
      case PageState.addAndReplaceAll:
        _pages.clear();

        setNewRoutePath(appState.currentAction.page!);
        for (var page in appState.currentAction.pages!) {
          addPage(page);
        }

        // bool isFirst = true;
        // for (var page in appState.currentAction.pages!) {
        //   if (isFirst) {
        //     replaceAll(page);
        //     isFirst = false;
        //   } else {
        //     addPage(page);
        //   }
        // }
        break;
      case PageState.addWidget:
        pushWidget(
            appState.currentAction.widget!, appState.currentAction.page!);
        break;
      case PageState.replace:
        replace(appState.currentAction.page!);
        break;

      case PageState.removeMany:
        for (var route in appState.currentAction.pages!) {
          removePage(route);
        }
        break;
      case PageState.replaceAll:
        replaceAll(appState.currentAction.page!);
        break;
    }
    return List.of(_pages);
  }

  void replaceAll(PageConfiguration newRoute) {
    _pages.clear();
    setNewRoutePath(newRoute);
  }

  void replace(PageConfiguration newRoute) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
    }
    addPage(newRoute);
  }

  /// This method adds pages based on the PageConfig received
  /// [Input]: [PageConfiguration]
  void addPage(PageConfiguration pageConfig) {
    final shouldAddPage =
        _pages.isEmpty || (_pages.last.name != pageConfig.path);

    if (shouldAddPage) {
      switch (pageConfig.uiPage) {
        case Pages.splashPage:
          _addPageData(const SplashScreen(), pageConfig);
          break;
        case Pages.onBoardScreen:
          _addPageData(OnBoardScreen(), pageConfig);
          break;
        case Pages.creatAccountFormScreen:
          _addPageData(const CreateAccountFormScreen(), pageConfig);
          break;
        case Pages.creatPinScreen:
          _addPageData(const CreatePinScreen(), pageConfig);
          break;
        case Pages.createAccountCNICScreen:
          _addPageData(CreateAccountCNICScreen(), pageConfig);
          break;
        case Pages.otpVerificationScreen:
          _addPageData(const OTPVerificationScreen(), pageConfig);
          break;
        case Pages.creatWalletAccountScreen:
          _addPageData(CreateWalletAccountScreen(), pageConfig);
          break;
        case Pages.pinCodeScreen:
          _addPageData(const PinCodeScreen(), pageConfig);
          break;
        case Pages.dashboardScreen:
          _addPageData(DashboardScreen(), pageConfig);
          break;
        case Pages.billPayments:
          _addPageData(BillPaymentsScreen(), pageConfig);
          break;

        case Pages.billsHistoryPage:
          _addPageData(BillHistoryScreen(), pageConfig);
          break;
        case Pages.selectLocationOnMap:
          _addPageData(const SelectLocationOnMap(), pageConfig);
          break;
        case Pages.selectaccount:
          _addPageData(const SelectAccountScreen(), pageConfig);
          break;
        case Pages.payNowScreen:
          _addPageData(const PayNowScreen(), pageConfig);
          break;
        // case Pages.transactionDetail:
        //   _addPageData(const TransactionDetailScreen(), pageConfig);
        //   break;
        case Pages.complaintsScreen:
          _addPageData(ComplaintsScreen(), pageConfig);
          break;
        case Pages.ownproperty:
          _addPageData(const OwnProperty(), pageConfig);
          break;
        case Pages.complaintDetail:
          _addPageData(const ComplaintDetailScreen(), pageConfig);
          break;
        case Pages.walletPage:
          _addPageData(WalletScreen(), pageConfig);
          break;
        case Pages.linkZindigiAccontPage:
          _addPageData(const LinkAccountScreen(), pageConfig);
          break;
      }
    }
  }

  void _addPageData(Widget child, PageConfiguration pageConfig) {
    _pages.add(
      _createPage(child, pageConfig),
    );
  }

  void pushWidget(Widget child, PageConfiguration newRoute) {
    _addPageData(child, newRoute);
  }

  MaterialPage _createPage(Widget child, PageConfiguration pageConfig) {
    return MaterialPage(
        child: child,
        key: ValueKey(pageConfig.key),
        name: pageConfig.path,
        arguments: pageConfig);
  }

  bool _onPopPage(Route<dynamic> route, result) {
    final didPop = route.didPop(result);

    if (!didPop) {
      return false;
    }
    if (canPop()) {
      pop();
      return true;
    } else {
      return false;
    }
  }

  void pop() {
    if (globalHomeContext != null) {
      Navigator.of(globalHomeContext!).pop();
      globalHomeContext = null;
      return;
    }
    if (canPop()) {
      _removePage(_pages.last as MaterialPage);
    } else {
      // if (_pages.last.name != PagePaths.authWrapperPagePath) {
      //   _homeViewModel.onBottomNavTap(0);
      // }
    }
  }

  void removePage(PageConfiguration page) {
    if (_pages.isNotEmpty) {
      int index = _pages.indexWhere((element) => element.name == page.path);
      if (index != -1) {
        _pages.removeAt(index);
      }
    }
  }

  void _removePage(MaterialPage page) {
    _pages.remove(page);
    // notifyListeners();
  }

  bool canPop() {
    return _pages.length > 1;
  }

  @override
  Future<bool> popRoute() {
    if (canPop()) {
      _removePage(_pages.last as MaterialPage);
      return Future.value(true);
    }
    return Future.value(false);
  }

  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) {
    final shouldAddPage =
        _pages.isEmpty || (_pages.last.name != configuration.path);

    if (!shouldAddPage) {
      return SynchronousFuture(null);
    }
    _pages.clear();
    addPage(configuration);

    return SynchronousFuture(null);
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => navigatorKeyGlobal;
}
