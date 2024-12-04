part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class GetProcuctsSuccess extends ProductsState {
  // final ProductsModel productsmodel;
  // GetProcuctsSuccess(this.productsmodel);
}

final class GetProcuctsError extends ProductsState {}
final class GetProcuctsloading extends ProductsState {}
final class SearchState extends ProductsState {}
