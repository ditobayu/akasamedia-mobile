import 'package:get_it/get_it.dart';
import 'package:toko_rame/features/products/data/data_sources/remote/product_api_service.dart';
import 'package:toko_rame/features/products/data/data_sources/remote/product_api_service_impl.dart';
import 'package:toko_rame/features/products/data/repository/product_repository_impl.dart';
import 'package:toko_rame/features/products/domain/repository/product_repository.dart';
import 'package:toko_rame/features/products/domain/usecases/get_product_detail.dart';
import 'package:toko_rame/features/products/domain/usecases/get_products.dart';
import 'package:toko_rame/features/products/presentation/bloc/product/remote/remote_product_bloc.dart';
import 'package:toko_rame/features/products/presentation/bloc/product_detail/remote/remote_product_detail_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<ProductApiService>(ProductApiServiceImpl());

  sl.registerSingleton<ProductRepository>(ProductRepositoryImpl(sl()));

  sl.registerSingleton<GetProductsUseCase>(GetProductsUseCase(sl()));
  sl.registerSingleton<GetProductDetailUseCase>(GetProductDetailUseCase(sl()));

  sl.registerFactory<RemoteProductBloc>(() => RemoteProductBloc(sl()));
  sl.registerFactory<RemoteProductDetailBloc>(
      () => RemoteProductDetailBloc(sl()));
}
