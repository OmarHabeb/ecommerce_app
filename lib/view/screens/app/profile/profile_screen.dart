import 'package:ecommerce_app/core/helpers/navigation_helper.dart';
import 'package:ecommerce_app/view/screens/app/profile/accountsSetting/account_setting_screen.dart';
import 'package:ecommerce_app/view/screens/app/profile/accountsSetting/custom_container_account_setting.dart';
import 'package:ecommerce_app/view/screens/app/profile/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.w),
          margin: EdgeInsets.only(top: 50.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.w)),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Hey,",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "profile name",
                style: TextStyle(color: Colors.white, fontSize: 25.sp),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  NavigationHelper.goTo(context, EditProfileScreen());
                },
                child: CustomContainerAccountSetting(text: "Edit profile", icon: Icon(Icons.person),)
              ),
              SizedBox(
                height: 15.h,
              ),
              GestureDetector(
                onTap: () {
                  NavigationHelper.goTo(context, AccountSettingScreen());
                },
                child:CustomContainerAccountSetting(text: "Account & Settings", icon: Icon(Icons.settings),)
              ),
                CustomContainerAccountSetting(
              text: 'Notification Setting',
              icon: Icon(Icons.notifications),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomContainerAccountSetting(
              text: 'Shipping Address',
              icon: Icon(Icons.local_shipping_outlined),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomContainerAccountSetting(
              text: 'Payment info',
              icon: Icon(Icons.payment),
            ),
            SizedBox(
              height: 20,
            ),
            CustomContainerAccountSetting(
              text: 'Delete Account',
              icon: Icon(Icons.delete),
            ),
              SizedBox(
                height: 20,
              ),
               SizedBox(
            height: 20,
          ),
          Text(
            "App Settings",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       "Enable Push Notifications",
          //       style: TextStyle(color: Colors.grey, fontSize: 17),
          //     ),
          //     Switch(
          //         activeColor: Color(0xFF8C6658),
          //         inactiveThumbColor: Colors.white,
          //         inactiveTrackColor: Colors.grey,
          //         value: isSwitched,
          //         onChanged: (value) {
          //           setState(() {
          //             isSwitched = value;
          //           });
          //         })
          //   ],
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       "Enable Location Services",
          //       style: TextStyle(color: Colors.grey, fontSize: 17),
          //     ),
          //     Switch(
          //         activeColor: Color(0xFF8C6658),
          //         inactiveThumbColor: Colors.white,
          //         inactiveTrackColor: Colors.grey,
          //         value: issSwitched,
          //         onChanged: (value) {
          //           setState(() {
          //             issSwitched = value;
          //           });
          //         })
          //   ],
          // ),
              Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.logout_outlined,
                      color: Colors.grey,
                      size: 30,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Sign out",
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
