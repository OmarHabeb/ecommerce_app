import 'package:ecommerce_app/core/style/colors.dart';
import 'package:ecommerce_app/view/widgets/back_arrow_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularShoesScreen extends StatelessWidget {
  const PopularShoesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackArrowButton(),
        title: Text(
          "Popular Shoes",
          style: TextStyle(color: textWhiteColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.w),
          // child: ,
        ),
      ),
    );
  }
}
