import 'package:ecommerce_app/controllers/features/profile_cubit/cubit/profile_cubit.dart';
import 'package:ecommerce_app/view/widgets/back_arrow_button.dart';
import 'package:ecommerce_app/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    ProfileCubit.get(context).fetchUser(); // Fetch user data when screen loads
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.w),
          margin: EdgeInsets.only(top: 30.w),
          child: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {
              if (state is ProfileError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              } else if (state is UpdateProfileSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Profile updated successfully!")),
                );
              }
            },
            builder: (context, state) {
              if (state is ProfileLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProfileSuccess) {
                final user = state.user;
                final userMetadata = user.userMetadata;

                // Update controllers with fetched data
                nameController.text = userMetadata?['display_name'] ?? '';
                emailController.text = userMetadata?['email'] ?? '';

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BackArrowButton(),
                        GestureDetector(
                          onTap: () {
                            ProfileCubit.get(context).updateUser(
                              name: nameController.text,
                              email: emailController.text,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF8C6658),
                              shape: BoxShape.circle,
                            ),
                            width: 44.w,
                            height: 44.h,
                            child: const Icon(Icons.save),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Name",
                      style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      obscureText: false,
                      controller: nameController,
                      labelText: "Your Name",
                    ),
                    const SizedBox(height: 40),
                    Text(
                      "E-mail",
                      style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      obscureText: false,
                      controller: emailController,
                      labelText: "Your Email",
                    ),
                  ],
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
