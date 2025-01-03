import 'package:toko_rame/core/error/api_error.dart';
import 'package:toko_rame/core/resources/data_state.dart';
import 'package:toko_rame/features/products/data/data_sources/remote/product_api_service.dart';
import 'package:toko_rame/features/products/data/models/product.dart';
import 'package:toko_rame/features/products/domain/entities/product.dart';
import 'package:toko_rame/features/products/domain/repository/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductApiService _productApiService;

  ProductRepositoryImpl(ProductApiService productApiService)
      : _productApiService = productApiService;
  @override
  Future<DataState<List<ProductModel>>> getProducts() async {
    try {
      final products = await _productApiService.getProducts();
      return DataSuccess(
        products,
      );
    } catch (e) {
      return DataFailed(
        ApiError(
          statusCode: 500,
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<DataState<ProductEntity>> getProductDetail(String id) async {
    try {
      final product = await _productApiService.getProductDetail(id);
      return DataSuccess(
        product,
      );
    } catch (e) {
      return DataFailed(
        ApiError(
          statusCode: 500,
          message: e.toString(),
        ),
      );
    }
  }
}
