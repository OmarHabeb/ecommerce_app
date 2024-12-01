
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());
  static ForgetPasswordCubit get(context) => BlocProvider.of(context);



   Future<void> sendPasswordResetEmail(String email) async {
  emit(ForgetPasswordLoading());
  try {
    await Supabase.instance.client.auth.resetPasswordForEmail(email);
    emit(ForgetPasswordSuccess("Password reset email sent successfully!"));
  } on AuthException catch (authError) {
    emit(ForgetPasswordError("${authError.message}"));
  } on Exception catch (e) {
    emit(ForgetPasswordError("An unexpected error occurred: ${e.toString()}"));
  }
}
}
