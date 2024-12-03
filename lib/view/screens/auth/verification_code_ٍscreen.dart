import 'package:ecommerce_app/core/helpers/navigation_helper.dart';
import 'package:ecommerce_app/view/screens/auth/create_new_password.dart';
import 'package:ecommerce_app/view/widgets/back_arrow_button.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class verification_code extends StatefulWidget {
  const verification_code({super.key});

  @override
  State<verification_code> createState() => _verification_codeState();
}

class _verification_codeState extends State<verification_code> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.w),
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackArrowButton(),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Enter 4-digit\nVerification code",
                style: TextStyle(fontSize: 25.sp, color: Colors.white),
              ),
              SizedBox(
                height: 50.h,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: Color.fromRGBO(22, 31, 40, 1),
                ),
                width: MediaQuery.of(context).size.width,
                height: 103.h,
                child: Center(
                  child: TextField(
                    controller: controller,
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        letterSpacing: 20.w,
                        fontSize: 33.sp,
                        color: Colors.white),
                    decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                    ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                height: 250.h,
              ),
              Center(
                  child: InkWell(
                      onTap: () {
                        if (controller.text.length == 4) {
                          NavigationHelper.goTo(context, CreateNewPassword());
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Please Enter 4 digit code"),
                            duration: Duration(seconds: 3),
                          ));
                        }
                      },
                      child: CustomButton(
                        width: MediaQuery.of(context).size.width,
                        text: "Next",
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
