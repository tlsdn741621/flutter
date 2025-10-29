import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import '../controller/auth/login_controller.dart';

class MainScreen2 extends StatefulWidget {
  const MainScreen2({super.key});

  @override
  State<MainScreen2> createState() => _MainScreen2State();
}

class _MainScreen2State extends State<MainScreen2> {
  // 보안 저장소에 저장된, 로그인 된 유저 정보를 가져오기 준비 작업.
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  String? userId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadUserId();
  }
  // 보안 저장소에서 로그인한 유저 ID 불러오기
  Future<void> _loadUserId() async {
    String? mid = await secureStorage.read(key: "mid"); // 저장된 ID 가져오기
    setState(() {
      userId = mid;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginController = context.watch<LoginController>();

    return Scaffold(
      appBar: AppBar(title: const Text('메인화면'),
        actions: [
          // 로그인 상태 일때만, 로그아웃 버튼 표시
          if(loginController.isLoggedIn)
            IconButton(onPressed: () => loginController.showLogoutDialog(context),
                icon: const Icon(Icons.logout))
        ],
      ),
      // 로그아웃 기능 추가.

      body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // 로그인한 유저의 상태를 표시 하는 화면을 구성.
              Center(
                child: Text(
                  userId != null ? "환영합니다, $userId님!" : "로그인이 필요합니다.",
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16,),
              const Center(child: FlutterLogo(size:100),),
              const SizedBox(height: 16,),
              ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/login'),
                  child: const Text('로그인')),

              ElevatedButton(
                //라우팅 2번 째 준비물,
                onPressed: () => Navigator.pushNamed(context, '/signup'),
                child: const Text('회원 가입'),
              ),

              if(loginController.isLoggedIn)
                ElevatedButton(
                  //라우팅 2번 째 준비물,
                  onPressed: () => Navigator.pushNamed(context, '/pdtest'),
                  child: const Text('부산 맛집 공공 데이터'),
                ),

              if(loginController.isLoggedIn)
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/sample_design'),
                  child: const Text('샘플 디자인1-중첩리스트'),
                ),
              if(loginController.isLoggedIn)
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/sample_design2'),
                  child: const Text('샘플 디자인2-탭모드'),
                ),
              if(loginController.isLoggedIn)
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/sample_design3'),
                  child: const Text('샘플 디자인3-드로워-네비게이션'),
                ),
            ],
          )),
    );
  }
}
