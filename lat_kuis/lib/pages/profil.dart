import 'package:flutter/material.dart';
import '../pages/login.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(onPressed: (){
        Navigator.pushAndRemoveUntil(
          context, 
          MaterialPageRoute(builder: (context) => LoginPage()), 
          (route) => false,
          );
      }, child: Text("Logout")),
    );
  }
}