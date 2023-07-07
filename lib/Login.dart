import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/Controller/StudentController.dart';
import 'main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _studentId;
  final StudentController studentController = Get.put(StudentController());

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
                            color: Colors.black26, fontWeight: FontWeight.bold),
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
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.indigo[800],
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
                              final response = await http.post(
                                Uri.parse('http://10.0.2.2:8000/api/student/login'),
                                body: {'id_student': _studentId},
                              );
                              if (response.statusCode == 200) {
                                final data = jsonDecode(response.body);
                                if (data['message'] == 'ok') {
                                  studentController.updateStudentId(_studentId);
                                  Get.to(Home());
                                } else {
                                  // إجراءات إضافية في حالة عدم النجاح
                                }
                              } else {
                                // إجراءات إضافية في حالة عدم النجاح
                              }
                            }
                          },

                          child: const Text('Login',
                          style: TextStyle(
                            fontWeight: FontWeight.w800
                          ),
                          ),
                        ),
                      ),
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