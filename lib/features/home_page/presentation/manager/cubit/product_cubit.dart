import 'package:amit_flutter/features/home_page/data/models/product_model.dart';
import 'package:amit_flutter/features/home_page/data/services/product_service.dart';
import 'package:amit_flutter/features/home_page/presentation/manager/cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductItial());
  List<ProductModel> products = [];
  getProduct() async {
    try {
      emit(ProductLoading());
      products = await ProductService().getProductData();
      emit(ProductSuccess());
    } catch (e) {
      print(e);
      emit(ProductFailur());
    }
  }
}
