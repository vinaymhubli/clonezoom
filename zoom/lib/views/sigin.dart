import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom/resources/auth.dart';
import 'package:zoom/utils/colors.dart';
import 'package:zoom/views/zoom_home.dart';
import 'package:zoom/widget/button.dart';

class Signin extends StatefulWidget {
  Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  final AuthMethods _authMethods = AuthMethods();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Start or join a meeting",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: footerColor, fontSize: 25),
          ),
          Lottie.asset("assets/images/zoom.json"),
          SizedBox(height: 20.0),
          Button(
              text: "Join a Meeting",
              onPressed: () async {
                bool res = await _authMethods.signInWithGoogle(context);
                if(res){
                   Navigator.pushNamed(context, '/home');
                }
              }),
          SizedBox(
            height: 80,
          )
        ],
      ),
    );
  }
}
