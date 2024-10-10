import 'package:equatable/equatable.dart';

import '../../../domain/entities/product_entity.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class AppInitial extends ProductState {}

final class LoadingState extends ProductState {}

final class ErrorState extends ProductState {
  final String failureMessage;
  const ErrorState({required this.failureMessage});

  @override
  List<Object> get props => [failureMessage];
}

final class SuccessState extends ProductState {
  final List<ProductEntity> products;
  const SuccessState({required this.products});

  @override
  List<Object> get props => [products];
}
