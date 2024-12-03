import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  static FavoriteCubit get(context) => BlocProvider.of(context);

  Future<void> addToFavorites(String productId) async {
    final supabase = Supabase.instance.client;
    final userId = Supabase.instance.client.auth.currentUser;
    final response = await supabase.from('favorites').insert({
      'user_id': userId,
      'product_id': productId
    }); // Use .select() to return data, and it doesn't need .execute()
    log(response);
    print(response.toString());
  }
}
