import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../presentation/screens/authentication_screen.dart';
import '../theme/color.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorName.mainColor),
        useMaterial3: true,
      ),
      home: const AuthenticationScreen(),
    );
  }
}