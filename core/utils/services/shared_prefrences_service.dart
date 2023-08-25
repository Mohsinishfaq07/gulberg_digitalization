import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrencesService {
  /// to check in shared prefrences if user is using the app for first time
  Future<String?> getLoginCredentials() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? loginDetails = sp.getString("LoginCredentials");
    return (loginDetails?.length ?? 0) == 0 ? null : loginDetails;
  }

  setLoginCredentials(String value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString("LoginCredentials", value);
  }

  clearLoginCredentials() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString("LoginCredentials", "");
  }

  Future<String?> getIsFirstTime() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? loginDetails = sp.getString("LoginCredentials");
    return loginDetails;
  }

  setIsFirstTime(String value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString("LoginCredentials", value);
  }
}
