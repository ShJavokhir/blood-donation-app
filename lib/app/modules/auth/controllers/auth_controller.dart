//import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthController
  //final FirebaseAuth _auth = FirebaseAuth.instance;

  final count = 0.obs;
  @override
  void onInit() {
    print("hi");
    super.onInit();
    print("hi");
    //final user =  _auth.signInWithEmailAndPassword(email: 'test@gmail.com', password: 'testtest');
    //print(user.credential);

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
