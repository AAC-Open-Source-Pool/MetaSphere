import 'package:flutter/material.dart';
import 'package:smetasphere/pages/SignupPage.dart';
import 'package:smetasphere/pages/login_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //initially,show login page
  bool showLoginPage=true;
  void toggleScreens(){
    setState(() {
      showLoginPage=!showLoginPage;
    });

  }
  @override
  Widget build(BuildContext context) {
    if (showLoginPage){
      return LoginPage(showSignupPage: toggleScreens);
    }else{
      return SignupPage(showLoginPage:toggleScreens);
    }
  }
}