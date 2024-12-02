import 'package:ecommerce_app/view/screens/app/home/custom_container.dart';
import 'package:ecommerce_app/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.w),
          margin: EdgeInsets.only(top: 30.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hola",
                    style: TextStyle(color: Colors.white, fontSize: 40.sp),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF8C6658)),
                        borderRadius: BorderRadius.circular(15.w)),
                    child: IconButton(
                        onPressed: () {}, icon: Icon(Icons.notifications)),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextField(
                labelText: "Looking for shoes",
                prefix: Icon(Icons.search),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Shoes",
                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See all",
                      style:
                          TextStyle(color: Color(0xFF8C6658), fontSize: 16.sp),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomContainer(),
                  SizedBox(
                    width: 15.w,
                  ),
                  CustomContainer(),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "New Arrivals",
                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See all",
                      style:
                          TextStyle(color: Color(0xFF8C6658), fontSize: 16.sp),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 120.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.w),
                    color: Colors.black.withOpacity(0.1)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
