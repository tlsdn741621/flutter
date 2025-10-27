import 'package:hello_flutter/screen/login_screen.dart';
import 'package:hello_flutter/screen/main_screen.dart';
import 'package:hello_flutter/screen/my_app_routing.dart';
import 'package:hello_flutter/screen/my_splash.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/screen/my_splash2.dart';
import 'package:provider/provider.dart';

import 'controller/pd_data/food_controller.dart';
import 'screen/sample_my_app1.dart';

void main() {
  // runApp( MySplash() ); // runApp
  // runApp( MyLoginScreen() ); // runApp
  // runApp( MyMainScreen() ); // runApp
  // runApp( MyAppRouting() ); // runApp
  // runApp( MyApp() ); // runApp
  // runApp( MySplash2() ); // runApp
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => FoodController())
        ],
        child: const MyAppRouting(),)
  );
} // main()