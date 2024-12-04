part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
final class CartLoading extends CartState {}
final class AddItemSuccess extends CartState {}
final class CartUpdated extends CartState{}
final class EmptyCart extends CartState {}