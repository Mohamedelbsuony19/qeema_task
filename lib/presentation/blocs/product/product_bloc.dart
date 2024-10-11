import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qeema_task/app/contracts/product.dart';
import 'package:qeema_task/app/primitives/inputs/no_params.dart';

import '../../../domain/entities/product_entity.dart';

part 'product_bloc.freezed.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProductsBaseQuery getAllProducts;
  final GetProductBaseQuery getProduct;
  ProductBloc(this.getAllProducts, this.getProduct)
      : super(const ProductState.initial()) {
    on<ProductEvent>((event, emit) async {
      await event.maybeMap(
        orElse: () {},
        getAllProducts: (event) async {
          emit(const ProductState.loadInProgress());
          final products = await getAllProducts(NoParams());
          await products.fold((failure) async {
            emit(ProductState.loadFailure(message: failure.message));
          }, (products) async {
            emit(ProductState.loadSuccess(products: products));
          });
        },
        getProduct: (event) async {
          emit(const ProductState.loadInProgress());
          final product = await getProduct(event.productId);
          await product.fold((failure) async {
            emit(ProductState.loadFailure(message: failure.message));
          }, (product) async {
            emit(ProductState.loadSuccess(product: product));
          });
        },
      );
    });
  }
}
