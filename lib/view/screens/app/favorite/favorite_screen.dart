import 'package:ecommerce_app/controllers/auth/cart/cubit/cart_cubit.dart';
import 'package:ecommerce_app/controllers/features/favorite_cubit/cubit/favorite_cubit.dart';
import 'package:ecommerce_app/view/screens/app/home/home/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = FavoriteCubit.get(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.w),
          margin: EdgeInsets.only(top: 30.w),
          child: Column(
            children: [
              SizedBox(height: 15.h),
              BlocBuilder<FavoriteCubit, FavoriteState>(
                builder: (context, state) {
                  if (cubit.cartItems.isEmpty) {
                    return Center(child: Text("No items added"));
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
