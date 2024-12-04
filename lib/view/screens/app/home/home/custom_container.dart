import 'package:ecommerce_app/controllers/auth/cart/cubit/cart_cubit.dart';
import 'package:ecommerce_app/controllers/data/products/products_cubit.dart';
import 'package:ecommerce_app/controllers/features/favorite_cubit/cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  final String image;
  final String title;
  final double price;
  final int index;
  CustomContainer(
      {required this.image,
      required this.title,
      required this.price,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(15.h),
          width: 180.w,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15.w)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 137.w,
                height: 100.h,
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(image))),
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF2F2F2)),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "\$${price}",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Color(0xFF8C6658),
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: Color(0xFF8C6658),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(7),
                    bottomRight: Radius.circular(15))),
            child: IconButton(
                onPressed: () {
                  var cubit = CartCubit.get(context);
                  var cubit2 = ProductsCubit.get(context);
                  cubit.addToCart(cubit2.products[index]);
                },
                icon: Icon(Icons.add)),
          ),
        ),
        Positioned(
            right: 15,
            top: 15,
            child: IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () {
                var cubit = FavoriteCubit.get(context);
                var cubit2 = ProductsCubit.get(context);
                cubit.addToCart(cubit2.products[index]);
              },
            ))
      ],
    );
  }
}
