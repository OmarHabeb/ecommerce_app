import 'package:ecommerce_app/core/helpers/navigation_helper.dart';
import 'package:ecommerce_app/view/screens/auth/signIn_screen.dart';
import 'package:ecommerce_app/view/widgets/back_arrow_button.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:ecommerce_app/view/widgets/text_field_with_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  bool password = true;

  bool confirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BackArrowButton(),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Fill in your bio to get started",
                style: TextStyle(fontSize: 25.sp, color: Colors.white),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "This data will be displayed in your account\nprofile for security",
                style: TextStyle(fontSize: 15.sp, color: Colors.white),
              ),
              SizedBox(
                height: 50.h,
              ),
              TextFieldWithImage(
                labelText: "Password",
                controller: passwordController,
                obscureText: password,
                ic: GestureDetector(
                    onTap: () {
                      setState(() {
                        password = !password;
                      });
                    },
                    child: password == false
                        ? Icon(
                            Icons.visibility_off,
                          )
                        : Icon(
                            Icons.visibility,
                          )),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFieldWithImage(
                labelText: "ConfirmPassword",
                controller: confirmPasswordController,
                obscureText: confirmPassword,
                ic: GestureDetector(
                    onTap: () {
                      setState(() {
                        confirmPassword = !confirmPassword;
                      });
                    },
                    child: confirmPassword == false
                        ? Icon(
                            Icons.visibility_off,
                          )
                        : Icon(
                            Icons.visibility,
                          )),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 250.h,
              ),
              Center(
                child: InkWell(
                    onTap: () {
                      if (passwordController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Please fill this data"),
                          duration: Duration(seconds: 3),
                        ));
                      } else if (passwordController.text ==
                          confirmPasswordController.text) {
                        NavigationHelper.goOffAll(context, SigninScreen());
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("please enter the same password"),
                          duration: Duration(seconds: 3),
                        ));
                      }
                    },
                    child: CustomButton(text: "Go to signin again")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
