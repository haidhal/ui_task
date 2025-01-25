import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ui_task/model/product_model.dart';

class GalleryScreenController extends ChangeNotifier {
  ProductResModel? imageList;
  bool isLoading = false;
  Future<void> getImages() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse("https://api.pexels.com/v1/curated?per_page=10");
    try {
      final res = await http.get(url, headers: {
        "Authorization":
            "ziUAmbzZ7nhOwdtNxz3sYCJHcOTIL13RHzIrWxaey1bPZZKAeap9ZwsM"
      });
      if (res.statusCode == 200) {
        log(res.statusCode.toString());
        imageList = productResModelFromJson(res.body);
        isLoading = false;
        notifyListeners();
        log("Parsed imageList: ${imageList!.photos!.length} items");
      } else {
        imageList = null;
        log(res.statusCode.toString());
      }
    } catch (e) {
      imageList = null;
      isLoading = false;
      notifyListeners();
      log(e.toString());
    }
  }
}
