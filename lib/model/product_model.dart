// To parse this JSON data, do
//
//     final productResModel = productResModelFromJson(jsonString);

import 'dart:convert';

ProductResModel productResModelFromJson(String str) => ProductResModel.fromJson(json.decode(str));

String productResModelToJson(ProductResModel data) => json.encode(data.toJson());

class ProductResModel {
    int? page;
    int? perPage;
    List<Photo>? photos;

    ProductResModel({
        this.page,
        this.perPage,
        this.photos,
    });

    factory ProductResModel.fromJson(Map<String, dynamic> json) => ProductResModel(
        page: json["page"],
        perPage: json["per_page"],
        photos: json["photos"] == null ? [] : List<Photo>.from(json["photos"]!.map((x) => Photo.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "photos": photos == null ? [] : List<dynamic>.from(photos!.map((x) => x.toJson())),
    };
}

class Photo {
    int? id;
    int? width;
    int? height;
    String? url;
    String? photographer;
    String? photographerUrl;
    int? photographerId;
    String? avgColor;
    Src? src;
    bool? liked;
    String? alt;

    Photo({
        this.id,
        this.width,
        this.height,
        this.url,
        this.photographer,
        this.photographerUrl,
        this.photographerId,
        this.avgColor,
        this.src,
        this.liked,
        this.alt,
    });

    factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        photographer: json["photographer"],
        photographerUrl: json["photographer_url"],
        photographerId: json["photographer_id"],
        avgColor: json["avg_color"],
        src: json["src"] == null ? null : Src.fromJson(json["src"]),
        liked: json["liked"],
        alt: json["alt"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "width": width,
        "height": height,
        "url": url,
        "photographer": photographer,
        "photographer_url": photographerUrl,
        "photographer_id": photographerId,
        "avg_color": avgColor,
        "src": src?.toJson(),
        "liked": liked,
        "alt": alt,
    };
}

class Src {
    String? original;
    String? large2X;
    String? large;
    String? medium;
    String? small;
    String? portrait;
    String? landscape;
    String? tiny;

    Src({
        this.original,
        this.large2X,
        this.large,
        this.medium,
        this.small,
        this.portrait,
        this.landscape,
        this.tiny,
    });

    factory Src.fromJson(Map<String, dynamic> json) => Src(
        original: json["original"],
        large2X: json["large2x"],
        large: json["large"],
        medium: json["medium"],
        small: json["small"],
        portrait: json["portrait"],
        landscape: json["landscape"],
        tiny: json["tiny"],
    );

    Map<String, dynamic> toJson() => {
        "original": original,
        "large2x": large2X,
        "large": large,
        "medium": medium,
        "small": small,
        "portrait": portrait,
        "landscape": landscape,
        "tiny": tiny,
    };
}
