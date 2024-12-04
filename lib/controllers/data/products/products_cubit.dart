import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/helpers/dio_helpr.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  List<ProductsModel> products = [];
  static ProductsCubit get(context) => BlocProvider.of(context);
  void getData() async {
    //   try {
    //     await DioHelper.getData(endPoint: "/rest/v1/products", queryParameters: {
    //       "apikey":
    //           "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlyYnNieGJtempreXpyeHhpbGxnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI4MjM5MjYsImV4cCI6MjA0ODM5OTkyNn0.c2HlDfegiIC74qCef8hwrQUwvHsV680Bm5sYWa1qgSE"
    //     }).then((value) {
    //       products.add(value.data);
    //       emit(GetProcuctsSuccess(ProductsModel.fromJson(value.data)));
    //     });
    //   } catch (e) {
    //     emit(GetProcuctsError());
    //     print(e.toString());
    //   }
  }
  void getProducts() async {
    try {
      var response = await Dio().get(
          "https://yrbsbxbmzjkyzrxxillg.supabase.co/rest/v1/products?apikey=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlyYnNieGJtempreXpyeHhpbGxnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI4MjM5MjYsImV4cCI6MjA0ODM5OTkyNn0.c2HlDfegiIC74qCef8hwrQUwvHsV680Bm5sYWa1qgSE");

      if (response.statusCode == 200) {
        var data = response.data as List;
        products = data.map((e) => ProductsModel.fromJson(e)).toList();
        emit(GetProcuctsSuccess());
      }
    } catch (e) {
      print(e.toString());
      emit(GetProcuctsError());
    }
  }

  List<ProductsModel> searchProducts = [];
  void search(String text) {
    searchProducts = products
        .where((e) => e.name!.toLowerCase().contains(text.toLowerCase()))
        .toList();
    emit(SearchState());
  }
}
