import 'dart:async';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedprefrencelogin/home_screen.dart';
import 'package:sharedprefrencelogin/student.dart';
import 'package:sharedprefrencelogin/teacher.dart';

import 'login.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    isLogin();

  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool('isLogin') ?? false;
    String userType = sp.getString('userType') ?? '';

    if (isLogin){

      if(userType == 'student'){
        Timer(Duration(seconds : 2 ), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context)  =>  StudentScreen()));
        });


      }
      else if(userType == 'teacher'){
        Timer(Duration(seconds : 2 ), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context)  =>  TeacherView()));
        });

      }
      else {
        Timer(Duration(seconds : 2 ), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context)  =>  HomeScreen()));
        });

      }

    }
    else {
      Timer(Duration(seconds : 2 ), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context)  =>  Login()));
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Image(
        height: double.infinity,
        fit: BoxFit.fitHeight,

        image: NetworkImage('https://scontent.fmux1-1.fna.fbcdn.net/v/t39.30808-6/327973512_915652412762087_8640491059570170318_n.jpg?_nc_cat=111&cb=99be929b-59f725be&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeHXT-yfVF4Wef1PrUxYpAF0bFHE_maZYjpsUcT-ZpliOvrl7599zXaUhFE0-d0_1_w0uel_20BVtbnZX15-QCBV&_nc_ohc=KTd_fl3nNeUAX-mwuE0&_nc_ht=scontent.fmux1-1.fna&oh=00_AfD_y_7vCEm2jDT88pg3sef6gHpnmB39cd2pM5xq4VhXDQ&oe=64C2DF0C'),

      ),

    );
  }
}
