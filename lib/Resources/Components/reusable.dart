import 'package:flutter/material.dart';

import '../../Resources/Components/button.dart';
import '../../Resources/Components/texts.dart';
import '../../Resources/Constants/global_variables.dart';
import '../../Resources/Constants/responsive.dart';
import '../../main.dart';

class PageListTitleWidget extends StatelessWidget {
  final Function addCallback, refreshCallback;
  final String title;
  final String description;
  String? buttonText;
  PageListTitleWidget(
      {super.key,
      required this.addCallback,
      required this.refreshCallback,
      required this.title,
      required this.description,
      buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(8),
      child: Flex(
          mainAxisSize: Responsive.isMobile(navKey.currentContext!)
              ? MainAxisSize.min
              : MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Responsive.isWeb(navKey.currentContext!)
              ? Axis.horizontal
              : Axis.vertical,
          children: [
            Flexible(
                fit: FlexFit.loose,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidgets.textBold(
                          title: title,
                          fontSize: 18,
                          textColor: AppColors.kPrimaryColor),
                      TextWidgets.text300(
                          title: description,
                          fontSize: 12,
                          textColor: AppColors.kPrimaryColor),
                    ])),
            Flexible(
              fit: FlexFit.loose,
              child: Row(
                mainAxisSize: Responsive.isMobile(navKey.currentContext!)
                    ? MainAxisSize.max
                    : MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                      text: buttonText ?? "Ajouter",
                      backColor: AppColors.kPrimaryColor,
                      textColor: AppColors.kScaffoldColor,
                      callback: () async {
                        addCallback();
                        // Dialogs.showModal(child: AddStorePage());
                      }),
                  IconButton(
                      onPressed: () {
                        refreshCallback();
                        // context.read<StoresProvider>().get(isRefresh: true);
                      },
                      icon: Icon(Icons.autorenew, color: AppColors.kBlackColor))
                ],
              ),
            )
          ]),
    );
  }
}

filterButton(
    {required String title,
    required bool isActive,
    Color? backColor,
    FlexFit? flexFit = FlexFit.tight,
    required var callback}) {
  backColor ??= AppColors.kScaffoldColor;
  return Flexible(
    fit: flexFit!,
    child: GestureDetector(
      onTap: callback,
      child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          color: isActive ? AppColors.kPrimaryColor : backColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            // borderRadius: BorderRadius.only(
            //     bottomLeft: Radius.circular(16), topRight: Radius.circular(16)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: TextWidgets.textNormal(
                title: title,
                fontSize: 16,
                textColor:
                    isActive ? AppColors.kWhiteColor : AppColors.kBlackColor),
          )),
    ),
  );
}

class TabFilterWidget extends StatefulWidget {
  Function callback;
  final List<String> titles;
  Color? backColor;
  int? indexSelected;
  FlexFit? flexFit;
  TabFilterWidget(
      {super.key,
      required this.callback,
      required this.titles,
      this.indexSelected = 0,
      this.flexFit = FlexFit.tight,
      this.backColor = Colors.white});

  @override
  State<TabFilterWidget> createState() => _TabFilterWidgetState();
}

class _TabFilterWidgetState extends State<TabFilterWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      currentFilter = widget.titles[widget.indexSelected!];
      widget.callback(currentFilter);
    });
  }

  String currentFilter = "";
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Card(
        margin: const EdgeInsets.all(0),
        color: widget.backColor,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)
            // borderRadius: BorderRadius.only(
            //     bottomLeft: Radius.circular(16), topRight: Radius.circular(16)),
            ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(widget.titles.length, (index) {
                return filterButton(
                    flexFit: FlexFit.loose,
                    backColor: widget.backColor,
                    title: widget.titles[index],
                    isActive: currentFilter == widget.titles[index],
                    callback: () {
                      setState(() {
                        currentFilter = widget.titles[index];
                        widget.callback(currentFilter);
                      });
                    });
              })),
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String title, price, quantity;
  final String? status;

  const ProductItem(
      {super.key,
      required this.title,
      required this.price,
      required this.quantity,
      this.status = ""});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.kWhiteColor,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Stack(children: [
        SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.kTransparentColor)),
              child: Image.asset(
                "Assets/Images/noimage.png",
                fit: BoxFit.cover,
              ),
            )),
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.kPrimaryColor.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8))),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextWidgets.textBold(
                        title: title,
                        fontSize: 12,
                        textColor: AppColors.kWhiteColor),
                    const SizedBox(height: 4),
                    Row(children: [
                      // TextWidgets.textBold(
                      //     title: "$price\$",
                      //     fontSize: 14,
                      //     textColor: AppColors.kWhiteColor),
                      Expanded(child: Container()),
                      if (status != null && status != '')
                        TextWidgets.text300(
                            title: status!,
                            fontSize: 10,
                            textColor: AppColors.kWhiteColor),
                    ])
                  ],
                ),
              ),
            )),
        Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                  color: AppColors.kPrimaryColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8)),
              child: TextWidgets.textNormal(
                  title: "${quantity}g",
                  fontSize: 10,
                  textColor: AppColors.kWhiteColor),
            ))
      ]),
    );
  }
}

progressWidget(
    {required String title,
    required double max,
    required double value,
    required Color color}) {
  return Padding(
    padding: const EdgeInsets.all(2.0),
    child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      // TextWidgets.text300(
      //     title: title, fontSize: 12, textColor: AppColors.kBlackColor),
      // const SizedBox(height: 8),
      LayoutBuilder(builder: (context, constraints) {
        // print(constraints.maxWidth)
        double percent = 0;
        if (max > 0) {
          percent = (value * 100) / max;
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: constraints.maxWidth,
              height: 10,
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: (constraints.maxWidth) * (percent / 100),
                  height: 10,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ),
          ],
        );
      })
    ]),
  );
}
