import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/screens/home_page/provider/home_provider.dart';

class WallPaperPage extends StatefulWidget {
  const WallPaperPage({super.key});

  @override
  State<WallPaperPage> createState() => _WallPaperPageState();
}

class _WallPaperPageState extends State<WallPaperPage> {
  late ProductProvider pRead, pWatch;
  @override
  void initState() {
    context.read<ProductProvider>().WallPaperData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pRead = context.read<ProductProvider>();
    pWatch = context.watch<ProductProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Wall Paper Page"),
      ),
      body: GridView.builder(
        itemCount: pWatch.hitsList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Container(
            height: 200,
            width: 200,
            // color: Colors.amber,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Image.network(
              '${pWatch.hitsList[index].previewU}',
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }
}
