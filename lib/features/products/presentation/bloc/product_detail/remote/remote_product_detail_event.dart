part of 'remote_product_detail_bloc.dart';

sealed class RemoteProductDetailEvent extends Equatable {
  const RemoteProductDetailEvent();

  @override
  List<Object> get props => [];
}

final class GetRemoteProductDetail extends RemoteProductDetailEvent {
  final String id;

  const GetRemoteProductDetail(this.id);

  @override
  List<Object> get props => [id];
}
