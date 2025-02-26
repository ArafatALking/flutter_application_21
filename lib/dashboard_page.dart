import 'package:flutter/material.dart';
import 'custom_drawer.dart';

import 'student_data_manager.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Customdrawer(),
      appBar: AppBar(
        title: const Text('الصفحة الرئيسية'),
        backgroundColor: const Color(0XFF005C9F),
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0XFF005C9F),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'عدد الطلاب: ${DataStorage().students.length}',
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
