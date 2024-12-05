import 'package:flutter/material.dart';
import 'package:wallpaper_app/screens/home_page/views/home_page.dart';
import 'package:wallpaper_app/screens/wall_paper_page/view/wall_paper_page.dart';

class AppRoutes {
  static String homePage = '/';
  static String wallPaper = 'wall_paper';

  static Map<String, Widget Function(BuildContext)> routes = {
    homePage: (context) => HomePage(),
    wallPaper: (context) => WallPaperPage(),
  };
}
