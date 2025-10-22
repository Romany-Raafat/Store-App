import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AllProductService {
  Future<List<ProductModel>> getAllProducts() async {
    var response = await Api().getRequest('https://fakestoreapi.com/products');
    List<ProductModel> productList = [];
    for (var productJson in response.data) {
      productList.add(ProductModel.fromJson(productJson));
    }
    return productList;
  }
}
