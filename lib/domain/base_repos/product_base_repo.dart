import 'package:dartz/dartz.dart';
import 'package:qeema_task/core/network/failure.dart';

import '../entities/product_entity.dart';

abstract class ProductBaseRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, ProductEntity>> getProduct(
      {required String productId});
}
