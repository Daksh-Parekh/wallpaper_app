import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/screens/home_page/model/product_model.dart';
import 'package:wallpaper_app/screens/wall_paper_page/model/wall_paper_model.dart';
import 'package:wallpaper_app/utils/api_helper/api_helper.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> products = [];
  void getProductData() async {
    APIHelper helper = APIHelper();
    products = await helper.getProductData() ?? [];
    // log()
    notifyListeners();
  }

  List<Hits> hitsList = [];

  Future<void> WallPaperData(String search) async {
    APIHelper helper = APIHelper();
    log('conv');
    WallPaperModel? wallPaperModel = await helper.getWallPaperData(search);
    hitsList = wallPaperModel!.hit!;
    log('conv done');
    notifyListeners();
  }
}
