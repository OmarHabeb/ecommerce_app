class ProductModel {
  int? id;
  String? name;
  String? price;
  String? description;
  String? category;
  String? imageUrl;

  ProductModel(
      {this.id,
      this.name,
      this.price,
      this.description,
      this.category,
      this.imageUrl});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    imageUrl = json['image_url'];
  }
}