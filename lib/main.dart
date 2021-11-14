import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'app/routes/app_pages.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  //_auth.signOut();
  if(_auth.currentUser == null){
    runApp(Sizer(
        builder: (context, orientation, deviceType) {
          return GetMaterialApp(
            title: "Application",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
          );
        }
    ));
  }else{
    runApp(
    Sizer(
    builder: (context, orientation, deviceType) {
  return GetMaterialApp(
  title: "Application",
  initialRoute: AppPages.LOGGED_IN,
  getPages: AppPages.routes,
  );
  }
  ),
    );
  }

}
