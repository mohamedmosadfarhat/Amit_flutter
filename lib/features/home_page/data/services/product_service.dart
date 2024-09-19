import 'package:amit_flutter/features/home_page/data/models/product_model.dart';
import 'package:dio/dio.dart';

class ProductService {
  Future<List<ProductModel>> getProductData() async {
    List<ProductModel> products = [];
    String url = "https://fakestoreapi.com/products";
    Dio dio = Dio();
    var response = await dio.get(url);
    var data = response.data;
    data.forEach((json) {
      var product = ProductModel.fromJson(json);
      products.add(product);
    });
    return products;
  }
}
