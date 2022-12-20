import 'dart:html' as html;

import 'package:flutter/cupertino.dart';
import 'package:pdfx/pdfx.dart';

afterDocumentLoad() async {

}

class CVPage extends StatelessWidget {
  const CVPage({super.key});

  static const String route = 'cv';

  @override
  Widget build(BuildContext context) {
    final document = PdfDocument.openAsset('assets/images/Emilie_Chen_CV.pdf');
    final pdfPinchController = PdfControllerPinch(
      document: document,
    );
    return PdfViewPinch(
      controller: pdfPinchController,
      padding: 20,
      onDocumentLoaded: (document) async {
        await afterDocumentLoad();
      },
      onDocumentError: (error) async {
        await afterDocumentLoad();
      },
    );
  }
}