import 'package:permission_handler/permission_handler.dart';

camaraPermission() async {
  Map<Permission, PermissionStatus> statuses = await [
    Permission.camera,
    Permission.storage,
  ].request();
  print(statuses[Permission.location]);
}

