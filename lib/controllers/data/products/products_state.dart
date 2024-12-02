part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}
final class GetProcuctsSuccess extends ProductsState {
    final ProductModel productModel;
  GetProcuctsSuccess(this.productModel);
}
final class GetProcuctsError extends ProductsState {}

