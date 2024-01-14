
List<CategoryModel> categoryModelFromJson(dynamic str) =>
    List<CategoryModel>.from((str as List<dynamic>).map((x) => CategoryModel.fromJson(x)));

class CategoryModel {
  int ?id;
  String? name;
  String ?description;
  String ?coverPhoto;
  dynamic parent;
  int ?status;

  CategoryModel({
    this.id,
    this.name,
    this.description,
    this.coverPhoto,
    this.parent,
    this.status,

  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    coverPhoto: json["cover_photo"],
    parent: json["parent"],
    status: json["status"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "cover_photo": coverPhoto,
    "parent": parent,
    "status": status,
  };
}
