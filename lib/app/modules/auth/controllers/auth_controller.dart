//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthController
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final count = 0.obs;
  @override
  void onInit() async{
    print("hi");
    super.onInit();
    print("hi");
    //final user =await  _auth.signInWithEmailAndPassword(email: 'test@gmail.com', password: 'testtest');
    //print(user.credential);
    //print(user.user?.email);

  }

  Future<String?> signIn(LoginData loginData)async{
      try{
        await _auth.signInWithEmailAndPassword(email: loginData.name, password: loginData.password);
      }catch(err){
        return Future.value(err.toString());
      }

      if(_auth.currentUser == null){
        return Future.value("Error: Email or password incorrect");
      }

    return Future.value(null);
  }

  Future<String?> signUp(LoginData loginData)async{
    try{
      await _auth.createUserWithEmailAndPassword(email: loginData.name, password: loginData.password);
    }catch(err){
      return Future.value(err.toString());
    }

    try{
      await _auth.signInWithEmailAndPassword(email: loginData.name, password: loginData.password);
    }catch(err){
      return Future.value(err.toString());
    }

    if(_auth.currentUser == null){
      return Future.value("Error: Email or password incorrect");
    }

    return Future.value(null);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
