import 'package:http/http.dart' as http;
import 'package:machinetestkingslab/model/Loginmessage.dart';

class Loginservice {
  Future<List<Loginmessage>?> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse("https://dummyjson.com/auth/login");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      loginmessageFromJson(json);
    }
  }
}
