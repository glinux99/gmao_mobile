import 'package:flutter/material.dart';

import '../Constants/navigators.dart';
import './button.dart';
import './texts.dart';
import '../../Resources/Constants/enums.dart';
import '../../Resources/Constants/global_variables.dart';
import '../../Resources/Constants/responsive.dart';
import '../../main.dart';

class Dialogs {
  static showDialogNoAction(
      {BuildContext? context,
      MessageType? dialogType = MessageType.warning,
      required String title,
      required String content,
      double heightFactor = 2}) {
    return showDialog(
        context: navKey.currentContext!,
        builder: (BuildContext context) => Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.all(0),
                // height: MediaQuery.of(context).size.height /
                //     (heightFactor == 2 ? 2 : heightFactor),
                width: Responsive.isMobile(context)
                    ? MediaQuery.of(context).size.width
                    : MediaQuery.of(context).size.width / 2.5,
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(
                          left: 16.0,
                          top: 20.0 + 16.0,
                          right: 16.0,
                          bottom: 16.0),
                      margin: const EdgeInsets.only(top: 50.0, bottom: 50),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppColors.kWhiteColor,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black,
                                offset: Offset(0, 1),
                                blurRadius: 5),
                          ]),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(height: 20),
                          TextWidgets.textBold(
                              align: TextAlign.center,
                              title: title,
                              fontSize: 18,
                              textColor: AppColors.kBlackColor),
                          const SizedBox(
                            height: 15,
                          ),
                          SingleChildScrollView(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [Container(width: double.maxFinite)],
                              ),
                              TextWidgets.text300(
                                  title: content,
                                  fontSize: 14,
                                  textColor: AppColors.kBlackColor),
                            ],
                          )),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                    callback: () async {
                                      Navigator.pop(navKey.currentContext!);
                                    },
                                    text: "Fermer",
                                    backColor: dialogType == MessageType.error
                                        ? AppColors.kRedColor
                                        : dialogType == MessageType.success
                                            ? AppColors.kGreenColor
                                            : AppColors.kPrimaryColor,
                                    textColor: AppColors.kBlackColor),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      left: 50,
                      right: 50,
                      top: 0,
                      child: Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: AppColors.kWhiteColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          alignment: Alignment.bottomCenter,
                          child: Icon(
                            dialogType == MessageType.error
                                ? Icons.cancel
                                : dialogType == MessageType.success
                                    ? Icons.check_circle
                                    : Icons.warning_amber_rounded,
                            color: dialogType == MessageType.error
                                ? AppColors.kRedColor
                                : dialogType == MessageType.success
                                    ? AppColors.kGreenColor
                                    : AppColors.kPrimaryColor,
                            size: 80,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

  static showDialogWithAction(
      {BuildContext? context,
      MessageType? dialogType = MessageType.warning,
      required String title,
      required String content,
      double heightFactor = 2,
      var callback}) {
    return showDialog(
        context: navKey.currentContext!,
        builder: (BuildContext context) => Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.all(0),
                // height: MediaQuery.of(context).size.height /
                //     (heightFactor == 2 ? 2 : heightFactor),
                width: Responsive.isMobile(context)
                    ? MediaQuery.of(context).size.width
                    : MediaQuery.of(context).size.width / 2.5,
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(
                          left: 16.0,
                          top: 20.0 + 16.0,
                          right: 16.0,
                          bottom: 16.0),
                      margin: const EdgeInsets.only(top: 50.0, bottom: 50),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppColors.kWhiteColor,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black,
                                offset: Offset(0, 1),
                                blurRadius: 5),
                          ]),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(height: 20),
                          TextWidgets.textBold(
                              align: TextAlign.center,
                              title: title,
                              fontSize: 18,
                              textColor: AppColors.kBlackColor),
                          const SizedBox(
                            height: 15,
                          ),
                          SingleChildScrollView(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [Container(width: double.maxFinite)],
                              ),
                              TextWidgets.text300(
                                  title: content,
                                  align: TextAlign.center,
                                  fontSize: 14,
                                  textColor: AppColors.kBlackColor),
                            ],
                          )),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                    callback: () async {
                                      Navigator.pop(context);
                                    },
                                    text: "Fermer",
                                    backColor: Colors.grey[200]!,
                                    textColor: AppColors.kBlackColor),
                              ),
                              const SizedBox(height: 20),
                              Expanded(
                                child: CustomButton(
                                    callback: () async {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop();
                                      await callback();
                                    },
                                    text: "Confirmer",
                                    backColor: dialogType == MessageType.error
                                        ? AppColors.kRedColor
                                        : dialogType == MessageType.success
                                            ? AppColors.kGreenColor
                                            : AppColors.kPrimaryColor,
                                    textColor: AppColors.kWhiteColor),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      left: 50,
                      right: 50,
                      top: 0,
                      child: Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: AppColors.kWhiteColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          alignment: Alignment.bottomCenter,
                          child: Icon(
                            dialogType == MessageType.error
                                ? Icons.cancel
                                : dialogType == MessageType.success
                                    ? Icons.check_circle
                                    : Icons.warning_amber_rounded,
                            color: dialogType == MessageType.error
                                ? AppColors.kRedColor
                                : dialogType == MessageType.success
                                    ? AppColors.kGreenColor
                                    : AppColors.kPrimaryColor,
                            size: 80,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

  static showDialogWithActionCustomContent(
      {BuildContext? context,
      MessageType? dialogType = MessageType.warning,
      required String title,
      required Widget content,
      double heightFactor = 2,
      var callback}) {
    return showDialog(
        context: navKey.currentContext!,
        builder: (BuildContext context) => Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.all(0),
                // height: MediaQuery.of(context).size.height /
                //     (heightFactor == 2 ? 2 : heightFactor),
                width: Responsive.isMobile(context)
                    ? MediaQuery.of(context).size.width
                    : MediaQuery.of(context).size.width / 2.5,
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(
                          left: 16.0,
                          top: 20.0 + 16.0,
                          right: 16.0,
                          bottom: 16.0),
                      margin: const EdgeInsets.only(top: 50.0, bottom: 50),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppColors.kWhiteColor,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black,
                                offset: Offset(0, 1),
                                blurRadius: 5),
                          ]),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(height: 20),
                          TextWidgets.textBold(
                              align: TextAlign.center,
                              title: title,
                              fontSize: 18,
                              textColor: AppColors.kBlackColor),
                          const SizedBox(
                            height: 15,
                          ),
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [const Row(), content],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                    callback: () async {
                                      Navigator.pop(context);
                                    },
                                    text: "Fermer",
                                    backColor: Colors.grey[200]!,
                                    textColor: AppColors.kBlackColor),
                              ),
                              const SizedBox(height: 20),
                              Expanded(
                                child: CustomButton(
                                    callback: () async {
                                      await callback();
                                      Navigator.pop(context);
                                    },
                                    text: "Confirmer",
                                    backColor: dialogType == MessageType.error
                                        ? AppColors.kRedColor
                                        : dialogType == MessageType.success
                                            ? AppColors.kGreenColor
                                            : dialogType == MessageType.info
                                                ? Colors.blue
                                                : AppColors.kPrimaryColor,
                                    textColor: AppColors.kWhiteColor),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      left: 50,
                      right: 50,
                      top: 0,
                      child: Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: AppColors.kWhiteColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          alignment: Alignment.bottomCenter,
                          child: Icon(
                            dialogType == MessageType.error
                                ? Icons.cancel
                                : dialogType == MessageType.success
                                    ? Icons.check_circle
                                    : dialogType == MessageType.info
                                        ? Icons.info
                                        : Icons.warning_amber_rounded,
                            color: dialogType == MessageType.error
                                ? AppColors.kRedColor
                                : dialogType == MessageType.success
                                    ? AppColors.kGreenColor
                                    : dialogType == MessageType.info
                                        ? Colors.blue
                                        : AppColors.kPrimaryColor,
                            size: 80,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

  static showChoiceDialog(
      {BuildContext? context,
      MessageType? dialogType = MessageType.warning,
      required String title,
      required Widget content,
      double heightFactor = 2,
      var callback}) {
    return showDialog(
        context: context ?? navKey.currentContext!,
        // barrierDismissible: true,
        builder: (BuildContext context) => Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.all(0),
                // height: MediaQuery.of(context).size.height /
                //     (heightFactor == 2 ? 2 : heightFactor),
                width: Responsive.isMobile(context)
                    ? MediaQuery.of(context).size.width
                    : MediaQuery.of(context).size.width / 2.5,
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(8),
                      // margin: const EdgeInsets.only(top: 8.0, bottom: 50),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppColors.kWhiteColor,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black,
                                offset: Offset(0, 1),
                                blurRadius: 5),
                          ]),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextWidgets.textBold(
                              align: TextAlign.center,
                              title: title,
                              fontSize: 14,
                              textColor: AppColors.kBlackColor),
                          const SizedBox(
                            height: 15,
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [const Row(), content],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

  static showBottomModalSheet(
      {BuildContext? context, required Widget content}) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: AppColors.kTransparentColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
        context: navKey.currentContext!,
        builder: (builder) {
          return FractionallySizedBox(
              widthFactor:
                  Responsive.isMobile(navKey.currentContext!) ? 1 : 0.5,
              child: Container(
                padding: const EdgeInsets.only(bottom: 16),
                constraints: BoxConstraints(
                  minHeight: 10,
                  maxHeight:
                      MediaQuery.of(navKey.currentContext!).size.height / 1.7,
                ),
                decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(16)),
                    color: AppColors.kWhiteColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        width: 50,
                        height: 5,
                        decoration: BoxDecoration(
                            color: AppColors.kPrimaryColor,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: content,
                    )
                  ],
                ),
              ));
        });
  }

  // static showDialogWithActionCustomContent(
  //     {required BuildContext context,
  //     required String title,
  //     required Widget content,
  //     required Function callback()}) {
  //   return showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       child: Dialog(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(16.0),
  //         ),
  //         elevation: 0,
  //         backgroundColor: Colors.transparent,
  //         child: Center(
  //           child: Container(
  //             height: MediaQuery.of(context).size.height / 2,
  //             child: Stack(
  //               children: <Widget>[
  //                 Container(
  //                   padding: EdgeInsets.only(
  //                       left: 16.0,
  //                       top: 20.0 + 16.0,
  //                       right: 16.0,
  //                       bottom: 16.0),
  //                   margin: EdgeInsets.only(top: 50.0, bottom: 50),
  //                   decoration: BoxDecoration(
  //                       shape: BoxShape.rectangle,
  //                       color: MyColors.whiteColor,
  //                       borderRadius: BorderRadius.circular(16.0),
  //                       boxShadow: [
  //                         BoxShadow(
  //                             color: Colors.black,
  //                             offset: Offset(0, 1),
  //                             blurRadius: 5),
  //                       ]),
  //                   child: Column(
  //                     children: <Widget>[
  //                       SizedBox(height: 20),
  //                       TextWidgets.textBoldCenter(
  //                           text: title,
  //                           size: 18,
  //                           textColor: MyColors.blackColor),
  //                       SizedBox(height: 10),
  //                       Expanded(
  //                           child: Center(
  //                         child: SingleChildScrollView(
  //                           child: Column(
  //                             children: [
  //                               Row(
  //                                 children: [
  //                                   Container(width: double.maxFinite)
  //                                 ],
  //                               ),
  //                               content
  //                             ],
  //                           ),
  //                         ),
  //                       )),
  //                       Row(
  //                         children: [
  //                           Expanded(
  //                             child: MyWidgets.buttonForm(
  //                                 callBack: () async {
  //                                   Navigator.pop(context);
  //                                 },
  //                                 title: "Annuler",
  //                                 backColor: Colors.grey[200],
  //                                 textColor: MyColors.blackColor),
  //                           ),
  //                           SizedBox(width: 20),
  //                           Expanded(
  //                             child: MyWidgets.buttonForm(
  //                                 callBack: () async {
  //                                   callback();
  //                                 },
  //                                 title: "Continuer",
  //                                 backColor: MyColors.appColor,
  //                                 textColor: MyColors.whiteColor),
  //                           ),
  //                         ],
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //                 Positioned(
  //                   left: 50,
  //                   right: 50,
  //                   top: 0,
  //                   child: Center(
  //                     child: Container(
  //                       width: 100,
  //                       height: 100,
  //                       padding: EdgeInsets.all(10.0),
  //                       decoration: BoxDecoration(
  //                         shape: BoxShape.rectangle,
  //                         color: MyColors.whiteColor,
  //                         borderRadius: BorderRadius.circular(100),
  //                       ),
  //                       alignment: Alignment.bottomCenter,
  //                       child: appLogo(width: 80, height: 80, isBlack: false),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ));
  // }

  static showModal({required Widget child}) {
    Widget page = Scaffold(
        backgroundColor: AppColors.kScaffoldColor,
        appBar: AppBar(),
        body: child);
    if (Responsive.isWeb(navKey.currentContext!)) {
      showDialog(
          barrierColor: AppColors.kBlackColor.withOpacity(0.05),
          // useRootNavigator: true,
          useSafeArea: true,
          context: navKey.currentContext!,
          builder: (context) => AlertDialog(
                contentPadding: const EdgeInsets.all(0),
                backgroundColor: AppColors.kScaffoldColor,
                content: Container(
                    constraints: BoxConstraints(
                        minHeight: 200,
                        maxHeight:
                            MediaQuery.of(navKey.currentContext!).size.height -
                                40),
                    width: Responsive.isMobile(context)
                        ? MediaQuery.of(navKey.currentContext!).size.width - 40
                        : MediaQuery.of(navKey.currentContext!).size.width /
                            1.9,
                    child: ListView(
                        shrinkWrap: true,
                        controller: ScrollController(),
                        children: [child])),
              ));
    } else {
      Navigation.pushNavigate(page: page, isFullDialog: true);
    }
  }

  // static showConfirmationDialog({required InvoiceModel data}) {
  //   return showDialog(
  //       context: navKey.currentContext!,
  //       builder: (BuildContext context) => Dialog(
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(16.0),
  //             ),
  //             elevation: 0,
  //             backgroundColor: Colors.transparent,
  //             child: Container(
  //               padding: const EdgeInsets.all(0),
  //               decoration: BoxDecoration(
  //                 shape: BoxShape.rectangle,
  //                 color: AppColors.kWhiteColor,
  //                 borderRadius: BorderRadius.circular(16.0),
  //               ),
  //               // height: MediaQuery.of(context).size.height /
  //               //     (heightFactor == 2 ? 2 : heightFactor),
  //               width: Responsive.isMobile(context)
  //                   ? MediaQuery.of(context).size.width - 16
  //                   : MediaQuery.of(context).size.width / 2.5,
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   Stack(
  //                     children: <Widget>[
  //                       Container(
  //                         padding: const EdgeInsets.only(
  //                             left: 16.0,
  //                             top: 20.0 + 16.0,
  //                             right: 16.0,
  //                             bottom: 16.0),
  //                         margin: const EdgeInsets.only(top: 0.0, bottom: 16),
  //                         decoration: BoxDecoration(
  //                           shape: BoxShape.rectangle,
  //                           color: AppColors.kPrimaryColor,
  //                           borderRadius: const BorderRadius.vertical(
  //                               top: Radius.circular(16)),
  //                         ),
  //                         child: Column(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           mainAxisSize: MainAxisSize.min,
  //                           children: <Widget>[
  //                             Row(
  //                               mainAxisAlignment:
  //                                   MainAxisAlignment.spaceBetween,
  //                               children: [
  //                                 Card(
  //                                   margin: const EdgeInsets.all(0),
  //                                   elevation: 0,
  //                                   child: Padding(
  //                                     padding: const EdgeInsets.all(4),
  //                                     child: TextWidgets.textBold(
  //                                         title: 'Reflet Duka',
  //                                         fontSize: 22,
  //                                         textColor: AppColors.kPrimaryColor),
  //                                   ),
  //                                 ),
  //                                 TextWidgets.text300(
  //                                     title: parseDate(
  //                                             date: data.createdAt ??
  //                                                 DateTime.now().toString())
  //                                         .substring(0, 10),
  //                                     fontSize: 14,
  //                                     textColor: AppColors.kWhiteColor),
  //                               ],
  //                             ),
  //                             const SizedBox(
  //                               height: 16,
  //                             ),
  //                             RichText(
  //                                 text: TextSpan(children: [
  //                               TextSpan(
  //                                 text: 'Bonjour, ',
  //                                 style: TextStyle(
  //                                     color: AppColors.kWhiteColor,
  //                                     fontSize: 14,
  //                                     fontWeight: FontWeight.w300),
  //                               ),
  //                               TextSpan(
  //                                 text: data.clientData?.nomClient ?? '',
  //                                 style: TextStyle(
  //                                     color: AppColors.kWhiteColor,
  //                                     fontSize: 14,
  //                                     fontWeight: FontWeight.bold),
  //                               ),
  //                             ])),
  //                             const SizedBox(
  //                               height: 8,
  //                             ),
  //                             TextWidgets.text300(
  //                                 title: 'Merci pour votre commande',
  //                                 fontSize: 14,
  //                                 textColor: AppColors.kWhiteColor),
  //                             const SizedBox(
  //                               height: 16,
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                       Positioned(
  //                         bottom: 0,
  //                         right: 0,
  //                         child: Container(
  //                           width: 150,
  //                           padding: const EdgeInsets.all(16),
  //                           decoration: BoxDecoration(
  //                             shape: BoxShape.rectangle,
  //                             color: AppColors.kWhiteColor,
  //                             borderRadius: BorderRadius.circular(16.0),
  //                           ),
  //                           child: TextWidgets.textBold(
  //                               title: "USD ${data.total.toStringAsFixed(3)}",
  //                               fontSize: 18,
  //                               textColor: AppColors.kPrimaryColor),
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                   Flexible(
  //                     fit: FlexFit.loose,
  //                     child: Padding(
  //                       padding: const EdgeInsets.all(8.0),
  //                       child: SingleChildScrollView(
  //                         child: Column(
  //                           mainAxisSize: MainAxisSize.min,
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             TextWidgets.text300(
  //                                 title: 'Commande N° ${data.id ?? '--'}',
  //                                 fontSize: 16,
  //                                 textColor: AppColors.kBlackColor),
  //                             Divider(
  //                                 color: AppColors.kBlackColor.withOpacity(0.3),
  //                                 thickness: 1,
  //                                 height: 5),
  //                             ...List.generate(
  //                                 data.pointOfSaleHistories.length,
  //                                 (index) => Column(
  //                                       mainAxisSize: MainAxisSize.min,
  //                                       crossAxisAlignment:
  //                                           CrossAxisAlignment.start,
  //                                       children: [
  //                                         ListTile(
  //                                           contentPadding:
  //                                               const EdgeInsets.all(4),
  //                                           title: TextWidgets.textBold(
  //                                               title: data
  //                                                       .pointOfSaleHistories[
  //                                                           index]
  //                                                       .product
  //                                                       ?.name ??
  //                                                   'Unknown',
  //                                               fontSize: 16,
  //                                               textColor:
  //                                                   AppColors.kBlackColor),
  //                                           subtitle: TextWidgets.text300(
  //                                               title: data
  //                                                   .pointOfSaleHistories[index]
  //                                                   .quantity
  //                                                   .toString(),
  //                                               fontSize: 16,
  //                                               textColor:
  //                                                   AppColors.kBlackColor),
  //                                           trailing: TextWidgets.textBold(
  //                                               title:
  //                                                   "USD ${data.pointOfSaleHistories[index].price.toStringAsFixed(3)}",
  //                                               fontSize: 16,
  //                                               textColor:
  //                                                   AppColors.kBlackColor),
  //                                         ),
  //                                         Divider(
  //                                             color: AppColors.kBlackColor
  //                                                 .withOpacity(0.1),
  //                                             thickness: 1,
  //                                             height: 5)
  //                                       ],
  //                                     ))
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   Container(
  //                     // padding: const EdgeInsets.only(
  //                     //     left: 16.0,
  //                     //     top: 20.0 + 16.0,
  //                     //     right: 16.0,
  //                     //     bottom: 16.0),
  //                     margin: const EdgeInsets.only(top: 0.0, bottom: 0),
  //                     decoration: const BoxDecoration(
  //                       shape: BoxShape.rectangle,
  //                       // color: AppColors.kPrimaryColor,
  //                       borderRadius: BorderRadius.vertical(
  //                           top: Radius.circular(16),
  //                           bottom: Radius.circular(16)),
  //                     ),
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       mainAxisSize: MainAxisSize.min,
  //                       children: <Widget>[
  //                         CustomButton(
  //                             // isBordered: true,
  //                             text: 'Fermer',
  //                             backColor: AppColors.kPrimaryColor,
  //                             textColor: AppColors.kWhiteColor,
  //                             callback: () {
  //                               Navigator.pop(context);
  //                             })
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ));
  // }

  static showFullDialog(
      {required String title, required Widget content}) async {
    var result = await Navigation.pushNavigate(
        page: Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: TextWidgets.textBold(
              title: title, fontSize: 22, textColor: AppColors.kWhiteColor),
        ),
        Expanded(
          child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              elevation: 0,
              color: AppColors.kWhiteColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: content,
              )),
        ),
        const SizedBox(
          height: 16,
        )
      ]),
    ));
    return result;
  }
}
