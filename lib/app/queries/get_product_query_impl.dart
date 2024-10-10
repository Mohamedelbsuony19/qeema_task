import 'package:qeema_task/app/primitives/types/future_either_failure.dart';
import 'package:qeema_task/domain/entities/product_entity.dart';

import '../../domain/base_repos/product_base_repo.dart';
import '../contracts/product.dart';

class GetProductQueryImpl implements GetProductBaseQuery {
  final ProductBaseRepo productBaseRepo;

  GetProductQueryImpl({required this.productBaseRepo});
  @override
  FutureEitherFailureOrType<ProductEntity> call(String params) async {
    return await productBaseRepo.getProduct(productId: params);
  }
}
