import 'package:flutter/material.dart';

// 1. نقل نموذج الطالب إلى ملف منفصل (student_data_manager.dart)
// student_data_manager.dart
class Student {
  final String name;
  final int age;
  final String surah;

  Student({
    required this.name,
    required this.age,
    required this.surah,
  });
}

class StudentFormDialog extends StatefulWidget {
  final Function(Student) onAddStudent;

  const StudentFormDialog({super.key, required this.onAddStudent});

  @override
  State<StudentFormDialog> createState() => _StudentFormDialogState();
}

class _StudentFormDialogState extends State<StudentFormDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  String? _selectedSurah;

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "تشهيد",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0XFF005C9F),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0XFF005C9F),
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "تم الإضافة بنجاح",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFF005C9F),
                minimumSize: const Size(120, 45),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text(
                "موافق",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0XFF005C9F),
      title: const Text('اضافة سجل', textAlign: TextAlign.center),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                  labelText: 'الاسم',
                  labelStyle:
                      TextStyle(color: Color.fromRGBO(255, 255, 255, 1))),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'يرجى إدخال الاسم';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _ageController,
              decoration: const InputDecoration(
                  labelText: 'العمر',
                  labelStyle:
                      TextStyle(color: Color.fromRGBO(255, 255, 255, 1))),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'يرجى إدخال العمر';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                  labelText: 'السورة',
                  labelStyle:
                      TextStyle(color: Color.fromRGBO(255, 255, 255, 1))),
              value: _selectedSurah,
              items: [
                "الفاتحة",
                "البقرة",
                "آل عمران",
                "النساء",
                "المائدة",
                "الأنعام",
                "الأعراف",
                "الأنفال",
                "التوبة",
                "يونس",
                "هود",
                "يوسف",
                "الرعد",
                "إبراهيم",
                "الحجر",
                "النحل",
                "الإسراء",
                "الكهف",
                "مريم",
                "طه",
                "الأنبياء",
                "الحج",
                "المؤمنون",
                "النور",
                "الفرقان",
                "الشعراء",
                "النمل",
                "القصص",
                "العنكبوت",
                "الروم",
                "لقمان",
                "السجدة",
                "الأحزاب",
                "سبأ",
                "فاطر",
                "يس",
                "الصافات",
                "ص",
                "الزمر",
                "غافر",
                "فصلت",
                "الشورى",
                "الزخرف",
                "الدخان",
                "الجاثية",
                "الأحقاف",
                "محمد",
                "الفتح",
                "الحجرات",
                "ق",
                "الذاريات",
                "الطور",
                "النجم",
                "القمر",
                "الرحمن",
                "الواقعة",
                "الحديد",
                "المجادلة",
                "الحشر",
                "الممتحنة",
                "السجدة",
                "الصف",
                "الجمعة",
                "المنافقون",
                "التغابن",
                "الطلاق",
                "التحريم",
                "الملك",
                "القلم",
                "الحاقة",
                "المعارج",
                "نوح",
                "الجنوح",
                "المزمّل",
                "المدثر",
                "القيامة",
                "الإنسان",
                "المرسلات",
                "النبأ",
                "النازعات",
                "عبس",
                "التكوير",
                "الانفطار",
                "المطففين",
                "الانشقاق",
                "البروج",
                "التكاثر",
                "العصر",
                "الهُمَزَة",
                "الفيل",
                "قريش",
                "الماعون",
                "الكوثر",
                "الكافرون",
                "النصر",
                "المسد",
                "الإخلاص",
                "الفلق",
                "الناس",
              ]
                  .map<DropdownMenuItem<String>>((surah) => DropdownMenuItem(
                        value: surah,
                        child: Text(surah),
                      ))
                  .toList(),
              onChanged: (value) => setState(() => _selectedSurah = value),
              validator: (value) {
                if (value == null) {
                  return 'يرجى اختيار السورة';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              if (_selectedSurah != null) {
                final newStudent = Student(
                  name: _nameController.text,
                  age: int.parse(_ageController.text),
                  surah: _selectedSurah!,
                );
                widget.onAddStudent(newStudent);
                _showSuccessDialog(context);
              }
            }
          },
          child: const Text('إضافة',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
        ),
      ],
    );
  }
}
