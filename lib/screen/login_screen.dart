import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyLoginScreen extends StatelessWidget {
  const MyLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('로그인 화면'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Center(child: FlutterLogo(size:100),),
              const SizedBox(height: 16,),
              const TextField(decoration: InputDecoration(labelText: '이메일')),
              const SizedBox(height: 16,),
              const TextField(
                //비밀번호 마스킹 처리
                  obscureText: true,
                  decoration: InputDecoration(labelText: '패스워드')),


            ],
          ),
        ),
      ),
    );

  }
}
