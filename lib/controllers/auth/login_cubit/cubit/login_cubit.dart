import 'dart:developer';

import 'package:ecommerce_app/core/helpers/shared_preference_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
   static LoginCubit get(context) => BlocProvider.of(context);
  //  CacheHelper cacheHelper = CacheHelper();
     Future<void> loginUserWithEmail({required String email, required String password}) async {
      emit(onLoginLoading());
    try {
      await Supabase.instance.client.auth
          .signInWithPassword(password: password, email: email)
          .then(
        (value) async {
          log(await value.session!.accessToken);
          // cacheHelper.setData(key: "userToken", value: value.session!.accessToken);
          emit(onLoginSuccess());
        },
      );
    } on AuthException catch (authError) {
      emit(onLoginFailure("${authError.message} \nError code: ", errorCode:  authError.statusCode));
    }  on Exception catch (e) {
    emit(onLoginFailure("An unexpected error occurred: ${e.toString()}", ));
  }
  }

   Future<void> loginUserWithGoogle() async {
      emit(onLoginLoading());
    try {
      await Supabase.instance.client.auth.signInWithOAuth(OAuthProvider.google);
   
    } on AuthException catch (authError){
      emit(onLoginFailure("Login Error: ${authError.message}"));
    } on Exception catch (e) {
    emit(onLoginFailure("An unexpected error occurred: ${e.toString()}"));
  }
  }

 
}
