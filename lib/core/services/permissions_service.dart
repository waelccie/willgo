// ignore_for_file: constant_identifier_names

import 'package:permission_handler/permission_handler.dart';

enum LocationPermissionResult {
  Granted,
  Denied,
  DeniedForever,
  UnableToDetermine,
}

class PermissionServices {
  static Future<bool> checkPermission(Permission permission) async {
    PermissionStatus status = await permission.status;
    switch (status) {
      case PermissionStatus.granted:
        return true;
      case PermissionStatus.denied:
        // Permission is denied, request it again
        PermissionStatus requestedStatus = await permission.request();
        return requestedStatus == PermissionStatus.granted;
      case PermissionStatus.permanentlyDenied:
        return false;
      default:
        // Unable to determine permission status
        return false;
    }
  }

  static Future<bool> checkCameraPermission() async {
    return await checkPermission(Permission.camera);
  }

  static Future<bool> checkContactsPermission() async {
    return await checkPermission(Permission.contacts);
  }

  static Future<bool> getGalleryPermission() async {
    return await checkPermission(Permission.photos);
  }

  static Future<bool> checkMicrophonePermission() async {
    return await checkPermission(Permission.microphone);
  }

  static Future<bool> checkStoragePermissions() async {
    PermissionStatus status = await Permission.storage.status;
    switch (status) {
      case PermissionStatus.granted:
        return true;
      case PermissionStatus.denied:
        PermissionStatus requestedStatus = await Permission.storage.request();
        return requestedStatus == PermissionStatus.granted;
      case PermissionStatus.permanentlyDenied:
        return false;
      default:
        return false;
    }
  }
}
