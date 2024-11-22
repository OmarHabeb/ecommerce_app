import 'package:ecommerce_app/core/helpers/navigation_helper.dart';
import 'package:ecommerce_app/view/auth/signIn_screen.dart';
import 'package:ecommerce_app/view/widgets/back_arrow_button.dart';
import 'package:ecommerce_app/view/widgets/text_field_with_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_button.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
                "Create Account",
                style: TextStyle(
                  fontSize: 28.sp,
                  color: Colors.white,
                ),
              )),
              Center(
                  child: Text(
                "Let’s Create Account Together",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Color.fromRGBO(112, 123, 129, 1),
                ),
              )),
              SizedBox(
                height: 50.h,
              ),
              TextFieldWithImage(
                labelText: "Your Name",
              ),
              SizedBox(
                height: 30.h,
              ),
              TextFieldWithImage(
                labelText: "Email Address",
              ),
              SizedBox(
                height: 30.h,
              ),
              TextFieldWithImage(
                labelText: "Password",
                obscureText: _isPasswordVisible,
                ic: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    child: _isPasswordVisible == false
                        ? Icon(
                            Icons.visibility,
                          )
                        : Icon(
                            Icons.visibility_off,
                          )),
              ),
              SizedBox(height: 60.h),
              CustomButton(
                text: "Sign In",
              ),
              SizedBox(height: 25.h),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 54.h,
                  decoration: BoxDecoration(
                      color: Color(0xff161F28),
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 24.w,
                        height: 24.h,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("assets/auth/goole.png"),
                        )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Sign in with google",
                        style: TextStyle(fontSize: 18.sp, color: Colors.white),
                      ),
                    ],
                  )),
              SizedBox(
                height: 60.h,
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
                        NavigationHelper.goTo(context, SigninScreen());
                      },
                      child: Text(
                        "Sign in for free",
                        style: TextStyle(color: Colors.white, fontSize: 16.sp),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
