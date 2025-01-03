import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:toko_rame/core/resources/data_state.dart';
import 'package:toko_rame/features/products/domain/entities/product.dart';
import 'package:toko_rame/features/products/domain/usecases/get_product_detail.dart';

part 'remote_product_detail_event.dart';
part 'remote_product_detail_state.dart';

class RemoteProductDetailBloc
    extends Bloc<RemoteProductDetailEvent, RemoteProductDetailState> {
  final GetProductDetailUseCase getProductDetailUseCase;
  RemoteProductDetailBloc(this.getProductDetailUseCase)
      : super(RemoteProductDetailInitial()) {
    on<GetRemoteProductDetail>(onGetProductDetail);
  }

  Future<void> onGetProductDetail(
    GetRemoteProductDetail event,
    Emitter<RemoteProductDetailState> emit,
  ) async {
    emit(RemoteProductDetailLoading());
    final result = await getProductDetailUseCase(params: event.id);

    if (result is DataSuccess) {
      emit(RemoteProductDetailLoaded(result.data!));
    } else if (result is DataFailed) {
      emit(RemoteProductDetailError(result.error!));
    }
  }
}
