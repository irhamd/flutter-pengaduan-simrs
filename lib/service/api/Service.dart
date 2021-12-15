import 'package:applikasi_pelaporan_simrs/service/api/_api.dart';
import 'package:http/http.dart' as http;

class Service {
  Future<bool> addImage(
      Map<String, String> body, String filepath, filepath_setelah) async {
    String addimageUrl = baseUrl + 'imageadd';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };

    var request = http.MultipartRequest('POST', Uri.parse(addimageUrl))
      ..fields.addAll(body)
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath('image', filepath))
      ..files.add(
          await http.MultipartFile.fromPath('image_setelah', filepath_setelah));
    var response = await request.send();
    if (response.statusCode == 201) {
      print("berhasill");
      return true;
    } else {
      print("gagall");
      return false;
    }
  }
}
