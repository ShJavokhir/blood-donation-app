import 'package:blood_donation/app/data/colors.dart';
import 'package:blood_donation/app/widgets/CustomButton.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/slider_controller.dart';
import 'package:sizer/sizer.dart';


class SliderView extends GetView<SliderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 5.h,),
              Image.asset(
                'assets/1.png',
                width: 378.0,
                height: 253.0,
                fit: BoxFit.fill,
              ),
              Expanded(child: Container()),

              Text("Become a volunteer today and help people",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.dark_color_1,
                  fontSize: 20.sp,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600
              ),
              ),
              Expanded(child: Container()),
              Padding(
                padding: EdgeInsets.all(20)
              ,child: CustomButton(text: "Get Started", backgroundColor: AppColors.red_color_1, onPressed: (){

                Get.offAllNamed('/auth');
              })),
              SizedBox(height: 4.h,)
            ],
          )
        )
    );
  }
}

