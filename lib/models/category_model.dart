class CategoryModel {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  CategoryModel({this.id, this.name, this.createdAt, this.updatedAt});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
