import 'package:dartz/dartz.dart';
import 'package:qeema_task/core/network/failure.dart';
import 'package:qeema_task/domain/entities/product_entity.dart';

import '../../domain/base_repos/product_base_repo.dart';
import '../data_sources/abstractions/product_base_data_source.dart';

class ProductImplRepo implements ProductBaseRepo {
  final ProductBaseDataSource _productBaseDataSource;

  ProductImplRepo({required ProductBaseDataSource productBaseDataSource})
      : _productBaseDataSource = productBaseDataSource;
  @override
  Future<Either<Failure, ProductEntity>> getProduct(
      {required String productId}) async {
    try {
      final response =
          await _productBaseDataSource.getProduct(productId: productId);
      return Right(ProductEntity.fromJson(response));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

@override
Future<Either<Failure, List<ProductEntity>>> getProducts() async {
  try {
    final response = await _productBaseDataSource.getProducts();
    
    return Right(response.map((e) => ProductEntity.fromJson(e)).toList());
  } catch (e) {
    return Left(ServerFailure(e.toString()));
  }
}

}
