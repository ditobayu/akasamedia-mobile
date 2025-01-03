import 'package:toko_rame/core/resources/data_state.dart';
import 'package:toko_rame/core/usecases/usecase.dart';
import 'package:toko_rame/features/products/domain/entities/product.dart';
import 'package:toko_rame/features/products/domain/repository/product_repository.dart';

class GetProductsUseCase
    implements Usecase<DataState<List<ProductEntity>>, void> {
  final ProductRepository _productRepository;

  GetProductsUseCase(this._productRepository);
  @override
  Future<DataState<List<ProductEntity>>> call({void params}) {
    return _productRepository.getProducts();
  }
}
