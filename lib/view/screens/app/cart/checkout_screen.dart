import 'package:ecommerce_app/core/helpers/navigation_helper.dart';
import 'package:ecommerce_app/core/style/colors.dart';
import 'package:ecommerce_app/view/screens/app/home/home/home_screen.dart';
import 'package:ecommerce_app/view/screens/app/navigatorBar.dart';
import 'package:ecommerce_app/view/screens/app/profile/custom_container_account_setting.dart';
import 'package:ecommerce_app/view/widgets/back_arrow_button.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10.r),
        margin: EdgeInsets.only(right: 15, left: 15),
        height: 206.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: Colors.black.withOpacity(0.1)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(15.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sub-Total",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text("Delivery Charge",
                          style: TextStyle(color: Colors.white)),
                      Text("Discount", style: TextStyle(color: Colors.white)),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text("Total",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\$0",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text("\$10", style: TextStyle(color: Colors.white)),
                      Text("\$0", style: TextStyle(color: Colors.white)),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text("\$0",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp)),
                    ],
                  ),
                )
              ],
            ),
            InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        actionsAlignment: MainAxisAlignment.center,
                        backgroundColor: secondPrimaryColor,
                        title: Text("Congratulations!",
                            style: TextStyle(color: textWhiteColor)),
                        content: Row(
                          children: [
                            Text(
                              "Your Payment Is Successful!",
                              style: TextStyle(color: textWhiteColor),
                            ),
                            Icon(Icons.celebration)
                          ],
                        ),
                        actions: [
                          CustomButton(
                            text: "Back to shopping",
                            width: 200.w,
                            color: Colors.black.withOpacity(0.5),
                            onTap: () {
                              NavigationHelper.goOffAll(context, navigator());
                            },
                          )
                        ],
                      );
                    },
                  );
                },
                child: CustomButton(
                    text: "Payment", width: MediaQuery.of(context).size.width))
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        leading: Container(
            margin: EdgeInsets.only(left: 15), child: BackArrowButton()),
        title: Text(
          "Checkout",
          style: TextStyle(color: textWhiteColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(15.w),
            width: MediaQuery.of(context).size.width,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(15.w),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15.w)),
              child: Column(
                children: [
                  CustomContainerAccountSetting(
                    icon: Icon(Icons.email),
                    text: "opjsadjasod@gmail.com",
                  ),
                  CustomContainerAccountSetting(
                    icon: Icon(Icons.phone),
                    text: "0000000000",
                  ),
                  CustomContainerAccountSetting(
                    icon: Icon(Icons.build),
                    text: "uuuhhuhkijijjyjh",
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.attach_money,
                      color: textWhiteColor,
                    ),
                    title: Text(
                      "Paypal Card",
                      style: TextStyle(color: textWhiteColor),
                    ),
                    subtitle: Text("kaljsdkjasd"),
                    trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
