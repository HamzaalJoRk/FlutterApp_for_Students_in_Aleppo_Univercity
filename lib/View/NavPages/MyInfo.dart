import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:test_project/Controller/StudentController.dart';
import 'package:http/http.dart' as http;
import 'package:test_project/View/Login.dart';

class MyInfo extends StatefulWidget {
  const MyInfo({Key? key}) : super(key: key);

  @override
  State<MyInfo> createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {
  List student = [];
  bool isLoading = true;

  final StudentController studentController = Get.find();
  late String studentId = studentController.getStudentId();

  Future<void> getData() async {
    String url =
        'http://10.0.2.2:8000/api/student/result?id_student=$studentId';
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);

        setState(() {
          if (responseBody is List<dynamic>) {
            student = responseBody.cast<Map<String, dynamic>>().toList();
          } else {
            student = [responseBody].cast<Map<String, dynamic>>();
          }
        });
        setState(() {
          if (responseBody is List<dynamic>) {
            student = responseBody.cast<Map<String, dynamic>>().toList();
          } else {
            student = [responseBody].cast<Map<String, dynamic>>();
          }
          isLoading = false; // تحديث حالة التحميل
        });

        print(student);
      } else {
        print('Failed with status ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.08),
                child: Text(
                  'Student Info',
                  style: TextStyle(
                      color: HexColor("#475071"),
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height / 15, right: size.width / 2),
                child: const Text(
                  'Personal Info',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  height: size.height / 3.5,
                  width: size.width / 1 * 0.85,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(0, 3))
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 20),
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: size.width / 1 * 0.85 * 0.30,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage('assets/StudentLogo.png'),
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.only(top: 15),
                                child: Text(
                                  'ID: ${student[0]['data']['id_student']}',
                                  style: TextStyle(
                                      color: HexColor("#475071"),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                              )),
                        ],
                      ),
                      Container(
                        width: size.width / 1 * 0.595,
                        decoration: BoxDecoration(
                            color: Colors.grey[50],
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 15),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'First Name:',
                                      style: TextStyle(
                                        color: HexColor("#475071"),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      '${student[0]['data']['first_name']}',
                                      style: TextStyle(
                                        color: HexColor("#475071"),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: size.height / 1 * 0.07 * 0.595,
                              width: size.width / 1 * 0.570,
                              decoration: BoxDecoration(
                                color: HexColor("#E7E7F0"),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              padding: EdgeInsets.only(left: 15),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Middle Name:',
                                      style: TextStyle(
                                        color: HexColor("#475071"),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      ' ${student[0]['data']['middle_name']}',
                                      style: TextStyle(
                                        color: HexColor("#475071"),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 15),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Last Name:',
                                      style: TextStyle(
                                        color: HexColor("#475071"),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      '${student[0]['data']['last_name']}',
                                      style: TextStyle(
                                        color: HexColor("#475071"),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: size.height / 1 * 0.04165,
                              width: size.width / 1 * 0.570,
                              decoration: BoxDecoration(
                                color: HexColor("#E7E7F0"),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              padding: EdgeInsets.only(left: 15),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Admission Type:',
                                      style: TextStyle(
                                        color: HexColor("#475071"),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      ' ${student[0]['data']['status_record']}',
                                      style: TextStyle(
                                        color: HexColor("#475071"),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 15),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Admission Year:',
                                      style: TextStyle(
                                        color: HexColor("#475071"),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      '${student[0]['data']['year_join']}',
                                      style: TextStyle(
                                        color: HexColor("#475071"),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: size.height / 1 * 0.07 * 0.595,
                              width: size.width / 1 * 0.570,
                              decoration: BoxDecoration(
                                color: HexColor("#E7E7F0"),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              padding: EdgeInsets.only(left: 15),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Fee Amount:',
                                      style: TextStyle(
                                        color: HexColor("#475071"),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      '${student[0]['data']['amount']} 💲',
                                      style: TextStyle(
                                        color: HexColor("#475071"),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 35, right: size.width / 1.4),
                child: const Text(
                  'Fee',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
              Container(
                height: size.height / 6,
                width: size.width * 0.86,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 3))
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Fee Amount:',
                              style: TextStyle(
                                color: HexColor("#475071"),
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '${student[0]['data']['amount']} 💲',
                              style: TextStyle(
                                color: HexColor("#475071"),
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              'block: ',
                              style: TextStyle(
                                color: HexColor("#475071"),
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              '${student[0]['data']['block']} ',
                              style: TextStyle(
                                color: HexColor("#475071"),
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: size.height / 1 * 0.07 * 0.595,
                      width: size.width * 0.82,
                      decoration: BoxDecoration(
                        color: HexColor("#E7E7F0"),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Paid Fee:',
                              style: TextStyle(
                                color: HexColor("#475071"),
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Text(
                              '${student[0]['data']['finances'][0]['amount_paid']} 💲',
                              style: TextStyle(
                                color: HexColor("#475071"),
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Remaining Fee:',
                              style: TextStyle(
                                color: HexColor("#475071"),
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Text(
                              (student[0]['data']['amount'] -
                                          student[0]['data']['finances'][0]
                                              ['amount_paid'])
                                      .toString() +
                                  '  💲',
                              style: TextStyle(
                                color: HexColor("#475071"),
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: ElevatedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('log out'),
                          content: Text('Do you want to log out?'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('No'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            TextButton(
                              child: Text('Yes'),
                              onPressed: () {
                                Get.offAll(LoginScreen());
                              },
                            ),
                          ],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 6,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      padding: EdgeInsets.all(12),
                      minimumSize: Size(200, 30)),
                  label: Text(
                    'Log Out',
                    style: TextStyle(
                        color: HexColor("#475071"),
                        fontWeight: FontWeight.bold),
                  ),
                  icon: Icon(
                    Icons.logout_outlined,
                    color: HexColor("#475071"),
                  ),
                ),
              ),
            ],
          );
  }
}
