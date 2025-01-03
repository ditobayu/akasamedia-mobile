import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:toko_rame/core/resources/data_state.dart';
import 'package:toko_rame/features/products/domain/entities/product.dart';
import 'package:toko_rame/features/products/domain/usecases/get_products.dart';

part 'remote_product_event.dart';
part 'remote_product_state.dart';

class RemoteProductBloc extends Bloc<RemoteProductEvent, RemoteProductState> {
  final GetProductsUseCase getProductsUseCase;
  RemoteProductBloc(this.getProductsUseCase) : super(RemoteProductInitial()) {
    on<GetRemoteProducts>(onGetProducts);
  }

  Future<void> onGetProducts(
    GetRemoteProducts event,
    Emitter<RemoteProductState> emit,
  ) async {
    emit(RemoteProductLoading());
    final result = await getProductsUseCase();

    if (result is DataSuccess) {
      emit(RemoteProductLoaded(result.data!));
    } else if (result is DataFailed) {
      emit(RemoteProductError(result.error!));
    }
  }
}
