part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

class FavoritesInitial extends FavoriteState {}

class FavoritesLoading extends FavoriteState {}
class FavoriteSuccess extends FavoriteState {}

class FavoritesError extends FavoriteState {
  final String message;

  FavoritesError(this.message);
}
