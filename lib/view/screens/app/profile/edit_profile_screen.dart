import 'package:ecommerce_app/view/widgets/back_arrow_button.dart';
import 'package:ecommerce_app/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.w),
          margin: EdgeInsets.only(top: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackArrowButton(),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF8C6658), shape: BoxShape.circle),
                      width: 44.w,
                      height: 44.h,
                      child: Icon(Icons.save),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          maxRadius: 60,
                          // backgroundImage: AssetImage("Assets/abdoo.jpg"),
                        ),
                        Positioned(
                          right: 38,
                          bottom: -15,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color(0xFF8C6658)),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "Profile name",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Name",
                style: TextStyle(color: Colors.white, fontSize: 20.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextField(
                labelText: "Your Name",
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                "E-mail",
                style: TextStyle(color: Colors.white, fontSize: 20.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextField(
                labelText: "Your Email",
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                "password",
                style: TextStyle(color: Colors.white, fontSize: 20.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextField(
                labelText: "Your password",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
