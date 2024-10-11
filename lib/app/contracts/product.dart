import '../../domain/entities/product_entity.dart';
import '../base_types/base_query.dart';
import '../primitives/types/future_either_failure.dart';
import '../primitives/inputs/no_params.dart';

abstract class GetAllProductsBaseQuery extends BaseQuery<
    FutureEitherFailureOrType<List<ProductEntity>>, NoParams> {}

abstract class GetProductBaseQuery
    extends BaseQuery<FutureEitherFailureOrType<ProductEntity>, String> {}
