import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:test_project/Controller/StudentController.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:test_project/View/Home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String errorMessage = '';
  String _scanResult = "";
  late String _password;
  late String _studentId;
  final StudentController studentController = Get.put(StudentController());
  Future<void> scanCode() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff75fd", "Cancel", true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = "Failed to scan";
    }

    setState(() {
      _scanResult = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Login.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Container(
                color: Colors.white.withOpacity(0.75),
              ),
              Positioned(
                top: 120,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/logo2.png',
                        width: 160,
                        height: 120,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Center(
                          child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.indigo[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      )),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 420,
                left: 50,
                right: 50,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'University Number',
                            hintStyle: const TextStyle(
                                color: Colors.black26,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(Icons.person),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your student ID';
                            } else if (value.length > 10 || value.length < 9) {
                              return 'Please enter a valid 9 or 10 digit number';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _studentId = value!;
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        errorMessage,
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // إضافة حقل كلمة المرور
                      Container(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                                color: Colors.black26,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(Icons.lock),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _password = value!;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.indigo[800],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 6,
                              shadowColor: Colors.grey.withOpacity(0.5),
                              padding: EdgeInsets.all(12),
                              minimumSize: Size(200, 50)),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              print('Student ID: $_studentId');
                              print('Password: $_password');
                              final response = await http.post(
                                Uri.parse(
                                    'http://10.0.2.2:8000/api/student/login'),
                                body: {
                                  'id_student': _studentId,
                                  'password':
                                      _password, // إرسال كلمة المرور مع الطلب
                                },
                              );
                              if (response.statusCode == 203) {
                                final data = jsonDecode(response.body);
                                if (data['message'] == 'ok') {
                                  studentController.updateStudentId(_studentId);
                                  // Get.to(Home());
                                  Get.to(() => Home());
                                } else {
                                  setState(() {
                                    errorMessage =
                                        'The university ID or password is incorrect';
                                  });
                                }
                              }
                            }
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: ElevatedButton(
                            onPressed: () {
                              scanCode();
                            },
                            child: Text("Scan Barcode"),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
