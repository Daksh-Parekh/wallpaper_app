import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/main.dart';
import 'package:wallpaper_app/screens/home_page/provider/home_provider.dart';
import 'package:wallpaper_app/utils/routes/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ProductProvider pRead, pWatch;
  @override
  void initState() {
    context.read<ProductProvider>().getProductData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pRead = context.read<ProductProvider>();
    pWatch = context.watch<ProductProvider>();
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.wallPaper);
              },
              icon: Icon(Icons.wallpaper_rounded),
            ),
          ],
        ),
        body: GridView.builder(
          itemCount: pWatch.products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.9),
          itemBuilder: (context, index) {
            return Container(
              height: 150,
              width: 150,
              margin: EdgeInsets.all(16),
              child: Column(
                children: [
                  Image.network(
                    '${pWatch.products[index].image}',
                    height: 100,
                    width: 100,
                  ),
                  Text(
                    "${pWatch.products[index].title}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text("\$${pWatch.products[index].price}"),
                  Text("${pWatch.products[index].ratingModel!.rate}⭐")
                ],
              ),
            );
          },
        ));
  }
}
