import 'package:machinetestkingslab/model/productmodel.dart';
import 'package:http/http.dart' as http;

class Homeservice {
  Future<List<ProductElement>?> getProduct() async {
    var client = http.Client();
    var uri = Uri.parse("https://dummyjson.com/auth/login");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      productFromJson(json);
    }
  }
}
