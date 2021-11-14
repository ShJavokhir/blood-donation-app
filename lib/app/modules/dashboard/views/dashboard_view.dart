import 'package:blood_donation/app/data/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {

  @override
  Widget build(BuildContext context) {
    print(controller.requests.length.toString() + " here");
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            SvgPicture.asset(
                'assets/back1.svg',
                height: 300,
                alignment: Alignment.center,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.cover,
                semanticsLabel: 'A red up arrow'
            ),

            Column(
              children: [
                SizedBox(height: 13.h),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: double.infinity,
                  child: Text("Hi",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: AppColors.white_1,
                        fontSize: 20.sp,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: double.infinity,
                  child: Text("Dear Supporter 👋",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: AppColors.white_1,
                        fontSize: 20.sp,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w800
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.white_1,
                  ),

                  width: double.infinity,
                  height: 24.h,
                  child: Column(
                    children: [
                      SizedBox(height: 3.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [MenuButton1(), MenuButton2()],
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 5.h,),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, -2.0), //(x,y)
                          blurRadius: 15.0,
                        ),],
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white
                    ),
                    child: GetBuilder<DashboardController>(
                      init: DashboardController(),
                      builder: (controller) => ListView(
                        physics: AlwaysScrollableScrollPhysics(),
                        children: [
                          ...controller.requests.map((e) =>
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5), child: DonatorRecord(date: e.time??'', location: e.location??"", status: record_status.WAITING))
                          ).toList(),
                          // DonatorRecord(date: "12.01.2002",location: "Tashkent",status: record_status.WAITING),
                          // SizedBox(height: 20, ),
                          // DonatorRecord(date: "12.01.2002",location: "Tashkent",status: record_status.FINISHED),
                          // SizedBox(height: 20,),
                          // DonatorRecord(date: "12.01.2002",location: "Tashkent",status: record_status.FINISHED),
                          // SizedBox(height: 20,),
                          // DonatorRecord(date: "12.01.2002",location: "Tashkent",status: record_status.FINISHED),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),

          ],
        )
        ),
    );
  }
}

class MenuButton1 extends StatelessWidget {
  const MenuButton1() : super();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        DashboardController controller = Get.find();
        controller.donateBlood();
        print("add donor");
      },
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            width: 172,
            height: 172,
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, 2.0), //(x,y)
                  blurRadius: 10.0,
                ),],
                color: Colors.white,
                borderRadius: BorderRadius.circular(25)

            ),
            child: Column(
              children: [
                SizedBox(height: 2.h,),
                Image.asset('assets/blood-donation.png', height: 8.h,),
                // SvgPicture.asset(
                //     'assets/back1.svg',
                //     height: 300,
                //     alignment: Alignment.center,
                //     allowDrawingOutsideViewBox: true,
                //     fit: BoxFit.cover,
                //     semanticsLabel: 'A red up arrow'
                // ),
                SizedBox(height: 2.h,),
                Text("Become a Donor",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.dark_color_1,
                      fontSize: 13.sp,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w800
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            bottom: -20,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(

                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 2.0), //(x,y)
                    blurRadius: 10.0,
                  ),],
                ),
                child: CircleAvatar(
                  backgroundColor: AppColors.white_1,
                  maxRadius: 25,
                  child: Icon(Icons.arrow_forward, size: 25.sp, color: AppColors.dark_color_1,),
                ),
              ),
            ),
          ),


        ],

      ),
    );
  }
}

class MenuButton2 extends StatelessWidget {
  const MenuButton2() : super();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print("Donate");
        showAlertDialog(Get.context!);
      },
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            width: 172,
            height: 172,
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, 2.0), //(x,y)
                  blurRadius: 10.0,
                ),],
                color: Colors.white,
                borderRadius: BorderRadius.circular(25)

            ),
            child: Column(
              children: [
                SizedBox(height: 2.h,),
                Image.asset('assets/donation-2.png', height: 8.h,),
                // SvgPicture.asset(
                //     'assets/back1.svg',
                //     height: 300,
                //     alignment: Alignment.center,
                //     allowDrawingOutsideViewBox: true,
                //     fit: BoxFit.cover,
                //     semanticsLabel: 'A red up arrow'
                // ),
                SizedBox(height: 2.h,),
                Text("Donate",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.dark_color_1,
                      fontSize: 13.sp,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w800
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            bottom: -20,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(

                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 2.0), //(x,y)
                    blurRadius: 10.0,
                  ),],
                ),
                child: CircleAvatar(
                  backgroundColor: AppColors.white_1,
                  maxRadius: 25,
                  child: Icon(Icons.arrow_forward, size: 25.sp, color: AppColors.dark_color_1,),
                ),
              ),
            ),
          ),


        ],

      ),
    );
  }
  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () { },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Donate money"),
      content: Text("8600 1111 2222 3333\n\nYou can send any amount of money to the Uzcard number above in order to support  those who need help"),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
enum record_status{
  WAITING,
  FINISHED
}
class DonatorRecord extends StatelessWidget {

  final String date;
  final String location;
  final record_status status;

  DonatorRecord({required this.date, required this.location, required this.status}) : super();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.white_2.withOpacity(0.5),
      ),
      width: double.infinity,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.calendar_today_outlined, color: AppColors.dark_color_1, size: 11.sp,),
                        Text("Date:",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: AppColors.dark_color_1,
                              fontSize: 12.sp,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ]
                    ),
                    Text(date,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: AppColors.dark_color_1,
                          fontSize: 12.sp,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w800
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        children: [
                          Icon(Icons.location_on_outlined, color: AppColors.dark_color_1, size: 11.sp,),
                          Text("Location:",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: AppColors.dark_color_1,
                                fontSize: 12.sp,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ]
                    ),
                    Text(location,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: AppColors.dark_color_1,
                          fontSize: 12.sp,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w800
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Icon(Icons.star_border, color: AppColors.dark_color_1, size: 11.sp,),
                          Text("Status:",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: AppColors.dark_color_1,
                                fontSize: 12.sp,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ]
                    ),
                    Text(status==record_status.FINISHED?'Finished':'Waiting',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: AppColors.dark_color_1,
                          fontSize: 12.sp,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w800
                      ),
                    ),
                  ],
                )

              ],
            ),
          ),
          SizedBox(width: 60,),
          Icon(
            status==record_status.FINISHED?Icons.done_all:Icons.access_alarm, color: status==record_status.FINISHED?Colors.greenAccent:Colors.orangeAccent, size: 35.sp,
          )
        ],
      ),

    );
  }
}


