part of 'product_bloc.dart';

@freezed
class ProductEvent with _$ProductEvent {
  
  const factory ProductEvent.getAllProducts() = GetAllProducts;
  const factory ProductEvent.getProduct({required String productId}) = GetProduct;
}