import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  static SignupCubit get(context) => BlocProvider.of(context);
  
    Future<void> signupUser({required String email, required String password, required String userName}) async {
      emit(onSignupLoading());
    try {
      await Supabase.instance.client.auth.signUp(
        password: password,
        email: email,
        data: {
          'display_name': userName
        }
      );
      emit(onSignupSuccess());
    } catch (e) {
      emit(onSignupError(e.toString()));
      log(e.toString());
      
    }
  }
}

