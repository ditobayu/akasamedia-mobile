import 'package:toko_rame/core/resources/data_state.dart';
import 'package:toko_rame/features/products/domain/entities/product.dart';

abstract class ProductRepository {
  Future<DataState<List<ProductEntity>>> getProducts();
  Future<DataState<ProductEntity>> getProductDetail(String id);
}
