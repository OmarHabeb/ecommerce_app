
import 'package:ecommerce_app/view/screens/app/profile/custom_container_account_setting.dart';
import 'package:ecommerce_app/view/widgets/back_arrow_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountSettingScreen extends StatefulWidget {
  const AccountSettingScreen({super.key});

  @override
  State<AccountSettingScreen> createState() => _s1State();
}

class _s1State extends State<AccountSettingScreen> {
  bool isSwitched = false;
  bool issSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(15.w),
      margin: EdgeInsets.only(top: 30.w),
      child: Column(
        children: [
          Row(
            children: [
              BackArrowButton(),
              SizedBox(
                width: 30.w,
              ),
              Text(
                "Account & Settings",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp),
              ),
            ],
          ),
          SizedBox(
            height: 20,
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
          Text(
            "App Settings",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Enable Push Notifications",
                style: TextStyle(color: Colors.grey, fontSize: 17),
              ),
              Switch(
                  activeColor: Color(0xFF8C6658),
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.grey,
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  })
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Enable Location Services",
                style: TextStyle(color: Colors.grey, fontSize: 17),
              ),
              Switch(
                  activeColor: Color(0xFF8C6658),
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.grey,
                  value: issSwitched,
                  onChanged: (value) {
                    setState(() {
                      issSwitched = value;
                    });
                  })
            ],
          ),
        ],
      ),
    ));
  }
}
