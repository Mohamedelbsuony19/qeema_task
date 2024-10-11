abstract class ProductBaseDataSource {
  Future<List<dynamic>> getProducts();
  Future<Map<String, dynamic>> getProduct({required String productId});
}
