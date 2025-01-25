// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_task/controller/gallery_screen_controller.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<GalleryScreenController>().getImages();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final imageProvider = context.watch<GalleryScreenController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "Photo Gallery",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(10), child: SizedBox()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: imageProvider.isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : imageProvider.imageList == null ||
                    imageProvider.imageList!.photos == null
                ? Center(
                    child: Text("No Photos Available"),
                  )
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                    itemCount: imageProvider.imageList!.photos!.length,
                    itemBuilder: (context, index) {
                      final photo = imageProvider.imageList!.photos![index];
                      return Container(
                        color: Colors.yellow,
                        child: Image.network(
                          photo.src?.medium ??
                              "https://via.placeholder.com/150",
                          fit: BoxFit.cover,
                        ),
                      );
                    }),
      ),
    );
  }
}
