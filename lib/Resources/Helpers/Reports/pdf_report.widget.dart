import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
// import 'package:universal_html/html.dart' as webFile;
// ignore: avoid_web_libraries_in_flutter
import 'package:universal_html/html.dart' as webFile;

import '../uuid_generator.dart';
import './block.model.dart';

class TicketPrintModel {
  String title;
  String? listTitle, blockContentTitle;
  List data;
  List fields;
  BlockModel? header;
  List<BlockModel> blocks, footer;
  List<List<BlockModel>>? contentBlocks;
  TicketPrintModel(
      {required this.title,
      this.listTitle,
      this.blockContentTitle,
      required this.data,
      required this.fields,
      this.blocks = const [],
      this.footer = const [],
      this.contentBlocks = const [],
      this.header});
}

pw.Widget? image;
renderImage({required String path}) async {
  image = pw.Image(
      pw.MemoryImage(
        (await rootBundle.load(path)).buffer.asUint8List(),
      ),
      width: 100);
}

buildReport(
    {required List<TicketPrintModel> datas,
    required String orientation}) async {
  await renderImage(path: 'Assets/img/logo.png');
  // if (data.isEmpty) {
  //   ToastNotification.showToast(
  //       msgType: MessageType.error,
  //       title: "Error",
  //       msg: "Impossible de produire le rapport, la liste est vide");
  //   return;
  // }
  final pw.Document pdf = pw.Document();

  for (var i = 0; i < datas.length; i++) {
    pdf.addPage(pw.MultiPage(
        orientation: orientation.toLowerCase().contains('land')
            ? pw.PageOrientation.landscape
            : pw.PageOrientation.portrait,
        pageFormat: PdfPageFormat.a4.copyWith(
            marginBottom: 0.5 * PdfPageFormat.cm,
            marginLeft: 0.5 * PdfPageFormat.cm,
            marginRight: 0.5 * PdfPageFormat.cm),
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        header: (pw.Context context) {
          return pw.Container(
              alignment: pw.Alignment.centerRight,
              margin: const pw.EdgeInsets.only(bottom: 1.0 * PdfPageFormat.mm),
              padding: const pw.EdgeInsets.only(bottom: 1.0 * PdfPageFormat.mm),
              decoration: const pw.BoxDecoration(),
              child: pw.Row(children: [
                pw.Container(width: 100, child: image ?? pw.Container()),
                pw.Expanded(
                    child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.end,
                        mainAxisAlignment: pw.MainAxisAlignment.end,
                        children: [
                      pw.Text('BUSYBEE Congo',
                          style: textStyle(
                              fontSize: 16,
                              weight: pw.FontWeight.bold,
                              color: PdfColors.black)),
                      pw.Text('RCCM:7388327',
                          style: textStyle(
                              fontSize: 12,
                              weight: pw.FontWeight.normal,
                              color: PdfColors.grey))
                    ])),
                // pw.Text('Billet electronique',
                //     style: textStyle(
                //         fontSize: 18,
                //         weight: pw.FontWeight.bold,
                //         color: PdfColors.black))
              ]));
        },
        footer: (pw.Context context) {
          return pw.Container(
              alignment: pw.Alignment.centerRight,
              margin: const pw.EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
              child: pw.Text(
                'Billet ${context.pageNumber} of ${context.pagesCount}',
              ));
        },
        build: (pw.Context context) => <pw.Widget>[
              pw.Header(
                  level: 0,
                  child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: <pw.Widget>[
                        // pw.Text(datas[i].title, textScaleFactor: 2),
                        // pw.PdfLogo()
                      ])),
              // pw.Header(level: 1, text: title),
              // pw.Padding(padding: const pw.EdgeInsets.all(10)),
              pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Column(children: [
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            textHorizontal(
                              title: 'PNR',
                              value: uuidGenerator(),
                            ),
                            pw.BarcodeWidget(
                              height: 60,
                              width: 60,
                              color: PdfColor.fromHex("#000000"),
                              barcode: pw.Barcode.qrCode(),
                              data: datas[i].header?.data['number'] ?? '',
                            )
                          ]),
                      pw.SizedBox(height: 16),
                      pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text("YOUR BOOKING REFERENCE",
                                style: textStyle(
                                    fontSize: 10,
                                    weight: pw.FontWeight.normal,
                                    color: PdfColors.black)),
                            pw.Text(datas[i].header?.data['ref'].toUpperCase(),
                                style: textStyle(
                                    fontSize: 10,
                                    weight: pw.FontWeight.bold,
                                    color: PdfColors.black)),
                            pw.SizedBox(height: 16),
                            pw.Row(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                children: [
                                  pw.Column(
                                      mainAxisSize: pw.MainAxisSize.min,
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text("PASSENGER",
                                            style: textStyle(
                                                fontSize: 10,
                                                weight: pw.FontWeight.normal,
                                                color: PdfColors.black)),
                                        pw.Text(
                                            "${datas[i].header?.data['client']?.toUpperCase() ?? ''} (${datas[i].header?.data['category']?.toUpperCase() ?? ''})",
                                            style: textStyle(
                                                fontSize: 10,
                                                weight: pw.FontWeight.bold,
                                                color: PdfColors.black)),
                                      ]),
                                  pw.SizedBox(width: 16),
                                  pw.Column(
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text("TICKET NUMBER",
                                            style: textStyle(
                                                fontSize: 8,
                                                weight: pw.FontWeight.normal,
                                                color: PdfColors.black)),
                                        pw.Text(
                                            datas[i].header?.data['number'] ??
                                                '',
                                            style: textStyle(
                                                fontSize: 8,
                                                weight: pw.FontWeight.bold,
                                                color: PdfColors.black)),
                                      ])
                                ]),
                          ])

                      // pw.Icon()
                    ]),
                    pw.SizedBox(height: 16),
                  ]),
              // pw.Divider(color: PdfColors.black, thickness: 1),
              if (datas[i].blockContentTitle != null &&
                  datas[i].blockContentTitle != '' &&
                  datas[i].contentBlocks != null &&
                  datas[i].contentBlocks != null &&
                  datas[i].contentBlocks!.isNotEmpty)
                pw.Container(
                    width: double.maxFinite,
                    padding: const pw.EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    decoration:
                        const pw.BoxDecoration(color: PdfColors.grey300),
                    child: pw.Text(
                        datas[i].blockContentTitle?.toUpperCase() ?? '',
                        style: textStyle(
                            fontSize: 12,
                            weight: pw.FontWeight.bold,
                            color: PdfColors.black))),

              pw.SizedBox(height: 16),
              if (datas[i].listTitle != null && datas[i].listTitle != '')
                pw.Container(
                    width: double.maxFinite,
                    padding: const pw.EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    decoration:
                        const pw.BoxDecoration(color: PdfColors.grey300),
                    child: pw.Text(datas[i].listTitle?.toUpperCase() ?? '',
                        style: textStyle(
                            fontSize: 10,
                            weight: pw.FontWeight.bold,
                            color: PdfColors.black))),
              pw.SizedBox(height: 8),
              pw.Table.fromTextArray(
                  cellAlignment: pw.Alignment.centerLeft,
                  rowDecoration: const pw.BoxDecoration(color: PdfColors.white),
                  border: pw.TableBorder.all(color: PdfColors.grey200),
                  oddRowDecoration:
                      pw.BoxDecoration(color: PdfColors.blue100.shade(0.4)),
                  context: context,
                  cellStyle: textStyle(
                      fontSize: 7,
                      weight: pw.FontWeight.normal,
                      color: PdfColors.black),
                  oddCellStyle: textStyle(
                      fontSize: 7,
                      weight: pw.FontWeight.normal,
                      color: PdfColors.black),
                  headerStyle: textStyle(
                      fontSize: 6,
                      weight: pw.FontWeight.bold,
                      color: PdfColors.black),
                  // headers
                  data: <List<String>>[
                    List.generate(
                        datas[i].fields.length,
                        (index) => datas[i]
                            .fields[index]
                            .toString()
                            .toUpperCase()
                            .replaceAll('_', ' ')),
                    ...datas[i].data.map((e) {
                      // print(e);
                      return List.generate(
                          datas[i].fields.length,
                          (indexCol) =>
                              e[datas[i].fields[indexCol]]?.toString() ?? '');
                    })
                  ]),
              pw.SizedBox(height: 16),
              ...List.generate(datas[i].blocks.length, (index) {
                BlockModel currentBlock = datas[i].blocks[index];
                return pw.Column(children: [
                  pw.Container(
                      width: double.maxFinite,
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration:
                          const pw.BoxDecoration(color: PdfColors.grey300),
                      child: pw.Text(currentBlock.title.toUpperCase(),
                          style: textStyle(
                              fontSize: 10,
                              weight: pw.FontWeight.bold,
                              color: PdfColors.black))),
                  pw.SizedBox(height: 8),
                  pw.Table.fromTextArray(
                      cellAlignment: pw.Alignment.centerLeft,
                      rowDecoration:
                          const pw.BoxDecoration(color: PdfColors.white),
                      border: pw.TableBorder.all(color: PdfColors.grey200),
                      oddRowDecoration:
                          pw.BoxDecoration(color: PdfColors.blue100.shade(0.4)),
                      context: context,
                      cellStyle: textStyle(
                          fontSize: 7,
                          weight: pw.FontWeight.normal,
                          color: PdfColors.black),
                      oddCellStyle: textStyle(
                          fontSize: 7,
                          weight: pw.FontWeight.normal,
                          color: PdfColors.black),
                      headerStyle: textStyle(
                          fontSize: 6,
                          weight: pw.FontWeight.bold,
                          color: PdfColors.black),
                      // headers
                      data: <List<String>>[
                        List.generate(
                            currentBlock.fields.length,
                            (fieldIndex) => currentBlock.fields[fieldIndex]
                                .toString()
                                .toUpperCase()
                                .replaceAll('_', ' ')),
                        ...[
                          List.generate(
                              currentBlock.fields.length,
                              (indexCol) =>
                                  currentBlock
                                      .data[currentBlock.fields[indexCol]]
                                      ?.toString() ??
                                  '')
                        ]
                      ]),
                  pw.SizedBox(height: 24),
                ]);
              }),
              pw.SizedBox(height: 16),
              ...List.generate(datas[i].footer.length, (index) {
                BlockModel currentBlock = datas[i].footer[index];
                return pw.Column(children: [
                  pw.Container(
                      width: double.maxFinite,
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration:
                          const pw.BoxDecoration(color: PdfColors.grey300),
                      child: pw.Text(currentBlock.title.toUpperCase(),
                          style: textStyle(
                              fontSize: 10,
                              weight: pw.FontWeight.bold,
                              color: PdfColors.black))),
                  pw.SizedBox(height: 8),
                  pw.Flex(
                      direction: currentBlock.type == 'row'
                          ? pw.Axis.horizontal
                          : pw.Axis.vertical,
                      children: [
                        ...List.generate(currentBlock.fields.length, (index) {
                          // print(currentBlock.data[currentBlock.fields[index]]);
                          return pw.Flex(
                              direction: currentBlock.type == 'row'
                                  ? pw.Axis.vertical
                                  : pw.Axis.horizontal,
                              children: [
                                pw.Text(
                                    currentBlock.fields[index]
                                        .toUpperCase()
                                        .replaceAll('_', ' '),
                                    style: textStyle(
                                        fontSize: 10,
                                        weight: pw.FontWeight.normal,
                                        color: PdfColors.black)),
                                pw.SizedBox(width: 16, height: 16),
                                pw.Text(
                                    currentBlock
                                        .data[currentBlock.fields[index]]
                                        .toUpperCase(),
                                    style: textStyle(
                                        fontSize: 10,
                                        weight: pw.FontWeight.bold,
                                        color: PdfColors.black))
                              ]);
                        })
                      ]),
                  pw.SizedBox(height: 24),
                ]);
              }),
            ]));
  }

  if (kIsWeb) {
    webFile.AnchorElement(
        href:
            "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(await pdf.save())}")
      ..setAttribute("download", "Billet${DateTime.now().toString()}.pdf")
      ..click();
  } else {
    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = "$dir/Billet${DateTime.now().toString()}.pdf";
    final File file = File(path);

    await file.writeAsBytes(await pdf.save());
    OpenFilex.open(path);
  }
}

textStyle(
    {required double fontSize,
    required pw.FontWeight weight,
    required PdfColor color}) {
  return pw.TextStyle(fontSize: fontSize, fontWeight: weight, color: color);
}

textHorizontal(
    {required String title,
    required String value,
    double? fontSize = 12,
    PdfColor? textColor = PdfColors.black}) {
  return pw.Row(
      mainAxisSize: pw.MainAxisSize.min,
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(title,
            style: textStyle(
                fontSize: fontSize!,
                weight: pw.FontWeight.bold,
                color: textColor!)),
        pw.SizedBox(width: 16),
        pw.Text(value,
            style: textStyle(
                fontSize: fontSize,
                weight: pw.FontWeight.bold,
                color: textColor)),
      ]);
}
