import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List<ProductsModel> cartItems = [];
  double totalPrice = 0.0;
  double totalPriceWithDelivery = 0.0;

  static CartCubit get(context) => BlocProvider.of(context);

  void addToCart(ProductsModel item) {
    emit(CartLoading());
    try {
      cartItems.add(item);
      calculateTotal();
      emit(AddItemSuccess());
    } catch (e) {
      print("Error: $e");
    }
  }

  void calculateTotal() {
    totalPrice = cartItems.fold(0.0, (sum, item) => sum + item.price!);
    totalPriceWithDelivery = totalPrice + 10;
    emit(CartUpdated());
  }
}
