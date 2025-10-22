import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AddProductService {
  Future<ProductModel> addProduct({
    required String title,
    required double price,
    required String descritpion,
    required String image,
    required String ctegory,
  }) async {
    var response = await Api()
        .postRequest('https://fakestoreapi.com/products', {
          "title": title,
          "price": price,
          "description": descritpion,
          "image": image,
          "category": ctegory,
        });
    return ProductModel.fromJson(response.data);
  }
}
