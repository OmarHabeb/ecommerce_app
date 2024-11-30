import 'package:ecommerce_app/core/helpers/navigation_helper.dart';
import 'package:ecommerce_app/view/screens/auth/verification_code_%D9%8Dscreen.dart';
import 'package:ecommerce_app/view/widgets/back_arrow_button.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:ecommerce_app/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecoverPasswordScreen extends StatelessWidget {
  const RecoverPasswordScreen({super.key});

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
              TextFieldWithImage(
                labelText: "Email Address",
              ),
              SizedBox(
                height: 50.h,
              ),
              GestureDetector(
                  onTap: () {
                    NavigationHelper.goTo(context, verification_code());
                  },
                  child: CustomButton(text: "Continue"))
            ],
          ),
        ),
      ),
    );
  }
}
