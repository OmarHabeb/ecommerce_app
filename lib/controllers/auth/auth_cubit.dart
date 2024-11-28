import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
  bool PasswordIcondValue = true;
  showPassword(showPasswordIconValue) {
    emit(showPasswordEnable());
    return PasswordIcondValue = showPasswordIconValue;
  }
}