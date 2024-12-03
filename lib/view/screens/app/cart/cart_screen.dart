import 'package:ecommerce_app/core/helpers/navigation_helper.dart';
import 'package:ecommerce_app/view/screens/app/cart/checkout_screen.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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
                  NavigationHelper.goTo(context, CheckoutScreen());
                },
                child: CustomButton(
                    text: "Checkout", width: MediaQuery.of(context).size.width))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Text("CartScreen"),
        ),
      ),
    );
  }
}
