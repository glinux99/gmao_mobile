import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class AppPrefs extends ChangeNotifier {
  final languageCode = ReadWriteValue('language_code', 'fr_FR');
  final token = ReadWriteValue('user_token', '');
  final deviceId = ReadWriteValue('device_id', '');
  final localUserData = ReadWriteValue('local_user_data', '');
  final isThemeMode = ReadWriteValue('isThemeMode', false);

  // String get someValue  = AppPrefs();
  // final get deviceId => deviceId;

  AppPrefs() {
    initData();
    notifyListeners();
  }

  void initData() async {
    await GetStorage.init();
    initializeDateFormatting();
    Intl.defaultLocale = 'fr_FR';
    // getDeviceIdentity();
  }

  // getDeviceIdentity() async {
  //   final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  //   if (deviceId.key.isEmpty) {
  //     String deviceIdentity = '';
  //     try {
  //       if (Platform.isAndroid) {
  //         AndroidDeviceInfo info = await deviceInfoPlugin.androidInfo;
  //         deviceIdentity = "${info.product}-${info.id}";
  //       } else if (Platform.isIOS) {
  //         IosDeviceInfo info = await deviceInfoPlugin.iosInfo;
  //         deviceIdentity = "${info.model}-${info.identifierForVendor}";
  //       }
  //     } on PlatformException {
  //       deviceIdentity = "unknown";
  //     } finally {
  //       deviceId.val = deviceIdentity;
  //     }
  //   } else {
  //     dev.log(deviceId.val);
  //   }
  // }
}
