// ignore_for_file: library_private_types_in_public_api, depend_on_referenced_packages

import 'dart:developer';
import 'dart:io';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:willgo/core/extensions/build_context.dart';

import 'loading_widget.dart';

class CoursePdfScreen extends StatefulWidget {
  const CoursePdfScreen({
    super.key,
    required this.path,
    required this.name,
  });
  final String path;
  final String name;
  @override
  _CoursePdfScreenState createState() => _CoursePdfScreenState();
}

class _CoursePdfScreenState extends State<CoursePdfScreen> {
  String urlPDFPath = "";
  bool exists = true;
  int _totalPages = 0;
  int _currentPage = 0;
  bool pdfReady = false;
  late PDFViewController _pdfViewController;
  bool loaded = false;
  Future<File> getFileFromUrl(String url, {name}) async {
    var fileName = widget.name;
    if (name != null) {
      fileName = name;
    }
    try {
      var data = await http.get(Uri.parse(url));
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$fileName.pdf");
      log(dir.path);
      File urlFile = await file.writeAsBytes(bytes);
      return urlFile;
    } catch (e) {
      throw Exception("Error opening url file");
    }
  }

  @override
  void initState() {
    getFileFromUrl(widget.path).then(
      (value) => {
        setState(() {
          urlPDFPath = value.path;
          loaded = true;
          exists = true;
        })
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (loaded) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
        ),
        body: PDF(
          autoSpacing: true,
          enableSwipe: true,
          pageSnap: true,
          pageFling: true,
          defaultPage: _currentPage,
          swipeHorizontal: true,
          onError: (e) {
            BotToast.showText(text: e);
          },
          onRender: (pages) {
            setState(() {
              _totalPages = pages!;
              pdfReady = true;
            });
          },
          onViewCreated: (PDFViewController vc) {
            setState(() {
              _pdfViewController = vc;
            });
          },
          onPageChanged: (int? page, int? total) {
            setState(() {
              _currentPage = page!;
            });
          },
          onPageError: (page, e) {},
        ).cachedFromUrl(widget.path),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.chevron_left),
              iconSize: 50,
              color: Colors.black,
              onPressed: () {
                setState(() {
                  if (_currentPage > 0) {
                    _currentPage--;
                    _pdfViewController.setPage(_currentPage);
                  }
                });
              },
            ),
            Text(
              "${_currentPage + 1}/$_totalPages",
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
            IconButton(
              icon: const Icon(Icons.chevron_right),
              iconSize: 50,
              color: Colors.black,
              onPressed: () {
                setState(() {
                  if (_currentPage < _totalPages - 1) {
                    _currentPage++;
                    _pdfViewController.setPage(_currentPage);
                  }
                });
              },
            ),
          ],
        ),
      );
    } else {
      if (exists) {
        return const LoadingWidget(withMaterial: true);
      } else {
        return Material(
          child: Center(
            child: Text(
              context.translate.error,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        );
      }
    }
  }
}
