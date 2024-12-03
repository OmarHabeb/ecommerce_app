import 'package:ecommerce_app/controllers/data/products/products_cubit.dart';
import 'package:ecommerce_app/core/helpers/navigation_helper.dart';
import 'package:ecommerce_app/core/style/colors.dart';
import 'package:ecommerce_app/view/screens/app/home/home/custom_container.dart';
import 'package:ecommerce_app/view/screens/app/home/productsDetials/product_detials_screen.dart';
import 'package:ecommerce_app/view/widgets/back_arrow_button.dart';
import 'package:ecommerce_app/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularShoesScreen extends StatelessWidget {
  const PopularShoesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        leading: Container(
            margin: EdgeInsets.only(left: 15), child: BackArrowButton()),
        title: Text(
          "Popular Shoes",
          style: TextStyle(color: textWhiteColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.w),
          margin: EdgeInsets.only(top: 30.w),
          child: Column(
            children: [
              CustomTextField(
                labelText: "Looking for shoes",
                prefix: Icon(Icons.search),
              ),
              SizedBox(
                height: 15.h,
              ),
              BlocBuilder<ProductsCubit, ProductsState>(
                builder: (context, state) {
                  var cubit = ProductsCubit.get(context);

                  cubit.getProducts();
                  return state is GetProcuctsSuccess
                      ? GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var get = cubit.products[index];
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
                              ),
                            );
                          },
                          itemCount: cubit.products.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 150.w / 200.h),
                        )
                      : Container(
                          width: MediaQuery.of(context).size.width,
                          height: 500,
                          color: Colors.black26,
                          child: Center(
                            child: Text(
                              "Data empty",
                              style: TextStyle(
                                  color: textWhiteColor, fontSize: 20.sp),
                            ),
                          ),
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
