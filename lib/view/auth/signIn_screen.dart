import 'package:ecommerce_app/core/helpers/navigation_helper.dart';
import 'package:ecommerce_app/view/auth/create_account_screen.dart';
import 'package:ecommerce_app/view/auth/recover_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

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
                height: 50.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email Address",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        fillColor: Color(0xff161F28),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: Color(0xff161F28)),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff161F28)),
                            borderRadius: BorderRadius.circular(50))),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    "Password",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        fillColor: Color(0xff161F28),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: Color(0xff161F28)),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff161F28)),
                            borderRadius: BorderRadius.circular(50))),
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
                      "Recover Password",
                      style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                    )),
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 54.h,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(fontSize: 18.sp, color: Colors.white),
                      ),
                    )),
              ),
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
