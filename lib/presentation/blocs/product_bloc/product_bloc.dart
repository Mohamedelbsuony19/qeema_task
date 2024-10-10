import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qeema_task/app/contracts/product.dart';

import 'product_bloc_state.dart';
import 'product_event.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProducts getAllProducts;
  final GetProductBaseQuery getProduct;
  ProductBloc(this.getAllProducts, this.getProduct) : super(AppInitial()) {
    on<GetAllProductsEvent>((event, emit) {});
  }
}
