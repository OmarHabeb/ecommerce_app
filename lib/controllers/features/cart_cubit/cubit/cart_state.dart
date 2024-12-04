part of 'cart_cubit.dart';


sealed class CartState {}

final class CartInitial extends CartState {}
final class CartLoading extends CartState{}
final class CartSuccess extends CartState{}
final class CartItemAdded extends CartState{}
final class CartError extends CartState {
  String messageError;
  CartError(this.messageError);
}
