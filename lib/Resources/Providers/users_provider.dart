import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../Resources/Constants/app_providers.dart';
import '../../Resources/Constants/enums.dart';
import '../../Resources/Constants/global_variables.dart';
import '../../Resources/Helpers/LocalData/local_data.helper.dart';
import '../../Resources/Helpers/sync_online_local.dart';
import '../../Resources/Models/user.model.dart';
import '../../main.dart';

class UserProvider extends ChangeNotifier {
  String keyName = 'users';
  List<UserModel> users = [], filteredData = [], offlineData = [];

  save(
      {required UserModel data,
      EnumActions? action = EnumActions.SAVE,
      required Function callback}) async {
    if (data.fullname.isEmpty ||
        data.phone.isEmpty ||
        data.level.isEmpty ||
        data.username.isEmpty ||
        data.password.isEmpty) {
      ToastNotification.showToast(
          msg: "Veuillez remplir tous les champs",
          msgType: MessageType.error,
          title: "Erreur");
      return;
    }
    if (action == EnumActions.UPDATE && data.id == null) {
      ToastNotification.showToast(
          msg: "Données invalides", msgType: MessageType.error, title: "Error");
      return;
    }
    Response res;
    if (action == EnumActions.UPDATE) {
      res = await AppProviders.appProvider
          .httpPut(url: "${BaseUrl.user}${data.uuid}", body: data.toJSON());
    } else {
      res = await AppProviders.appProvider
          .httpPost(url: BaseUrl.user, body: data.toJSON());
    }
    if (res.statusCode == 200) {
      data.syncStatus = 1;
      LocalDataHelper.saveData(key: keyName, value: data.toJSON());
      ToastNotification.showToast(
          msg: jsonDecode(res.body)['message'] ??
              "Informations sauvegardées avec succès",
          msgType: MessageType.success,
          title: "Success");
    }
    if (res.statusCode == 500) {
      LocalDataHelper.saveData(key: keyName, value: data.toJSON());
      ToastNotification.showToast(
          msg: jsonDecode(res.body)['message'] ??
              'Une erreur est survenue, sauvegarde hors connexion en cours...',
          msgType: MessageType.info,
          title: "Information");
    }
    if (res.statusCode != 200 && res.statusCode != 500) {
      ToastNotification.showToast(
          msg: jsonDecode(res.body)['message'] ??
              'Une erreur est survenue, Veuillez réessayer',
          msgType: MessageType.error,
          title: "Erreur");
      return;
    }
    notifyListeners();
    callback();
    getOffline(isRefresh: true);
  }

  get({bool? isRefresh = false}) {
    if (AppProviders.appProvider.isApiReachable) {
      getOnline(isRefresh: isRefresh);
    }
    getOffline(isRefresh: isRefresh);
  }

  getOffline({bool? isRefresh = false}) async {
    if (isRefresh == false && offlineData.isNotEmpty) return;
    List data = await LocalDataHelper.getData(
      key: keyName,
    );
    offlineData = List<UserModel>.from(
        data.map((item) => UserModel.fromJSON(item)).toList());
    if (userLogged?.user.level.toLowerCase() == 'root') {
      filteredData = offlineData;
    } else {
      filteredData = offlineData
          .where((user) => user.level.toLowerCase() != 'root')
          .toList();
    }
    notifyListeners();
  }

  getOnline({bool? isRefresh = false}) async {
    if (isRefresh == false && offlineData.isNotEmpty) return;
    var response =
        await AppProviders.appProvider.httpGet(url: "${BaseUrl.user}all");
    List data = [];
    // print(response.body);
    if (response.statusCode == 200) {
      data = jsonDecode(response.body)['data'];
    }
    users = List<UserModel>.from(
        data.map((item) => UserModel.fromJSON(item)).toList());
    SyncOnlineLocalHelper.insertNewDataOffline(
        onlineData: users.map((e) => e.toJSON()).toList(),
        offlineData: offlineData.map((e) => e.toJSON()).toList(),
        key: keyName,
        callback: getOffline);
    notifyListeners();
  }

  validateSearch({required List<UserModel> data}) {
    filteredData = data;
    notifyListeners();
  }

  login({required Map data, required Function callback}) async {
    if (data['username'].isEmpty || data['password'].isEmpty) {
      ToastNotification.showToast(
          msg: "Veuillez remplir tous les champs",
          msgType: MessageType.error,
          title: "Erreur");
      return;
    }
    Response res;
    // if (AppProviders.appProvider.isApiReachable == false) {
    //   res = Response(
    //       jsonEncode(
    //           {'data': [], 'message': 'Cette action necessite une connexion'}),
    //       404);
    // } else {
    res = await AppProviders.appProvider
        .httpPost(url: BaseUrl.getLogin, body: data);
    // }

    if (res.statusCode == 200) {
      prefs?.setString("loggedUser", (res.body));
      ToastNotification.showToast(
          msg: "Connexion effectuée avec succès",
          msgType: MessageType.success,
          title: "Success");
      notifyListeners();
      callback();
      getUserData();
      return;
    }
    // print(res.body);
    // print(jsonDecode(res.body));
    ToastNotification.showToast(
        align: Alignment.center,
        msg: jsonDecode(res.body)['message'] ??
            "Username ou mot de passe incorrect",
        msgType: MessageType.error,
        title: "Error");
  }

  AuthModel? userLogged;
  // WalletModel? userWallet;
  // CurrencyModel? defaultCurrency;
  String wallet_uuid = '';
  ConnectedUser connectedUser = ConnectedUser.guichet;
  getUserData() async {
    String? loggedUser = prefs?.getString('loggedUser');
    String? currency = prefs?.getString('mainCurrency');
    if (currency != null) {
      // defaultCurrency = CurrencyModel.fromJSON(jsonDecode(currency));
    }
    // userLogged =
    //     loggedUser != null ? AuthModel.fromJSON(jsonDecode(loggedUser)) : null;
    // print(userLogged!.user.permissions
    //     .map((e) => e.toString().toLowerCase())
    //     .toList());

    // for (var i = 0;
    //     i <
    //         userLogged!.user.permissions
    //             .map((e) => e.toString().toLowerCase())
    //             .toList()
    //             .length;
    //     i++) {
    //   String role = userLogged!.user.permissions
    //       .map((e) => e.toString().toLowerCase())
    //       .toList()[i];
    //   if (role.contains('admin')) {
    //     connectedUser = ConnectedUser.admin;
    //     wallet_uuid = '';
    //     notifyListeners();
    //     return;
    //   } else if (role.contains('guichet')) {
    //     connectedUser = ConnectedUser.guichet;
    //     notifyListeners();
    //     return;
    //   } else if (role.contains('stock')) {
    //     connectedUser = ConnectedUser.gestock;
    //     notifyListeners();
    //     return;
    //   } else {
    //     connectedUser = ConnectedUser.production;
    //     notifyListeners();
    //     return;
    //   }
  //   }

     notifyListeners();
  }

  reset() {
    users.clear();
    userLogged = null;
    wallet_uuid = '';
    // userWallet = null;
    offlineData.clear();
    filteredData.clear();
  }

  logOut() {
    prefs?.clear();
    // key = ValueKey(DateTime.now().toString());
    notifyListeners();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // AppProviders.analyseToolsProvider.reset();
      // AppProviders.analysesProvider.reset;
      // AppProviders.usersProvider.reset();
      // AppProviders.sampleProvider.reset();
      // AppProviders.paymentProvider.reset();
      // AppProviders.transferProvider.reset();
      // AppProviders.storesProvider.reset();
      // AppProviders.walletProvider.reset();
      // AppProviders.partnerProvider.reset();
      // AppProviders.storesProvider.reset();
      // AppProviders.usersProvider.reset();
      // AppProviders.menuProvider.reset();
      AppProviders.appProvider.reset();
      // navKey.currentContext!.read<TransactionProvider>().reset();
      // navKey.currentContext!.read<SellProductProvider>().reset();
      LocalDataHelper.resetLocalData();
      // Navigation.pushRemove(page: const LoginPage());
      // Navigator.pushReplacement(navKey.currentContext!, MaterialPageRoute(builder: (_) => LoginPage()));
    });
    // Navigation.pushRemove(page: const LoginPage());
  }

  List<UserModel> dataToSync = [];
  syncOfflineData() async {
    if (dataToSync.isEmpty) return;
    Response response = await AppProviders.appProvider.httpPost(
        url: "${BaseUrl.user}sync",
        body: {"data": dataToSync.map((e) => e.toJSON()).toList()});
    // print(response.body);
    if (response.statusCode == 200) {
      ToastNotification.showToast(
          msg: "Synchronisation des données terminés",
          msgType: MessageType.info,
          title: "Information");
      LocalDataHelper.clearLocalData(key: keyName);
      getOnline(isRefresh: true);
      return;
    }
    ToastNotification.showToast(
        msg: jsonDecode(response.body)['message'] ??
            "Une erreur est survenue lors de la synchronisation des données",
        msgType: MessageType.error,
        title: "Erreur");
  }

  List<UserModel> getDataToSync() {
    getOffline(isRefresh: true);
    dataToSync =
        offlineData.where((element) => element.syncStatus == 0).toList();
    // print(offlineData.map((e) => e.toJSON()).toList());
    return dataToSync;
  }
}
