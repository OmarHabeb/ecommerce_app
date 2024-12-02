import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainerAccountSetting extends StatelessWidget {
  String text;
  Icon icon;
  CustomContainerAccountSetting({
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 50.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15.w)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              icon,
              SizedBox(
                width: 15,
              ),
              Text(
                text,
                style: TextStyle(color: Colors.grey, fontSize: 17),
              ),
            ],
          ),
          Icon(
            Icons.keyboard_arrow_right_outlined,
            color: Colors.grey,
            size: 30,
          ),
        ],
      ),
    );
  }
}
