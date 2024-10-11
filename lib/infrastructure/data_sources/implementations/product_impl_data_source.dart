// import 'package:qeema_task/core/constants/end_points.dart';
// import '../../../core/network/dio/base_dio.dart';
// import '../abstractions/product_base_data_source.dart';

// class ProductImplDataSource extends ProductBaseDataSource {
//   final BaseDio _dioClient;

//   ProductImplDataSource({required BaseDio dioClient}) : _dioClient = dioClient;

//   @override
//   Future<Map<String, dynamic>> getProduct({required String productId}) async {
//     final response = await _dioClient.get(
//       '${EndPoints.getProduct}$productId',
//     );
//     return response.data as Map<String, dynamic>;
//   }

//   @override
//   Future<List<dynamic>> getProducts() async {
//     final response = await _dioClient.get(EndPoints.getAllProducts);
//     return response.data;
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';

import '../abstractions/product_base_data_source.dart';

class ProductImplDataSource extends ProductBaseDataSource {
  ProductImplDataSource();

  @override
  Future<Map<String, dynamic>> getProduct({required String productId}) async {
    final doc = await FirebaseFirestore.instance
        .collection('products')
        .doc(productId)
        .get();

    if (doc.exists) {
      return doc.data() as Map<String, dynamic>;
    } else {
      throw Exception('Product not found');
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getProducts() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('products').get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }
}
