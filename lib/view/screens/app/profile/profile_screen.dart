import 'package:ecommerce_app/core/helpers/navigation_helper.dart';
import 'package:ecommerce_app/view/screens/app/profile/accountsSetting/account_setting_screen.dart';
import 'package:ecommerce_app/view/screens/app/profile/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 812,
        padding: EdgeInsets.all(15.w),
        margin: EdgeInsets.only(top: 50.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    NavigationHelper.goTo(context, EditProfileScreen());
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.person_2_outlined,
                        color: Colors.grey,
                        size: 30,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Edit Profile",
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                GestureDetector(
                  onTap: () {
                    NavigationHelper.goTo(context, AccountSettingScreen());
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        color: Colors.grey,
                        size: 30,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Account&Setting",
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
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
                        "Sign Out",
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
