abstract class ProductBaseDataSource {
  Future<Map<String, dynamic>> getProducts();
  Future<Map<String, dynamic>> getProduct({required String productId});
}
