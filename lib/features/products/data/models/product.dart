import 'package:toko_rame/features/products/domain/entities/product.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    super.id,
    super.name,
    super.seller,
    super.description,
    super.image,
    super.isNew,
    super.commision,
    super.customerPrice,
    super.resellerPrice,
    super.stock,
    super.sizes,
    super.colors,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      seller: json['seller'],
      description: json['description'],
      image: json['image'],
      isNew: json['isNew'],
      commision: json['commision'],
      customerPrice: json['customerPrice'],
      resellerPrice: json['resellerPrice'],
      stock: json['stock'],
      sizes: List<String>.from(json['sizes']),
      colors: List<String>.from(json['colors']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'seller': seller,
      'description': description,
      'image': image,
      'isNew': isNew,
      'commision': commision,
      'customerPrice': customerPrice,
      'resellerPrice': resellerPrice,
      'stock': stock,
      'sizes': sizes,
      'colors': colors,
    };
  }
}
