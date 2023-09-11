import 'package:machinetestkingslab/model/productonemodel.dart';
import 'package:http/http.dart' as http;

class Updateservice {
  Future<List<Productone>?> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse("https://dummyjson.com/products/1");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      productoneFromJson(json);
    }
  }
}
