import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Stack(
            children: [
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30)),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(30),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
