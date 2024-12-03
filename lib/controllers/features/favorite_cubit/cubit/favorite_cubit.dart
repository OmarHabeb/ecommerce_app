
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
      'user_id': "59802d48-5458-41be-8a71-ac370ceeeef0",
      'product_id': 8
    }); // Use .select() to return data, and it doesn't need .execute()
    log(response);
    print(response.toString());
    // if (response.) {
    //   print('error to favorites ' + response.Error);
    // } else {
    //   print('Added to favorites successfully');
    //   // If needed, check the response data
    // }
  }
}
