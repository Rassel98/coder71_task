import 'product_model.dart';

class ResponseModel {
  int? currentPage;
  List<ProductModel>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;

  ResponseModel({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        currentPage: json["current_page"],
        data: json["data"] != null ? List<ProductModel>.from(json["data"].map((x) => ProductModel.fromJson(x))) : [],
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
      );
}
