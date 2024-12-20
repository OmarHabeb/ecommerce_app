import 'package:ecommerce_app/controllers/auth/login_cubit/cubit/login_cubit.dart';
import 'package:ecommerce_app/core/helpers/navigation_helper.dart';
import 'package:ecommerce_app/view/screens/app/home/home/home_screen.dart';
import 'package:ecommerce_app/view/screens/app/navigatorBar.dart';
import 'package:ecommerce_app/view/screens/auth/create_account_screen.dart';
import 'package:ecommerce_app/view/screens/auth/recover_password_screen.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:ecommerce_app/view/widgets/custom_text_form_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});
  final ValueNotifier<bool> isPasswordVisible = ValueNotifier<bool>(false);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(20),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is onLoginLoading) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return Center(child: CircularProgressIndicator());
                  },
                );
              } else if (state is onLoginSuccess) {
                Navigator.of(context, rootNavigator: true).pop();
                // NAVIGATE TO HOME SCREEN
                NavigationHelper.goOffAll(context, navigator());
              } else if (state is onLoginFailure) {
                Navigator.of(context, rootNavigator: true).pop();

                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Login failed'),
                      content: Text(
                          "${state.errorMessage + state.errorCode.toString()}"),
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
              var cubit = LoginCubit.get(context);
              return Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 100.h,
                    ),
                    Text(
                      "Hello Again!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Welcome Back You've Been Missed!",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          controller: emailController,
                          obscureText: false,
                          labelText: "Email Address",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please fill in  your email address";
                            }
                            final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                            if (!emailRegex.hasMatch(value)) {
                              return "Enter a valid email address";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        ValueListenableBuilder<bool>(
                          valueListenable: isPasswordVisible,
                          builder: (context, isVisible, child) {
                            return CustomTextField(
                              controller: passwordController,
                              labelText: "Password",
                              obscureText: !isVisible,
                              ic: GestureDetector(
                                  onTap: () =>
                                      isPasswordVisible.value = !isVisible,
                                  child: Icon(isVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off)),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please fill in the password";
                                }
                                return null;
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {
                            NavigationHelper.goTo(
                                context, RecoverPasswordScreen());
                          },
                          child: Text(
                            "Forget Password",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 13.sp),
                          )),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomButton(
                      width: MediaQuery.of(context).size.width,
                      text: "Sign In",
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          cubit.loginUserWithEmail(
                              email: emailController.text,
                              password: passwordController.text);
                        }
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomButton(
                      width: MediaQuery.of(context).size.width,
                      text: "Sign up with google",
                      image: "assets/auth/google.png",
                      color: Colors.black.withOpacity(0.1),
                      onTap: () {
                        cubit.loginUserWithGoogle();
                      },
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                        ),
                        TextButton(
                            onPressed: () {
                              NavigationHelper.goTo(
                                  context, CreateAccountScreen());
                            },
                            child: Text(
                              "Sign up for free",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.sp),
                            ))
                      ],
                    )
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
