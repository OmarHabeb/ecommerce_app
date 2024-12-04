import 'package:ecommerce_app/controllers/features/cart_cubit/cubit/cart_cubit.dart';
import 'package:ecommerce_app/core/helpers/navigation_helper.dart';
import 'package:ecommerce_app/view/screens/app/cart/checkout_screen.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            var cartCubit = CartCubit.get(context);
            return Column(
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
                          Text("Discount",
                              style: TextStyle(color: Colors.white)),
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
                        text: "Checkout",
                        width: MediaQuery.of(context).size.width))
              ],
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              var cartCubit = CartCubit.get(context);
              return BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  var loginCubit = LoginCubit.get(context);

                  // Check if userId is available before calling fetchCart
                  if (loginCubit.userId == null) {
                    return Center(child: Text("User not logged in"));
                  }

                  return FutureBuilder<List<dynamic>>(
                    future: cartCubit.fetchCart(loginCubit.userId.toString()),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }

                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(child: Text('Your cart is empty.'));
                      }

                      var cartItems = snapshot.data!;

                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          var item = cartItems[index];
                          return ListTile(
                            title: Text(item['product_name']),
                            subtitle: Text('Quantity: ${item['quantity']}'),
                            trailing: Text('\$${item['product_price']}'),
                          );
                        },
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
