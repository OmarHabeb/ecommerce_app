import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);

  final supabase = Supabase.instance.client;

  Future<void> fetchUser() async {
    emit(ProfileLoading());
    try {
      final User? user = supabase.auth.currentUser;
      if (user != null) {
        log('User fetched: ${user.userMetadata}');
        emit(ProfileSuccess(user));
      } else {
        emit(ProfileError("No user found"));
      }
    } catch (e) {
      emit(ProfileError("Error fetching user: $e"));
    }
  }

Future<void> updateUser({required String name, required String email}) async {
  emit(ProfileLoading()); // Show loading indicator
  try {
    // Update user in Supabase
    await supabase.auth.updateUser(
      UserAttributes(
        email: email,
        data: {'display_name': name},
      ),
    );

    // Fetch updated user details to refresh UI
    final updatedUser = supabase.auth.currentUser;
    if (updatedUser != null) {
      emit(ProfileSuccess(updatedUser));
    } else {
      emit(ProfileError("Failed to retrieve updated user data."));
    }
  } catch (e) {
    emit(ProfileError("Error updating user: $e"));
  }
}

}
