import 'dart:typed_data';

import 'package:http/http.dart';
import 'package:printing/printing.dart';

import 'HiddenGlobal.dart';


enum PrintType { LIST_PRINTERS, DEFAULT_PRINTER }

abstract class PrintingInterface {
  Future<void> chooseAndPrint(Uint8List fileBytes);
  Future<void> printOnDefaultPrinter(Uint8List fileBytes);
  Future<void> printFromURL({url, PrintType printType,String id});
}

class PrintingServices implements PrintingInterface {
  chooseAndPrint(Uint8List fileBytes) async {
    await Printing.layoutPdf(
      onLayout: (_) async => fileBytes,
    );
  }

  printOnDefaultPrinter(Uint8List fileBytes) async {
    await Printing.listPrinters().then((value) async {
      print(value);
      await Printing.directPrintPdf(
          onLayout: (_) async => fileBytes,
          printer:
          value[value.indexWhere((element) => element.isDefault == true)]);
    });
  }

  printFromURL({url, PrintType? printType,String? id}) async {
    Response response = await post(Uri.parse(url),
        body: {
          "id": id.toString(),
        },
        headers: {"Authorization": "Bearer ${bLoC.user.token}"});
    print(response.body);
    switch (printType) {
      case PrintType.LIST_PRINTERS:
        chooseAndPrint(response.bodyBytes);
        break;
      case PrintType.DEFAULT_PRINTER:
        printOnDefaultPrinter(response.bodyBytes);
        break;
      default:
        printOnDefaultPrinter(response.bodyBytes);
        break;
    }
  }
}