import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //للتحكم في نوع الإدخال
import 'package:get/get.dart';
import 'package:test_pdf/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _formKey =
      GlobalKey<FormState>(); //لتتبع حالة النموذج والتحقق من صحة الحقول

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          color: const Color(0XFF005C9F),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  fillColor: Color.fromRGBO(255, 255, 255, 1),
                  labelText: 'اسم المستخدم',
                  labelStyle:
                      TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                //استخدمتها لدعم خاصية التحقق بدل TextField
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'البريد الالكتروني',
                  labelStyle:
                      TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال البريد الإلكتروني';
                  }
                  if (!RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$') // للتحقق من صيغة البريد الإلكتروني
                      .hasMatch(value)) {
                    return 'البريد الالكتروني يجب ان يكون بريد الكتروني صحيح';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ], //يسمح بإدخال الأرقام فقط
                decoration: const InputDecoration(
                  labelText: 'كلمة المرور',
                  labelStyle:
                      TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال كلمة المرور';
                  }
                  if (value.length != 6 ||
                      !RegExp(r'^[0-9]+$').hasMatch(
                          value)) //يتحقق من أن طول كلمة المرور 6 أحرف بالضبط
                  //يتأكد أن جميع الأحرف أرقام فقط
                  {
                    return 'كلمة المرور يجب ان تتكون من سته ارقام';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Get.to(() => DashboardPage());
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Signup ?Does not have account',
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
