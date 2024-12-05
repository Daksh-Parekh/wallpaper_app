import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:wallpaper_app/screens/home_page/model/product_model.dart';
import 'package:wallpaper_app/screens/wall_paper_page/model/wall_paper_model.dart';

class APIHelper {
  Future<List<ProductModel>?> getProductData() async {
    //Api call
    String link = "https://fakestoreapi.com/products";

    http.Response response = await http.get(Uri.parse(link));

    if (response.statusCode == 200) {
      String jsonString = response.body;

      List jsonList = jsonDecode(jsonString);
      log('conv');
      // log('$jsonList');
      List<ProductModel> productList =
          jsonList.map((e) => ProductModel.mapToModel(e)).toList();
      log('conv done');
      return productList;
    }
    log("=================ERROR================");
    // return null;
  }

  Future<WallPaperModel?> getWallPaperData() async {
    String links =
        "https://pixabay.com/api/?key=47454465-125375318ed5f44f6bf742a4a";
    http.Response response = await http.get(Uri.parse(links));
    if (response.statusCode == 200) {
      String jsonStr = response.body;

      var json = jsonDecode(jsonStr);
      log('conv');

      WallPaperModel mo = WallPaperModel.mapToModel(json);
      return mo;
    }
    log("=================ERROR================");
    return null;
  }
}
