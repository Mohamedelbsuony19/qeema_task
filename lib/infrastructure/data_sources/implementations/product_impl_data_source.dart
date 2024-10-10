import 'package:qeema_task/core/constants/end_points.dart';

import '../../../core/network/dio/base_dio.dart';
import '../abstractions/product_base_data_source.dart';

class ProductImplDataSource extends ProductBaseDataSource {
  final BaseDio _dioClient;

  ProductImplDataSource({required BaseDio dioClient}) : _dioClient = dioClient;

  @override
  Future<Map<String, dynamic>> getProduct({required String productId}) async {
    final response = await _dioClient.get(
      '${EndPoints.getProduct}$productId',
    );
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> getProducts() async {
    final response = await _dioClient.get(EndPoints.getAllProducts);
    return response.data;
  }
}
