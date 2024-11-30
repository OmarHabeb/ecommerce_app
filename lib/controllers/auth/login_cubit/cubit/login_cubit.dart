import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
   static LoginCubit get(context) => BlocProvider.of(context);

     Future<void> loginUser({required String email, required String password}) async {
      emit(onLoginLoading());
    try {
      await Supabase.instance.client.auth
          .signInWithPassword(password: password, email: email)
          .then(
        (value) async {
          log(await value.session!.accessToken);
          emit(onLoginSuccess());
        },
      );
    } catch (e) {
      emit(onLoginFailure());
      log(e.toString());
      print("$e error occured");
    }
  }
}
