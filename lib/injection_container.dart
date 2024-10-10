import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:qeema_task/core/network/app_inceptors.dart';

import 'core/network/dio/base_dio.dart';
import 'core/network/dio/dio_client.dart';

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

  static void injectDatasources() {}

  static void injectRepos() {}

  static void injectCommands() {}

  static void injectQueries() {}

  static void injectUsecases() {}

  static void injectBlocs() {}
}
