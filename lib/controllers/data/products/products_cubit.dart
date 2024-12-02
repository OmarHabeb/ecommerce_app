import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/helpers/dio_helpr.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  static ProductsCubit get(context) => BlocProvider.of(context);
  void getData() async {
    try {
      await DioHelper.getData(
              endPoint:
                  "products?apikey=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlyYnNieGJtempreXpyeHhpbGxnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI4MjM5MjYsImV4cCI6MjA0ODM5OTkyNn0.c2HlDfegiIC74qCef8hwrQUwvHsV680Bm5sYWa1qgSE")
          .then((value) {
   emit(GetProcuctsSuccess(ProductModel.fromJson(value.data)));
          });
    } catch (e) {
      emit(GetProcuctsError());
      print(e.toString());
    }
   
  }
}
