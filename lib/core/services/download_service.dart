import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class DownloadService {
  Future<String?> _getDownloadDirectory() async {
    if (Platform.isAndroid) {
      if (await Permission.storage.request().isGranted) {
        return (await getExternalStorageDirectory())?.path;
      }
    } else if (Platform.isIOS || Platform.isMacOS) {
      return (await getApplicationDocumentsDirectory()).path;
    } else if (Platform.isLinux || Platform.isWindows) {
      return (await getApplicationDocumentsDirectory()).path;
    } else if (Platform.isFuchsia) {
      return null;
    }
    return null;
  }

  Future<void> downloadFiles(List<String> results) async {
    Dio dio = Dio();
    final directory = await _getDownloadDirectory();
    if (directory == null) {
      debugPrint('Cannot find a suitable directory to save the files.');
      return;
    }
    for (var result in results) {
      String url = result;
      String fileName = url.split('/').last;
      String savePath = '$directory/$fileName';
      try {
        await dio.download(url, savePath);
        debugPrint('File downloaded: $savePath');
        BotToast.showText(text: 'Files downloaded successfully');
      } catch (e) {
        debugPrint('Error downloading file: $e');
      }
    }
  }
}
