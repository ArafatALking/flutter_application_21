import 'package:flutter/material.dart';
import 'package:get/get.dart';

// استيراد الملفات المطلوبة
import 'about_page.dart';
import 'dashboard_page.dart';
import 'login_page.dart';
// ignore: unused_import
import 'student_from_dialog.dart';
import 'student_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0XFF005C9F),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Tajawal',
      ),
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/dashboard', page: () => DashboardPage()),
        GetPage(name: '/students', page: () => StudentListPage()),
        GetPage(name: '/about', page: () => const AboutPage()),
      ],
      builder: (context, child) => Directionality(
        textDirection: TextDirection.rtl,
        child: child!,
      ),
    );
  }
}
