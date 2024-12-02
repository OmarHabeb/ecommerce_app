import 'package:ecommerce_app/controllers/auth/forget_password_cubit/cubit/forget_password_cubit.dart';
import 'package:ecommerce_app/core/helpers/navigation_helper.dart';
import 'package:ecommerce_app/view/screens/auth/verification_code_%D9%8Dscreen.dart';
import 'package:ecommerce_app/view/widgets/back_arrow_button.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:ecommerce_app/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecoverPasswordScreen extends StatelessWidget {
  RecoverPasswordScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
              if (state is ForgetPasswordLoading) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return Center(child: CircularProgressIndicator());
                  },
                );
              } else if (state is ForgetPasswordSuccess) {
                Navigator.of(context, rootNavigator: true).pop();
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Success'),
                      content: Text("Check your inbox for OTP code"),
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
                ).then(
                  (value) {
                    NavigationHelper.goTo(context, verification_code());
                  },
                );
              } else if (state is ForgetPasswordError) {
                Navigator.of(context, rootNavigator: true).pop();
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Error'),
                      content: Text("${state.errorMessage}"),
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
              var cubit = ForgetPasswordCubit.get(context);
              return Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    BackArrowButton(),
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                        child: Text(
                      "Recover Password",
                      style: TextStyle(
                        fontSize: 28.sp,
                        color: Colors.white,
                      ),
                    )),
                    Column(
                      children: [
                        Center(
                            child: Text(
                          "Please Enter Your Email Address To ",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Color.fromRGBO(112, 123, 129, 1),
                          ),
                        )),
                        Center(
                            child: Text(
                          "Recieve a Verification Code",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Color.fromRGBO(112, 123, 129, 1),
                          ),
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    CustomTextField(
                      obscureText: false,
                      controller: emailController,
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
                      height: 50.h,
                    ),
                    CustomButton(
                      text: "Continue",
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          cubit.sendPasswordResetEmail(emailController.text);
                        }
                      },
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
