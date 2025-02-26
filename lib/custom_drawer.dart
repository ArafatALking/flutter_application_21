import 'package:flutter/material.dart';
import 'package:test_pdf/about_page.dart';
import 'account_data_page.dart';
import 'dashboard_page.dart';
import 'student_list_page.dart';

class Customdrawer extends StatelessWidget {
  const Customdrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 2, //الغرض: نصف عرض الشاشة
      child: SingleChildScrollView(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color(0XFF005c9f)),
              accountName: Text("AL_king"),
              accountEmail:
                  Text("Arafat_AL_Doais@gmail.com\naziz_albtol@gmail.com"),
            ),
            tile(
              title: "الصفحة الرئيسية",
              iconLeading: Icons.dashboard,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DashboardPage(),
                  ),
                );
              },
            ),
            const Divider(),
            tile(
              title: "سجل الطلاب",
              iconLeading: Icons.perm_contact_cal_sharp,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => StudentListPage(),
                  ),
                );
              },
            ),
            const Divider(),
            tile(
                title: "بيانات الحساب",
                iconLeading: Icons.person,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AccountDataPage(
                        students: [],
                      ),
                    ),
                  );
                }),

            const Divider(),
            tile(
                title: "حول التطبيق",
                iconLeading: Icons.info,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AboutPage(),
                    ),
                  );
                }),
            // const Divider(),
          ],
        ),
      ),
    );
  }
}

Widget tile(
    {required String title, required var iconLeading, Function()? onTap}) {
  return ListTile(
    title: Text(
      title,
      style: const TextStyle(
        color: Color.fromARGB(255, 6, 36, 87),
        fontWeight: FontWeight.bold,
        fontSize: 17,
      ),
    ),
    leading: Icon(
      iconLeading,
      size: 30,
    ),
    iconColor: const Color(0XFF005c9f),
    onTap: onTap,
  );
}
