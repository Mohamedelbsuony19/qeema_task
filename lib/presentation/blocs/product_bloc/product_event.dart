import 'package:equatable/equatable.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

final class GetAllProductsEvent extends ProductEvent {
  const GetAllProductsEvent();

  @override
  List<Object> get props => [];
}

final class GetProductEven extends ProductEvent {
  final String id;
  const GetProductEven(this.id);
  @override
  List<Object> get props => [id];
}
