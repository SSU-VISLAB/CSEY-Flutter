import 'package:dio/dio.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class _DownloadService {
  Future<void> download({required String url});
}

class MobileDownloadService implements _DownloadService {
  @override
  Future<void> download({required String url}) async {
    // requests permission for downloading the file
    bool hasPermission = await _requestWritePermission();
    if (!hasPermission) return;

    // gets the directory where we will download the file.
    var dir = await getApplicationDocumentsDirectory();

    // You should put the name you want for the file here.
    // Take in account the extension.
    String fileName = url.split('/').last;
    
    // downloads the file
    Dio dio = Dio();
    await dio.download(url, "${dir.path}/$fileName");
    
    // opens the file
    OpenFilex.open("${dir.path}/$fileName", type: "image/jpeg");
  }

  // requests storage permission
  Future<bool> _requestWritePermission() async {
    await Permission.storage.request();
    return await Permission.storage.request().isGranted;
  }
}