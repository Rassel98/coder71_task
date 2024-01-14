
List<ProductModel> districtModelFromJson(dynamic str) =>
    List<ProductModel>.from((str as List<dynamic>).map((x) => ProductModel.fromJson(x)));
class ProductModel {
  int? id;
  String ?name;
  String ?description;
  String ?photo;
  int ?status;
  String ?collections;
  String? collectionsName;
  String? colors;
  String ?colorsName;
  String ?tags;
  int? totalHeartCount;
  int ?totalViewCount;
  int ?totalDownloadCount;


  ProductModel({
    this.id,
    this.name,
    this.description,
    this.photo,
    this.status,
    this.collections,
    this.collectionsName,
    this.colors,
    this.colorsName,
    this.tags,
    this.totalHeartCount,
    this.totalViewCount,
    this.totalDownloadCount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    photo: json["photo"],
    status: json["status"],
    collections: json["collections"],
    collectionsName: json["collections_name"],
    colors: json["colors"],
    colorsName: json["colors_name"],
    tags: json["tags"],
    totalHeartCount: json["total_heart_count"],
    totalViewCount: json["total_view_count"],
    totalDownloadCount: json["total_download_count"],

  );

}