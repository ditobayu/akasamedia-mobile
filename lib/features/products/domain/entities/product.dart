import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String? id;
  final String? seller;
  final String? name;
  final String? description;
  final List<String>? image;
  final bool? isNew;
  final double? commision;
  final double? customerPrice;
  final double? resellerPrice;
  final int? stock;
  final List<String>? sizes;
  final List<String>? colors;

  const ProductEntity(
      {this.seller,
      this.description,
      this.customerPrice,
      this.resellerPrice,
      this.image,
      this.isNew,
      this.commision,
      this.stock,
      this.sizes,
      this.colors,
      this.id,
      this.name});

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        customerPrice,
        image,
        isNew,
        commision,
        resellerPrice,
        stock,
        sizes,
        colors,
        seller
      ];
}
