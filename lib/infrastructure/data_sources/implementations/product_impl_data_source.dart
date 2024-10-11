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
