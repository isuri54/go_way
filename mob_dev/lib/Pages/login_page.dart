import 'package:flutter/material.dart';

class login_page extends StatelessWidget {
  const login_page ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Container(
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.black,
              fontSize: 50,
            ) ,
          ),
        ),
      ),
    );
  }
}
