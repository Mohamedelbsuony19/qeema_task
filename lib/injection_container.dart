import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:qeema_task/app/contracts/product.dart';
import 'package:qeema_task/app/queries/get_all_products_query_impl.dart';
import 'package:qeema_task/app/queries/get_product_query_impl.dart';
import 'package:qeema_task/core/network/app_inceptors.dart';
import 'package:qeema_task/domain/base_repos/product_base_repo.dart';
import 'package:qeema_task/infrastructure/data_sources/abstractions/product_base_data_source.dart';
import 'package:qeema_task/infrastructure/data_sources/implementations/product_impl_data_source.dart';
import 'package:qeema_task/infrastructure/repos/product_impl_repo.dart';

import 'core/network/dio/base_dio.dart';
import 'core/network/dio/dio_client.dart';
import 'presentation/blocs/product/product_bloc.dart';

final sl = GetIt.instance;

Future initDependencies() async {
  await InjectionHelper.injectExternal();
  InjectionHelper.injectCore();
  InjectionHelper.injectDatasources();
  InjectionHelper.injectRepos();
  InjectionHelper.injectQueries();
  InjectionHelper.injectCommands();
  InjectionHelper.injectUsecases();
  InjectionHelper.injectBlocs();
}

abstract class InjectionHelper {
  static Future<void> injectExternal() async {}

  static void injectCore() {
    sl.registerLazySingleton(() => Dio());
    sl.registerSingleton<BaseDio>(
      DioClient(
        dio: sl(),
        interceptors: [
          AppInterceptors(),
        ],
        options: BaseOptions(),
      ),
    );
  }

  static void injectDatasources() {
    sl.registerSingleton<ProductBaseDataSource>(
      ProductImplDataSource(dioClient: sl()),
    );
  }

  static void injectRepos() {
    sl.registerSingleton<ProductBaseRepo>(
      ProductImplRepo(productBaseDataSource: sl()),
    );
  }

  static void injectBlocs() {
    sl.registerFactory<ProductBloc>(() => ProductBloc(
          sl(),
          sl(),
        ));
  }

  static void injectCommands() {}

  static void injectQueries() {
    sl.registerSingleton<GetAllProductsBaseQuery>(
      GetAllProductsQueryImpl(productBaseRepo: sl()),
    );
    sl.registerSingleton<GetProductBaseQuery>(
      GetProductQueryImpl(productBaseRepo: sl()),
    );
  }

  static void injectUsecases() {}
}
