import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class GetCategoryService {
  Future<List<ProductModel>> getCategoryProducts(String category) async {
    var response = await Api().getRequest(
      'https://fakestoreapi.com/products/category/$category',
    );
    List<ProductModel> categoryProductList = [];
    for (var productJson in response.data) {
      categoryProductList.add(ProductModel.fromJson(productJson));
    }
    return categoryProductList;
  }
}
