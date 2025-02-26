import 'package:flutter/material.dart';
import 'package:test_pdf/dashboard_page.dart';
import 'student_data_manager.dart';
import 'student_from_dialog.dart';
import 'account_data_page.dart'; // استيراد الصفحة الجديدة

class StudentListPage extends StatefulWidget {
  @override
  _StudentListPageState createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  // استبدال القائمة المحلية بمخزن البيانات
  List<Student> get students => DataStorage().students;

  void _addStudent(Student student) {
    setState(() {
      DataStorage().students.add(student); // إضافة إلى المخزن العام
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('سجل الطالب'),
        backgroundColor: const Color(0XFF005C9F),
      ),
      drawer: _buildCustomDrawer(context),
      backgroundColor: const Color(0XFF005C9F),
      body: students.isEmpty
          ? const Center(
              child: Text(
                'لا يوجد طالب',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          : ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  students[index].name,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  'العمر: ${students[index].age}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddStudentDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildCustomDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0XFF005C9F),
      child: SafeArea(
        child: Column(
          children: [
            const DrawerHeader(
              child: Text(
                'القائمة الرئيسية',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildDrawerItem(
              text: "الصفحة الرئيسية",
              icon: Icons.dashboard,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DashboardPage(),
                  ),
                );
              },
            ),
            _buildDrawerItem(
              icon: Icons.account_circle,
              text: 'بيانات الحساب',
              onTap: () => _navigateToAccountData(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      onTap: onTap,
    );
  }

  void _navigateToAccountData(BuildContext context) {
    Navigator.pop(context); // إغلاق القائمة الجانبية
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AccountDataPage(students: students),
      ),
    );
  }

  void _showAddStudentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => StudentFormDialog(onAddStudent: _addStudent),
    );
  }
}
