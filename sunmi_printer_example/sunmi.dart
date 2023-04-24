import 'package:flutter/services.dart';
import 'package:futara/controller/constants/app_images.dart';
import 'package:futara/view/screens/bills/cubit/bills_cubit.dart';
import 'package:intl/intl.dart' as intl;
import 'package:sunmi_printer_plus/column_maker.dart';
import 'package:sunmi_printer_plus/enums.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';
import 'package:sunmi_printer_plus/sunmi_style.dart';

class Sunmi {
  Future<void> initialize() async {
    await SunmiPrinter.bindingPrinter();
    await SunmiPrinter.startTransactionPrint(true);
    await SunmiPrinter.exitTransactionPrint(true);
  }

  Future<void> printReceipt(context) async {
    var billModel = BillsCubit.get(context).singleBillModel;
    await initialize();
    await printImage();
    await printText(billModel!.data![0].company!.name!);
    await printInvoice(context);
    await closePrinter();
  }

  Future<void> printImage() async {
    ByteData fileData = await rootBundle.load(AppImages.logo);
    Uint8List byte = fileData.buffer
        .asUint8List(fileData.offsetInBytes, fileData.lengthInBytes);
    await SunmiPrinter.printImage(byte);
    await SunmiPrinter.line();
  }

  Future<Uint8List> readFileBytes(String path) async {
    ByteData fileData = await rootBundle.load(path);
    Uint8List fileUnit8List = fileData.buffer
        .asUint8List(fileData.offsetInBytes, fileData.lengthInBytes);
    return fileUnit8List;
  }

  Future<void> printText(String text) async {
    await SunmiPrinter.line();
    await SunmiPrinter.printText(
      text,
      style: SunmiStyle(fontSize: SunmiFontSize.MD, bold: true, align: center),
    );
    await SunmiPrinter.line();
  }

  Future<void> printInvoice(context) async {
    var billModel = BillsCubit.get(context).singleBillModel;
    var model = billModel!.data![0];
    var company = billModel.data![0].company!;
    await SunmiPrinter.line();
    await SunmiPrinter.setAlignment(center);
    await SunmiPrinter.printRow(
      cols: [
        columnMaker(text: 'فاتورة ضريبة مبسطة'),
        columnMaker(text: 'Simple Tax Invoice'),
        columnMaker(text: '-' * 10),
        columnMaker(text: 'الكاشير', align: right),
        columnMaker(text: 'الوقت', align: center),
        columnMaker(text: 'التاريخ', align: left),
        columnMaker(text: 'anonymous', align: right),
        columnMaker(text: time, align: center),
        columnMaker(text: date, align: left),
        columnMaker(text: '-' * 10),
        columnMaker(text: 'الرقم المرجعي', align: right),
        columnMaker(text: company.taxNumber.toString(), align: left),
        columnMaker(text: 'رقم الجهاز', align: right),
        columnMaker(text: await SunmiPrinter.serialNumber(), align: left),
        columnMaker(text: 'رقم الفاتورة', align: right),
        columnMaker(text: '${model.id}', align: left),
        columnMaker(text: 'طريقه الدفع', align: right),
        columnMaker(text: '${model.paymentType}', align: left),
        columnMaker(text: '-' * 10),
      ],
    );
    await SunmiPrinter.printRow(
      cols: [
        columnMaker(text: 'اسم الصنف', align: right),
        for (var item in model.products!)
          columnMaker(text: '${item.title}', align: right),
        columnMaker(text: 'اسم الصنف'),
        for (var item in model.products!)
          columnMaker(text: '${item.pivot!.quantity!}'),
        columnMaker(text: 'السعر', align: left),
        for (var item in model.products!)
          columnMaker(text: '${item.price} SAR', align: left),
        columnMaker(text: '-' * 10),
        columnMaker(text: 'مبلغ الفاتوره الاجمالي', align: right),
        columnMaker(text: '${model.finalPrice} SAR', align: left),
        columnMaker(text: '-' * 10),
        columnMaker(text: 'المبلغ غير شامل الضريبه', align: right),
        columnMaker(text: '${model.priceBeforeTax} SAR', align: left),
        columnMaker(text: 'مجموع الضريبه المضافه', align: right),
        columnMaker(text: '${model.taxAmount} SAR', align: left),
        columnMaker(text: '-' * 10),
        columnMaker(text: 'اجمالي المبلغ', align: right),
        columnMaker(text: '${model.taxAmount} SAR', align: left),
        columnMaker(text: '-' * 10),
      ],
    );
    await SunmiPrinter.line(ch: '-', len: 10);
  }

  ColumnMaker columnMaker(
      {required String text, SunmiPrintAlign? align, int? width}) {
    return ColumnMaker(text: text, width: width ?? 8, align: align ?? center);
  }

  Future<void> closePrinter() async {
    await SunmiPrinter.unbindingPrinter();
    await SunmiPrinter.exitTransactionPrint(true);
  }
}

SunmiPrintAlign get left => SunmiPrintAlign.LEFT;
SunmiPrintAlign get right => SunmiPrintAlign.RIGHT;
SunmiPrintAlign get center => SunmiPrintAlign.CENTER;
String get date => intl.DateFormat('yyyy-MM-dd').format(DateTime.now());
String get time => intl.DateFormat('kk:mm:ss').format(DateTime.now());
