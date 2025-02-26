import 'package:flutter/material.dart';
import 'student_data_manager.dart'; // تأكد من استيراد ملف التخزين
// ignore: unused_import
import 'student_from_dialog.dart'; // استيراد نموذج الطالب

class AccountDataPage extends StatefulWidget {
  const AccountDataPage({super.key, required List students});

  @override
  State<AccountDataPage> createState() => _AccountDataPageState();
}

class _AccountDataPageState extends State<AccountDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('بيانات الحساب'),
        backgroundColor: const Color(0XFF005C9F),
      ),
      backgroundColor: Color(0XFF005C9F),
      body: DataStorage().students.isEmpty
          ? const Center(
              child: Text(
                'لا يوجد بيانات',
                style: TextStyle(color: Colors.white),
              ),
            )
          : ListView.builder(
              itemCount: DataStorage().students.length,
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.all(8),
                color: Colors.white.withOpacity(0.1),
                child: ListTile(
                  title: Text(
                    DataStorage().students[index].name,
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'العمر: ${DataStorage().students[index].age}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        'السورة: ${DataStorage().students[index].surah}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
