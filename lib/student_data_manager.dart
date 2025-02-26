// للمكونات الأساسية
import 'student_from_dialog.dart';
// ignore: unused_import
// ignore: unused_import
import 'student_list_page.dart'; // ملف نموذج الطالب (يجب إنشاؤه)
// ignore: unused_import
import 'account_data_page.dart'; // ملف نموذج الطالب (يجب إنشاؤه)
// ignore: unused_import
import 'custom_drawer.dart';

// data_storage.dart
class DataStorage {
  static final DataStorage _instance =
      DataStorage._internal(); //ضمان وجود نسخة واحدة فقط من الكلاس في الذاكرة
  factory //يتحكم في إنشاء النسخة (لا يُنشئ كائن جديد كل مرة)
  DataStorage() => _instance; //يرجع دائمًا نفس النسخة اتي تم انشائها
  DataStorage._internal();

  List<Student> students = []; //قائمة عامة لتخزين كائنات من نوع Student
}
