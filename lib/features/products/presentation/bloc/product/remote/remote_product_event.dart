part of 'remote_product_bloc.dart';

sealed class RemoteProductEvent extends Equatable {
  const RemoteProductEvent();

  @override
  List<Object> get props => [];
}

final class GetRemoteProducts extends RemoteProductEvent {}
