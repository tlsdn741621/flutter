import 'package:hello_flutter/screen/my_splash2.dart';
import 'package:hello_flutter/screen/pd_data/food_screen.dart';
import 'package:hello_flutter/screen/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'main_screen.dart';

class MyAppRouting extends StatelessWidget {
  const MyAppRouting({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MySplash2(),
      //라우팅 준비물 1,
      routes: {
        '/main': (context) => const MyMainScreen(),
        '/signup': (context) => const MySignUpScreen(),
        '/login': (context) => const MyLoginScreen(),
        // 공공데이터 받아 오는 화면으로 라우팅 추가.
        '/pdtest': (context) => const MyPdTestScreen(),
      },
    );
  }
}
