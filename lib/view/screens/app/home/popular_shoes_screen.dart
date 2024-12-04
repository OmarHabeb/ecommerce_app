import 'package:ecommerce_app/controllers/data/products/products_cubit.dart';
import 'package:ecommerce_app/core/helpers/navigation_helper.dart';
import 'package:ecommerce_app/core/style/colors.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view/screens/app/cart/cart_screen.dart';
import 'package:ecommerce_app/view/screens/app/home/home/custom_container.dart';
import 'package:ecommerce_app/view/screens/app/home/productsDetials/product_detials_screen.dart';
import 'package:ecommerce_app/view/widgets/back_arrow_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularShoesScreen extends StatelessWidget {
  const PopularShoesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = ProductsCubit.get(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        leading: Container(
            margin: EdgeInsets.only(left: 15), child: BackArrowButton()),
        title: Text(
          "Popular Shoes",
          style: TextStyle(color: textWhiteColor),
        ),
        actions: [
          IconButton(
              onPressed: () {
                NavigationHelper.goTo(context, CartScreen());
              },
              icon: Icon(Icons.card_travel))
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.w),
          margin: EdgeInsets.only(top: 30.w),
          child: Column(
            children: [
              TextField(
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  cubit.search(value);
                },
                decoration: InputDecoration(
                  fillColor: secondPrimaryColor,
                  filled: true,
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: "search....",
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 18.h,
                    horizontal: 16.w,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(22, 31, 40, 1),
                      width: 0.5.w,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                    borderSide: BorderSide(
                      color: Color(0xFF8C6658),
                      width: 2.0.w,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              BlocBuilder<ProductsCubit, ProductsState>(
                builder: (context, state) {
                  // List<ProductsModel> products = [];
                  cubit.getProducts();
                  if (state is SearchState) {
                    cubit.products = cubit.searchProducts;
                  }
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final get = cubit.products[index];
                      return GestureDetector(
                        onTap: () {
                          NavigationHelper.goTo(
                              context,
                              ProductDetialsScreen(
                                index: index,
                              ));
                        },
                        child: CustomContainer(
                          image: get.imageUrl.toString(),
                          price: get.price!,
                          title: get.name.toString(),
                          index: index,
                        ),
                      );
                    },
                    itemCount: cubit.products.length,
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
