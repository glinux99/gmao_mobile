// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:reflet_flight/Resources/Constants/app_providers.dart';
// import 'package:reflet_flight/Resources/Constants/enums.dart';
// import 'package:reflet_flight/Resources/Constants/global_variables.dart';
// import 'package:reflet_flight/Resources/Helpers/LocalData/local_data.helper.dart';
// import 'package:reflet_flight/Resources/Helpers/sync_online_local.dart';
// import 'package:reflet_flight/Resources/Models/invoice.model.dart';

// class BillProvider extends ChangeNotifier {
//   String keyName = 'invoices';
//   List<InvoiceDetailModel> products = [];
//   List<InvoiceModel> offlineData = [];
//   InvoiceModel? bill;

//   addProductToBill({required InvoiceDetailModel data}) {
//     if (!products
//         .map((item) => item.service)
//         .contains(data.service.toString())) {
//       // print('product added');
//       products.add(data);
//       notifyListeners();
//     } else {
//       products
//           .where((element) => element.service == data.service)
//           .toList()[0]
//           .quantity += 1;
//       notifyListeners();
//     }
//   }

//   addProductQuantity({required InvoiceDetailModel data}) {
//     products
//         .firstWhere((element) => element.service == data.service)
//         .quantity++;
//     notifyListeners();
//   }

//   setProductQuantity(
//       {required InvoiceDetailModel data, required double quantity}) {
//     products.firstWhere((element) => element.service == data.service).quantity =
//         quantity;
//     notifyListeners();
//   }

//   setProductPrice({required InvoiceDetailModel data, required double price}) {
//     products.firstWhere((element) => element.service == data.service).price =
//         price;
//     notifyListeners();
//   }

//   reduceProductQuantity({required InvoiceDetailModel data}) {
//     if (data.quantity <= 1) return;
//     products
//         .firstWhere((element) => element.service == data.service)
//         .quantity--;
//     notifyListeners();
//   }

//   removeProductToBill({required InvoiceDetailModel data}) {
//     if (products
//         .map((item) => item.service)
//         .contains(data.service.toString())) {
//       products.removeWhere((item) => item.service == data.service);
//       notifyListeners();
//     }
//   }

//   resetBill() {
//     products.clear();
//     notifyListeners();
//   }

//   double getTotal() {
//     double total = 0;
//     for (int i = 0; i < products.length; i++) {
//       total += (products[i].price) * products[i].quantity;
//     }
//     // total = products
//     //     .map((e) => e.product?.unitPrice ?? 0)
//     //     .fold(0, (prev, next) => (prev) + next);
//     return total;
//   }

//   saveData(
//       {required InvoiceModel data,
//       EnumActions? action = EnumActions.SAVE,
//       required Function callback}) async {
//     if (data.pointOfSaleHistories.isEmpty || data.typeFacture.isEmpty) {
//       ToastNotification.showToast(
//           msg: 'Veuillez renseigner toutes les informations',
//           msgType: MessageType.error);
//       return;
//     }
//     // debugPrint(jsonEncode(data.toJSON()));
//     // LocalDataHelper.saveData(key: keyName, value: data.toJSON());
//     // getOffline(isRefresh: true);
//     // resetBill();
//     // if (data.typeFacture.toLowerCase() != 'pending') {
//     //   Dialogs.showConfirmationDialog();
//     // }
//     // return;
//     Response res;
//     InvoiceModel body = data;
//     body.syncStatus = 1;
//     if (action == EnumActions.UPDATE) {
//       // print('updating');
//       res = await AppProviders.appProvider
//           .httpPut(url: "${BaseUrl.invoices}/${data.id}", body: body.toJSON());
//     } else {
//       res = await AppProviders.appProvider
//           .httpPost(url: BaseUrl.invoices, body: body.toJSON());
//     }
//     // print(res.body);
//     if (res.statusCode == 200 || res.statusCode == 201) {
//       InvoiceModel savedData = InvoiceModel.fromJSON(jsonDecode(res.body));
//       savedData.syncStatus = 1;
//       LocalDataHelper.saveData(key: keyName, value: savedData.toJSON());
//       ToastNotification.showToast(
//           msg: jsonDecode(res.body)['message'] ??
//               "Informations sauvegardées avec succès",
//           msgType: MessageType.success,
//           title: "Success");
//       getOffline(isRefresh: true);
//       resetBill();
//       notifyListeners();
//       callback();
//     }
//     if (res.statusCode == 500) {
//       // LocalDataHelper.saveData(key: keyName, value: data.toJSON());
//       ToastNotification.showToast(
//           msg: jsonDecode(res.body)['message'] ??
//               'Une erreur est survenue, sauvegarde hors connexion en cours...',
//           msgType: MessageType.info,
//           title: "Information");
//     }
//     if (res.statusCode > 299 && res.statusCode != 500) {
//       ToastNotification.showToast(
//           msg: jsonDecode(res.body)['message'] ??
//               'Une erreur est survenue, Veuillez réessayer',
//           msgType: MessageType.error,
//           title: "Erreur");
//       return;
//     }
//   }

//   get({bool? isRefresh = false}) {
//     // if (AppProviders.appProvider.isApiReachable) {
//     //   getOnline(isRefresh: isRefresh);
//     // }
//     getOffline(isRefresh: isRefresh);
//   }

//   getOffline({bool? isRefresh = false}) async {
//     // LocalDataHelper.clearLocalData(key: keyName);
//     if (isRefresh == false && offlineData.isNotEmpty) return;
//     List data = await LocalDataHelper.getData(
//       key: keyName,
//     );
//     // print(data);
//     // if ((offlineData.isEmpty || isRefresh == true) && data.isEmpty) {
//     //   getOnline(isRefresh: isRefresh);
//     // }
//     offlineData = List<InvoiceModel>.from(data.map((item) {
//       // print(item);
//       return InvoiceModel.fromJSON(item);
//     }).toList());

//     notifyListeners();
//   }

//   getOnline({bool? isRefresh = false}) async {
//     if (isRefresh == false && offlineData.isNotEmpty) return;
//     var response =
//         await AppProviders.appProvider.httpGet(url: BaseUrl.invoices);
//     List data = [];
//     // print(response.body);
//     if (response.statusCode == 200) {
//       data = jsonDecode(response.body)['hydra:member'];
//     }
//     if (data.isEmpty || response.statusCode != 200) return;
//     List<InvoiceModel> dataList = List<InvoiceModel>.from(
//         data.map((item) => InvoiceModel.fromJSON(item)).toList());
//     SyncOnlineLocalHelper.insertNewDataOffline(
//         onlineData: dataList.map((e) => e.toJSON()).toList(),
//         offlineData: offlineData.map((e) => e.toJSON()).toList(),
//         key: keyName,
//         callback: getOffline);
//     notifyListeners();
//   }
// }
