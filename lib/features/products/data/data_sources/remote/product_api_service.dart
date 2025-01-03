import 'package:toko_rame/features/products/data/models/product.dart';

abstract class ProductApiService {
  Future<List<ProductModel>> getProducts();
  Future<ProductModel> getProductDetail(String id);
}
