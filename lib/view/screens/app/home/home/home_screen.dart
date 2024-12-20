import 'package:ecommerce_app/controllers/data/products/products_cubit.dart';
import 'package:ecommerce_app/core/helpers/navigation_helper.dart';
import 'package:ecommerce_app/core/style/colors.dart';
import 'package:ecommerce_app/view/screens/app/home/home/custom_container.dart';
import 'package:ecommerce_app/view/screens/app/home/popular_shoes_screen.dart';
import 'package:ecommerce_app/view/screens/app/home/productsDetials/product_detials_screen.dart';
import 'package:ecommerce_app/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.w),
          margin: EdgeInsets.only(top: 30.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(color: Colors.white, fontSize: 40.sp),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF8C6658)),
                        borderRadius: BorderRadius.circular(15.w)),
                    child: IconButton(
                        onPressed: () {}, icon: Icon(Icons.notifications)),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextField(
                labelText: "Looking for shoes",
                prefix: Icon(Icons.search),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Shoes",
                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      NavigationHelper.goTo(context, PopularShoesScreen());
                    },
                    child: Text(
                      "See all",
                      style:
                          TextStyle(color: Color(0xFF8C6658), fontSize: 16.sp),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              BlocBuilder<ProductsCubit, ProductsState>(
                builder: (context, state) {
                  var cubit = ProductsCubit.get(context);
                  cubit.getProducts();
                  return state is GetProcuctsSuccess
                      ? Column(
                          children: [
                            Container(
                              height: 270,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      NavigationHelper.goTo(
                                          context,
                                          ProductDetialsScreen(
                                            index: index,
                                          ));
                                    },
                                    child: CustomContainer(
                                      image: cubit.products[index].imageUrl!,
                                      title: cubit.products[index].name!,
                                      price: cubit.products[index].price!,
                                      index: index,
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    width: 15.w,
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "New Arrivals",
                                  style: TextStyle(
                                      fontSize: 16.sp, color: Colors.white),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "See all",
                                    style: TextStyle(
                                        color: Color(0xFF8C6658),
                                        fontSize: 16.sp),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                NavigationHelper.goTo(
                                    context, ProductDetialsScreen(index: 3));
                              },
                              child: Container(
                                height: 120.h,
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.w),
                                  color: Colors.black.withOpacity(0.1),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cubit.products[3].name!,
                                          style: TextStyle(
                                            color: textWhiteColor,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          "\$${cubit.products[3].price}",
                                          style: TextStyle(
                                              color: secondPrimaryColor,
                                              fontSize: 20.sp),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: 80.w,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image: NetworkImage(cubit
                                            .products[3].imageUrl
                                            .toString()),
                                      )),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      : Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
