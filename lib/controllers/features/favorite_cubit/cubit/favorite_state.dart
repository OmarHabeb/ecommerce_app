part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

class FavoritesInitial extends FavoriteState {}

class FavoritesLoading extends FavoriteState {}

class FavoritesLoaded extends FavoriteState {
  //final List<> favorites;

  //FavoritesLoaded(this.favorites);
}

class FavoritesError extends FavoriteState {
  final String message;

  FavoritesError(this.message);
}
