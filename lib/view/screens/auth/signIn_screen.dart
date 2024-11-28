import 'package:ecommerce_app/core/helpers/navigation_helper.dart';
import 'package:ecommerce_app/view/screens/auth/create_account_screen.dart';
import 'package:ecommerce_app/view/screens/auth/recover_password_screen.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:ecommerce_app/view/widgets/text_field_with_image.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool _isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background.png"),
                  fit: BoxFit.cover)),
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
                                Icons.visibility_off,
                              )
                            : Icon(
                                Icons.visibility,
                              )),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      NavigationHelper.goTo(context, RecoverPasswordScreen());
                    },
                    child: Text(
                      "Forget Password",
                      style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                    )),
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                  onTap: () {},
                  child: CustomButton(
                    text: "Sign In",
                  )),
              SizedBox(
                height: 20.h,
              ),
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
                        NavigationHelper.goTo(context, CreateAccountScreen());
                      },
                      child: Text(
                        "Sign up for free",
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
