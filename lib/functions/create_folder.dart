import 'dart:io';

import 'package:blackpad/widgets/snack_bar.dart';
import 'package:permission_handler/permission_handler.dart';

Future<String> notesFolder(context) async {
  final path = Directory('/storage/emulated/0/BlackPad');

  var storage = await Permission.storage.status;
  var manageStorage = await Permission.manageExternalStorage.status;
  var accessMedia = await Permission.accessMediaLocation.status;

  if (!storage.isGranted ||
      !manageStorage.isGranted ||
      !accessMedia.isGranted) {
    showSnackBar(context, 'Grant Permissions');

    final storageRequest = await Permission.storage.request();
    final manageStorageRequest =
        await Permission.manageExternalStorage.request();
    final accessMediaRequest = await Permission.accessMediaLocation.request();

    if (!storageRequest.isGranted ||
        !manageStorageRequest.isGranted ||
        !accessMediaRequest.isGranted) {
      showSnackBar(context, 'Permissions not granted');

      return '';
    }
  }
  if ((await path.exists())) {
    return path.path;
  } else {
    path.create();
    return path.path;
  }
}
