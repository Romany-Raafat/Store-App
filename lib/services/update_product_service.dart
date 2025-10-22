import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct({
    required int id,
    required String title,
    required double price,
    required String descritpion,
    required String image,
    required String ctegory,
  }) async {
    var response = await Api()
        .putRequest('https://fakestoreapi.com/products/$id', {
          "title": title,
          "price": price,
          "description": descritpion,
          "image": image,
          "category": ctegory,
        });
    return ProductModel.fromJson(response.data);
  }
}
