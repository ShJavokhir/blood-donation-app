import 'package:blood_donation/app/data/colors.dart';
import 'package:blood_donation/app/data/request_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  final bloodTypes = ['1','1-','2+', '2-', '3+', '3-', '4+', '4-'];
  var selectedBloodType = '1'.obs;
  final phoneNumber = ''.obs;
  final fullName = ''.obs;
  final location = ''.obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var requests = [].obs;

  Future<void> fetchRequests()async{
    List<DonorModel> temp = [];
    //requests.clear();
    await firestore.collection('donorRequests').where('email', isEqualTo: await _auth.currentUser?.email).get().then((value)  {
      print("docs in server: " + value.docs.length.toString());
      for(int i = 0; i<value.docs.length; i++){
        print(i.toString() + "aaa");
        DonorModel model = DonorModel.fromJson(value.docs[i].data());
        temp.add(model);
      };
      requests.assignAll(temp);
      update();



    });
    requests.assignAll(temp);
    update();
  }

  @override
  void onInit() async{
    await fetchRequests();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> donateBlood()async{
    //firestore.collection('donorRequests').add({'hello': 'world'});
    Get.defaultDialog(
        title: "Donor request",
        middleText: "Please fill every field",
        backgroundColor: AppColors.dark_color_1,
        titleStyle: TextStyle(color: Colors.white),
        middleTextStyle: TextStyle(color: Colors.white),

        content: Obx(
              () => Container(
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(10,2,10,2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.white)
                    ),
                    child:DropdownButton<String>(
                      value: selectedBloodType.value,
                      items: bloodTypes.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: TextStyle(color: Colors.blueAccent),),
                        );
                      }).toList(),
                      onChanged: (goodName1) {
                        selectedBloodType.value = goodName1 ?? "";
                        //controller.tempPaymentName.value = goodName1 ?? "NULL";
                      },
                    )

                  /*TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: "Payment name",
                      labelStyle: TextStyle(color: Colors.blueAccent),
                      fillColor: Colors.blueAccent,
                      focusColor: Colors.blueAccent,
                      hoverColor: Colors.blueAccent,
                    ),
                    onChanged: (txt){
                      controller.tempPaymentName.value = txt;
                    },
                  ),*/
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.fromLTRB(10,2,10,2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.white)
                  ),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: "Phone number",
                      labelStyle: TextStyle(color: Colors.blueAccent),
                      fillColor: Colors.blueAccent,
                      focusColor: Colors.blueAccent,
                      hoverColor: Colors.blueAccent,
                    ),
                    onChanged: (txt){
                      phoneNumber.value = txt;
                      //controller.tempAccountNumber.value = int.parse(txt) ;
                    },
                  ),
                ),SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.fromLTRB(10,2,10,2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.white)
                  ),
                  child: TextField(
                    style: TextStyle(color: Colors.white),

                    decoration: InputDecoration(
                      labelText: "Full Name",
                      labelStyle: TextStyle(color: Colors.blueAccent),
                      fillColor: Colors.blueAccent,
                      focusColor: Colors.blueAccent,
                      hoverColor: Colors.blueAccent,
                    ),
                    onChanged: (txt){
                     // controller.tempAmountToSent.value = int.parse(txt) ;
                      fullName.value = txt;

                    },
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.fromLTRB(10,2,10,2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.white)
                  ),
                  child: TextField(
                    style: TextStyle(color: Colors.white),

                    decoration: InputDecoration(
                      labelText: "Location",
                      labelStyle: TextStyle(color: Colors.blueAccent),
                      fillColor: Colors.blueAccent,
                      focusColor: Colors.blueAccent,
                      hoverColor: Colors.blueAccent,
                    ),
                    onChanged: (txt){
                      // controller.tempAmountToSent.value = int.parse(txt) ;
                      location.value = txt;

                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        onConfirm: ()async{
          await sendBecomeDonorRequest();
          await fetchRequests();
          Navigator.of(Get.overlayContext!).pop();
          return;
          //await controller.makePayment();
          //Get.find<HomeController>().update1();

        },
        textConfirm: "Send",
        textCancel: "Cancel"


    );
  }

  Future<void> sendBecomeDonorRequest()async{
    DonorModel donor = new DonorModel(
      bloodType: selectedBloodType.value,
      email: await _auth.currentUser?.email.toString(),
      phoneNumber: phoneNumber.value,
      fullName: fullName.value,
      location: location.value,
      time: (DateTime.now().day.toString() + "." + DateTime.now().month.toString() + "." + DateTime.now().year.toString())
    );
    firestore.collection('donorRequests').add(donor.toJson());
  }
}
