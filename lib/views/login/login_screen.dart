import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'components/sign_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "Silahkan masukan email dan kata sandi yang telah diberikan.",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.grey[700]),
              ),
              SizedBox(height: 30),
              SignForm(),
              SizedBox(height: 20),
              // const NoAccountText(),
            ],
          ),
        ),
      ),
    );
  }
}
