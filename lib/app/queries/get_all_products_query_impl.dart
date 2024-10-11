import 'package:qeema_task/app/primitives/types/future_either_failure.dart';
import 'package:qeema_task/app/primitives/inputs/no_params.dart';
import 'package:qeema_task/domain/entities/product_entity.dart';

import '../../domain/base_repos/product_base_repo.dart';
import '../contracts/product.dart';

class GetAllProductsQueryImpl implements GetAllProductsBaseQuery {
  final ProductBaseRepo productBaseRepo;

  GetAllProductsQueryImpl({required this.productBaseRepo});
  @override
  FutureEitherFailureOrType<List<ProductEntity>> call(NoParams params) async {
    return await productBaseRepo.getProducts();
  }
}
