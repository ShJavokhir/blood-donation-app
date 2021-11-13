
import 'package:blood_donation/app/data/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
/**
 * Created by IntelliJ IDEA.<br/>
 * User: javokhir<br/>
 * Date: 13/11/21<br/>
 * Time: 08:48<br/>
 */


class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color backgroundColor;
  const CustomButton({required this.text, required this.backgroundColor, required this.onPressed}) : super();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
              backgroundColor
          )

      ),

      onPressed: onPressed,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 10,),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w800
              ),
            ),
          ]
      ),
    );
  }
}