import 'package:dio/dio.dart';
import 'package:store_app/helper/api.dart';

class AllCategoriesService {
  final Dio dio = Dio();
  Future<List<String>> getAllCategories() async {
    var response = await Api().getRequest(
      'https://fakestoreapi.com/products/categories',
    );
    List<String> categories = List<String>.from(response.data);
    return categories;
  }
}
