import 'package:flutter/material.dart';
import "package:provider/provider.dart";

import '../../Resources/Components/texts.dart';
import '../../Resources/Constants/enums.dart';
import '../../Resources/Constants/responsive.dart';
import '../../main.dart';
import '../Providers/users_provider.dart';

Map<String, String> headers = {
  // 'Accept': 'application/json; charset=UTF-8',
  'Content-Type': 'application/json',
  'Authorization':
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2NzUwNzU0NTQsImV4cCI6MzYxNjc1MDc1NDU0LCJyb2xlcyI6WyJST0xFX0dFU1RTVE9DSyIsIlJPTEVfV0FSRUhPVVNFX1BST0NVUkVNRU5UIiwiUk9MRV9VU0VSIl0sInVzZXJuYW1lIjoiRElESUVSIn0.RmO8p5bnDThK7YgxsVsNAoMisblCp8y4xILAXEGh14CxeEevihI3XkFhj3HiIj50pt40wEOKL7m_fkZLAHA0wLfO4NAUcZ-gSfZLJBRzyMMPzd6FWOtHf7ryefkYkpeI2wofYoVANGaM2XCCx2O3n-KVcOJM-l7kbMTNn7ROlTguNbD3DhMKwTlI95xN26Q0N1jVZpuaCGpbyjd3DQqvhsKopjSXY69FGEJ-Qm4XaOiIYKLodjs2_WItGnq9270Jy5fKtUDduIcQR_nwekkRTrMakjbTFBh3l1aWiKleZeSYX44U0iaY4HdeHWNJauUFx8tzSjcQQp3pm4WoaXuSXA"
};

Map<String, String> headersPatch = {
  // 'Accept': 'application/json; charset=UTF-8',
  'Content-Type': 'application/merge-patch+json',
  'Authorization':
      'Bearer ${navKey.currentContext!.read<UserProvider>().userLogged?.token}'
  // "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2NzIzMDgwNDEsImV4cCI6MzYxNjcyMzA4MDQxLCJyb2xlcyI6WyJST0xFX1NVUEVSX0dVSUNIRVRJRVIiLCJST0xFX1VTRVIiXSwidXNlcm5hbWUiOiJndWljaGV0aWVyIn0.f4M9yoOa4tiDwSJAE6ioRAFei1wMDi2Xt44GBkZFpBsdStu0wJZlqrBCSUuCBc80BDib2ydyDNdJjqPs6WrSWzMpBvZ_ZGS_Rj-HCwYuEJQ3ii8BiwqF-fqhdKZkUUCvzKTwTgxC4I2vt716_5_cAZSuaETMcnDl77Lv-Ma3u2EW6YbjU5QP-qd5LKqKwXRH8bWKjw6qhvJCEPS4YNQBYSw1wwjnPwlk1y_8fMBFzGXT1-MY4DKPCTLBdBPWIWdDuFRpZMLqoOahB6p7jFIG3Z0ufOuRohNmBv_KWfHQ2NdbQ33EuXIOGlqfzTKMtSAu1b5MDtfDufCOzT9JHSHl4A"
  // 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2NzIyNDY0MjksImV4cCI6MzYxNjcyMjQ2NDI5LCJyb2xlcyI6WyJST0xFX0FETUlOIiwiUk9MRV9VU0VSIl0sInVzZXJuYW1lIjoiYWRtaW4ifQ.bX3IZJ2RsfLub5jOwop7zl4NMad9RlrEfFUu29XngPQa9kr6Kiyozoq70YQyGkSxtgF3QCYHQS4KX7AJwo4oDDbmDX3snEI3y2jfJtl4UpuZDDJKMuWmWZJuOCSZIOG3EVkh-inkywgI4Tmoyc-CLZQcbQWK3iJWYpAp51h8IbNkfjI6zGCxEfsVNJkBSFs3OBWzYU1JBFjw8elF6ChdaFtrX6hGY_zFU3Zss_jkqzwT7Q5GTcJSFRiCGPvzljXBDAHgll0_RA3zFEHEgiHG5zAwTrXsP7jk0Y-48ChJ1lmikjyMedjwUzjNYkLoD-N7oVSr-OCZThJACEvtvNEGsw'
};

double kDefaultPadding = 20;

class AppColors {
  static Color kPrimaryColor = const Color.fromRGBO(255, 95, 20, 1);
  static Color kSecondaryColor = const Color.fromRGBO(32, 146, 146, 1);
  static Color kScaffoldColor = const Color.fromRGBO(220, 220, 220, 1);
  static Color kAccentColor = const Color.fromRGBO(40, 40, 40, 1);
  static Color kBlackColor = const Color.fromRGBO(24, 24, 24, 1);

  // static Color kBlackColor = Colors.black;
  static Color kBlackLightColor = const Color.fromRGBO(40, 40, 40, 1);
  static Color kWhiteColor = Colors.white;
  static Color kWhiteDarkColor = Colors.grey.shade400;
  static Color kGreenColor = Colors.green;
  static Color kRedColor = Colors.red;
  static Color kBlueColor = Colors.blue;
  static Color kGreyColor = Colors.grey;
  static Color kWarningColor = Colors.orange;

  // static Color kYellowColor = const Color.fromRGBO(255, 184, 57, 1);
  // static Color kYellowColor = const Color.fromRGBO(253, 168, 41, 1);
  static Color kYellowColor = Colors.yellow;
  static Color kTextFormWhiteColor = Colors.white.withOpacity(0.05);
  static Color kTextFormBackColor = Colors.black.withOpacity(0.09);
  static Color kTransparentColor = Colors.transparent;
}

class BaseUrl {
  static int user_id = 1;
  static String ip = "http://192.168.2.39:8000";
  // static String ip = "http://apireflet.etsmaki.com";
  // static String ip = "http://reflet-flight.ohadaexpress.com";
  // static String ip = "http://192.168.2.17:8000";
  // static String ip = "http://127.0.0.1:8000";
  static String apiUrl = "$ip/api";

  static String getLogin = '$apiUrl/authentication_token';
  static String user = '$apiUrl/user/';
  static String cars = '$apiUrl/vehicles';
  static String clientCategories = '$apiUrl/categoryOfPassage';
  static String categories = '$apiUrl/categories';
  static String clients = '$apiUrl/client';
  static String licences = '$apiUrl/licenses';
  static String products = '$apiUrl/services';
  static String uom = '$apiUrl/unit_of_measures/';
  static String invoices = '$apiUrl/invoice';
  static String productionFormula = '$apiUrl/production_formulas';
  static String orders = '$apiUrl/orders';
  static String stats = '$apiUrl/stats/';

  // reflet-flight
  static String device = "$ip/api/divice";
  static String type = "$ip/api/categoryOfPassage";
  static String tarification = "$ip/api/tarification";
  static String typeOfdevice = "$ip/api/typeOfDivice";
  static String categoryOfdevice = "$ip/api/categoryOfDivice";
  static String classes = "$ip/api/class";
  static String tarmacs = '$apiUrl/airport';
  static String categorieAirplanes = '$apiUrl/categoryOfDivice';
  static String typeAirplanes = '$apiUrl/typeOfDivice';
  static String schedules = '$apiUrl/typeOfDivice';
  static String crews = '$apiUrl/users';
  static String horaire = '$apiUrl/horaire';
  static String schedule_flight = '$apiUrl/flight_program';
  static String city = '$apiUrl/city';
  static String aircrew = '$apiUrl/crew';
  static String passagers = '$apiUrl/client';
  static String tarifications = '$apiUrl/tarification';

  static String doucmentType = '$apiUrl/document';
  static String flightPrgramSearch = '$apiUrl/program';
}

class ToastNotification {
  static showToast(
      {required String msg,
      String? title = "Information",
      Alignment? align = Alignment.topCenter,
      MessageType? msgType = MessageType.warning}) {
    ScaffoldMessenger.of(navKey.currentContext!).removeCurrentSnackBar();
    ScaffoldMessenger.of(navKey.currentContext!).showSnackBar(
      SnackBar(
        elevation: 5,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        margin: Responsive.isWeb(navKey.currentContext!)
            ? EdgeInsets.only(
                left: align == Alignment.center
                    ? MediaQuery.of(navKey.currentContext!).size.width / 2.5
                    : MediaQuery.of(navKey.currentContext!).size.width / 1.3,
                right: align == Alignment.center
                    ? MediaQuery.of(navKey.currentContext!).size.width / 2.5
                    : 8,
                bottom: 8)
            : const EdgeInsets.only(left: 8, right: 8, bottom: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: AppColors.kAccentColor,
        content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: msgType == MessageType.info
                  ? AppColors.kBlueColor
                  : msgType == MessageType.error
                      ? AppColors.kRedColor
                      : msgType == MessageType.success
                          ? AppColors.kGreenColor
                          : AppColors.kWarningColor,
              // msgType == MessageType.error
              //     ? AppColors.kRedColor.withOpacity(0.1)
              //     : msgType == MessageType.success
              //         ? AppColors.kGreenColor.withOpacity(0.1)
              //         : AppColors.kWarningColor.withOpacity(0.1),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 35,
                  height: 35,
                  // padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    // shape: BoxShape.rectangle,
                    // color: AppColors.kAccentColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    msgType == MessageType.info
                        ? Icons.info
                        : msgType == MessageType.error
                            ? Icons.cancel
                            : msgType == MessageType.success
                                ? Icons.check_circle
                                : Icons.warning_amber_rounded,
                    color: AppColors.kWhiteColor,
                    size: 35,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextWidgets.textBold(
                          title: title!,
                          fontSize: 14,
                          textColor: AppColors.kWhiteColor,
                        ),
                        TextWidgets.textNormal(
                          title: msg,
                          fontSize: 12,
                          textColor: AppColors.kWhiteColor,
                        ),
                      ]),
                ),
              ],
            )),
      ),
    );
  }
}
