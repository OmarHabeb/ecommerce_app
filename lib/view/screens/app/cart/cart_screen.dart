import 'package:ecommerce_app/controllers/auth/cart/cubit/cart_cubit.dart';
import 'package:ecommerce_app/core/helpers/navigation_helper.dart';
import 'package:ecommerce_app/view/screens/app/cart/checkout_screen.dart';
import 'package:ecommerce_app/view/screens/app/home/home/custom_container.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = CartCubit.get(context);

    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10.r),
        margin: EdgeInsets.only(right: 15, left: 15),
        height: 215.h,
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
                      Text("Sub-Total", style: TextStyle(color: Colors.white)),
                      Text("Delivery Charge",
                          style: TextStyle(color: Colors.white)),
                      Text("Discount", style: TextStyle(color: Colors.white)),
                      SizedBox(height: 10.h),
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
                      BlocBuilder<CartCubit, CartState>(
                        builder: (context, state) {
                          return Text(
                            "\$${cubit.totalPrice.toStringAsFixed(2)}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp),
                          );
                        },
                      ),
                      Text("\$10", style: TextStyle(color: Colors.white)),
                      Text("\$0", style: TextStyle(color: Colors.white)),
                      SizedBox(height: 10.h),
                      BlocBuilder<CartCubit, CartState>(
                        builder: (context, state) {
                          return Text(
                            "\$${cubit.totalPriceWithDelivery.toStringAsFixed(2)}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp),
                          );
                        },
                      ),
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
        child: Container(
          padding: EdgeInsets.all(15.w),
          margin: EdgeInsets.only(top: 30.w),
          child: Column(
            children: [
              SizedBox(height: 15.h),
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  if (cubit.cartItems.isEmpty) {
                    return Center(child: Text("No items in the cart"));
                  }
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final get = cubit.cartItems[index];
                      return CustomContainer(
                        image: get.imageUrl.toString(),
                        price: get.price!,
                        title: get.name.toString(),
                        index: index,
                      );
                    },
                    itemCount: cubit.cartItems.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 150.w / 200.h),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
