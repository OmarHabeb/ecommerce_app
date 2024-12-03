import 'package:ecommerce_app/controllers/data/products/products_cubit.dart';
import 'package:ecommerce_app/core/style/colors.dart';
import 'package:ecommerce_app/view/screens/app/home/productsDetials/data.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetialsScreen extends StatelessWidget {
  final int index;

  ProductDetialsScreen({required this.index});

  ValueNotifier<int> isSelected = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        var cubit = ProductsCubit.get(context);
        cubit.getProducts();
        var get = cubit.products[index];
        return state is GetProcuctsSuccess
            ? Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(get.imageUrl.toString()))),
                child: DraggableScrollableSheet(
                  minChildSize: 0.2,
                  maxChildSize: 0.5,
                  builder: (context, ScrollController scrollController) {
                    return SingleChildScrollView(
                      controller: scrollController,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 17, 17, 17),
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(25.0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              get.name.toString(),
                              style: TextStyle(
                                  color: textWhiteColor,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              get.description.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.sp,
                              ),
                            ),
                            Text(
                              "Size",
                              style: TextStyle(
                                  color: textWhiteColor,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              height: 100,
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return ValueListenableBuilder<int>(
                                        valueListenable: isSelected,
                                        builder: (context, value, _) {
                                          return GestureDetector(
                                            onTap: () {
                                             isSelected.value = index ;
                                            },
                                            child: Container(
                                              width: 50.w,
                                              height: 50.h,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color:
                                                          secondPrimaryColor),
                                                  color: value == index
                                                      ? secondPrimaryColor
                                                      : Colors.transparent),
                                              child: Center(
                                                child: Text(
                                                  sizeOfShoese[index],
                                                  style: TextStyle(
                                                      color: textWhiteColor),
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      width: 15.w,
                                    );
                                  },
                                  itemCount: sizeOfShoese.length),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$ ${get.price}",
                                  style: TextStyle(
                                    color: secondPrimaryColor,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                CustomButton(
                                  text: "Add to cart",
                                  width: 200,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ))
            : Center(
                child: Text(
                  "no data",
                  style: TextStyle(fontSize: 30),
                ),
              );
      },
    ));
  }
}
