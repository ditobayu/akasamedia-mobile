part of 'remote_product_detail_bloc.dart';

sealed class RemoteProductDetailState extends Equatable {
  const RemoteProductDetailState();

  @override
  List<Object> get props => [];
}

final class RemoteProductDetailInitial extends RemoteProductDetailState {}

final class RemoteProductDetailLoading extends RemoteProductDetailState {}

final class RemoteProductDetailLoaded extends RemoteProductDetailState {
  final ProductEntity product;

  const RemoteProductDetailLoaded(this.product);

  @override
  List<Object> get props => [product];
}

final class RemoteProductDetailError extends RemoteProductDetailState {
  final Error error;

  const RemoteProductDetailError(this.error);

  @override
  List<Object> get props => [error];
}
