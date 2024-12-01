import 'package:ecommerce_app/controllers/auth/signup_cubit/cubit/signup_cubit.dart';
import 'package:ecommerce_app/core/helpers/navigation_helper.dart';
import 'package:ecommerce_app/view/screens/auth/signin_screen.dart';
import 'package:ecommerce_app/view/widgets/back_arrow_button.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:ecommerce_app/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({super.key});

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> isPasswordVisible = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(20.0),
          child: BlocConsumer<SignupCubit, SignupState>(
            listener: (context, state) {
              if (state is onSignupLoading) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return  Center(child: CircularProgressIndicator());
                  },
                );
              } else if (state is onSignupSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Account created successfully!",
                        style: TextStyle(color: Colors.green)),
                  ),
                );

                NavigationHelper.goTo(context, SigninScreen());
              } else if (state is onSignupError) {
                Navigator.of(context, rootNavigator: true).pop();

                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Signup failed'),
                      content: Text(
                          "${state.errorMessage}"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                          child: Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            builder: (context, state) {
              var cubit = SignupCubit.get(context);
              return Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    BackArrowButton(),
                    SizedBox(height: 20.h),
                    Center(
                      child: Text(
                        "Create Account",
                        style: TextStyle(fontSize: 28.sp, color: Colors.white),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Let’s Create Account Together",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: const Color.fromRGBO(112, 123, 129, 1),
                        ),
                      ),
                    ),
                    SizedBox(height: 50.h),
                    TextFieldWithImage(
                      obscureText: false,
                      controller: userNameController,
                      labelText: "Your Name",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Name is required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30.h),
                    TextFieldWithImage(
                      obscureText: false,
                      controller: emailController,
                      labelText: "Email Address",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email is required";
                        }
                        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                        if (!emailRegex.hasMatch(value)) {
                          return "Enter a valid email address";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30.h),
                    ValueListenableBuilder<bool>(
                      valueListenable: isPasswordVisible,
                      builder: (context, isVisible, child) {
                        return TextFieldWithImage(
                          controller: passwordController,
                          labelText: "Password",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password is required";
                            }
                            if (value.length < 6) {
                              return "Password must have more than 6 characters";
                            }
                            return null;
                          },
                          obscureText: !isVisible,
                          ic: GestureDetector(
                            onTap: () => isPasswordVisible.value = !isVisible,
                            child: Icon(
                              isVisible
                                  ? Icons.visibility 
                                  : Icons.visibility_off
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 60.h),
                    CustomButton(
                      text: "Sign up",
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          cubit.signupUser(
                            email: emailController.text,
                            password: passwordController.text,
                            userName: userNameController.text,
                          );
                        } else {
                          print("Error");
                        }
                      },
                    ),
                    SizedBox(height: 25.h),
                    CustomButton(text: "Sign up with google", image: "assets/auth/google.png", color: Color.fromRGBO(22, 31, 40, 1),),
                 
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                        ),
                        TextButton(
                          onPressed: () {
                            NavigationHelper.goOffAll(
                              context,
                               SigninScreen(),
                            );
                          },
                          child: Text(
                            "Sign in for free",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
