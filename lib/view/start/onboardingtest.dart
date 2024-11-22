import 'package:ecommerce_app/view/start/data.dart';
import 'package:flutter/material.dart';

class Onboardingtest extends StatefulWidget {
  const Onboardingtest({super.key});

  @override
  State<Onboardingtest> createState() => _OnboardingtestState();
}

class _OnboardingtestState extends State<Onboardingtest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height:  MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/background.png"), fit: BoxFit.cover, alignment: Alignment.bottomCenter)
            ),),
          
          PageView.builder(
          itemCount: images.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height:  MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(images[index]["image"].toString()), fit: BoxFit.contain, alignment: Alignment.bottomCenter)
            ),
            child: Container(
              margin: EdgeInsets.only(top: 280, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(images[index]["title"].toString(), style: TextStyle(fontSize: 30, color: Colors.white))
                ],
              ),
            ),
          );
        },),
      ]),
    );
  }
}