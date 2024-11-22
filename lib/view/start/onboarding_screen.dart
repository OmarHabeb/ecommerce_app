import 'package:ecommerce_app/core/helpers/navigation_helper.dart';
import 'package:ecommerce_app/view/auth/signIn_screen.dart';
import 'package:ecommerce_app/view/start/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _StartState();
}

class _StartState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.r),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background.png"),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 600.h,
                child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentindex = value;
                      });
                    },
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 350.w,
                            height: 350.h,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        images[index]["image"].toString()),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                images[index]["title"].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40.sp,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                images[index]["des"].toString(),
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 20.sp),
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(images.length, (index) {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 4.0),
                        height: 12.h,
                        width: 12.w,
                        decoration: BoxDecoration(
                          color:
                              currentindex == index ? Colors.blue : Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
                  ),
                  InkWell(
                      onTap: () {
                        NavigationHelper.goOffAll(context, SigninScreen());
                      },
                      child: Container(
                        width: 105.w,
                        height: 54.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.w),
                          color: Colors.blue,
                        ),
                        child: Center(
                          child:  Text(
                            "Next",
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
