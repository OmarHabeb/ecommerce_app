class ProductsModel {
  int? id;
  String? name;
  double? price;
  String? description;
  String? category;
  String? imageUrl;

  ProductsModel(
      {this.id,
      this.name,
      this.price,
      this.description,
      this.category,
      this.imageUrl});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    imageUrl = json['image_url'];
  }
}
