import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:hexcolor/hexcolor.dart';
import 'package:test_project/Controller/StudentController.dart';
import 'package:test_project/View/Login.dart';
import 'package:test_project/View/NavPages/Block.dart';
import 'package:test_project/View/body.dart';
import 'NavPages/MyInfo.dart';


void main() => runApp(GetMaterialApp(
  debugShowCheckedModeBanner: false,
  home: LoginScreen(),
));
