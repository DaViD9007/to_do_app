import 'package:flutter/material.dart';
import 'package:to_do_app/screens/SignUp.dart';
import 'package:to_do_app/screens/login.dart';

class AuthPage extends StatefulWidget{
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage>{
  bool a=true;
  void to(){
    setState(() {
      a=!a;
    });
  }



  @override
  Widget build(BuildContext context) {
    if(a) {
      return LoginScreen(to);
    }
    else {
      return SignupScreen(to);
    }
  }
}