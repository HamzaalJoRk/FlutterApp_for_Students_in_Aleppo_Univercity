import 'package:get/get.dart';

class StudentController extends GetxController {
  late String _studentId;

  void updateStudentId(String studentId) {
    _studentId = studentId;
  }

  String getStudentId() {
    return _studentId;
  }
}
