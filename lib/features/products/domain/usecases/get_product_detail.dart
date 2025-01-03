import 'package:toko_rame/core/resources/data_state.dart';
import 'package:toko_rame/core/usecases/usecase.dart';
import 'package:toko_rame/features/products/domain/entities/product.dart';
import 'package:toko_rame/features/products/domain/repository/product_repository.dart';

class GetProductDetailUseCase
    implements Usecase<DataState<ProductEntity>, String> {
  final ProductRepository _productRepository;

  GetProductDetailUseCase(this._productRepository);
  @override
  Future<DataState<ProductEntity>> call({String? params}) {
    return _productRepository.getProductDetail(params!);
  }
}
