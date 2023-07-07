import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:hexcolor/hexcolor.dart';
import 'package:test_project/Controller/StudentController.dart';
import 'package:test_project/Grades.dart';
import 'package:test_project/Login.dart';
import 'package:test_project/NavPages/Block.dart';
import 'package:test_project/body.dart';
import 'NavPages/MyInfo.dart';

void main() => runApp(GetMaterialApp(
  debugShowCheckedModeBanner: false,
  home: LoginScreen(),
));

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List pages = [
    Body(),
    Bolck(),
    MyInfo(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List posts = [];

  final StudentController studentController = Get.find();
  late String studentId = studentController.getStudentId();
  Future<void> getData() async {
    String url = 'http://10.0.2.2:8000/api/student/info?id_student=$studentId!';
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);

        setState(() {
          if (responseBody is List<dynamic>) {
            posts = responseBody.cast<Map<String, dynamic>>().toList();
          } else {
            posts = [responseBody].cast<Map<String, dynamic>>();
          }
        });

        print(posts);
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
    return Scaffold(
      body: pages[currentIndex],
      backgroundColor: HexColor("#E7E7F0"),
      bottomNavigationBar: Container(
        height: 75,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -12),
              blurRadius: 35,
              color: Colors.black12,
            )
          ],
        ),
        child: BottomNavigationBar(
          onTap: onTap,
          type: BottomNavigationBarType.shifting,
          currentIndex: currentIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: HexColor("#475071"),
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              label: 'State',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Me',
            ),
          ],
        ),
      ),
    );
  }
}
//
// class DataListPage extends StatelessWidget {
//   final List<Map<String, String>> data = [
//     {'name': 'طالب 1', 'theory': '90', 'practice': '80', 'total': '170'},
//     {'name': 'طالب 2', 'theory': '85', 'practice': '95', 'total': '180'},
//     {'name': 'طالب 3', 'theory': '92', 'practice': '88', 'total': '180'},
//   ]; // قم بتعيين البيانات هنا
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('عرض البيانات'),
//       ),
//       body: ListView.builder(
//         itemCount: data.length,
//         itemBuilder: (BuildContext context, int index) {
//           final item = data[index];
//
//           return Card(
//             child: ListTile(
//               title: Row(
//                 children: [
//                   Expanded(
//                     child: Text(item['name']!),
//                   ),
//                   Text('النظري: ${item['theory']}'),
//                   SizedBox(width: 16),
//                   Text('العملي: ${item['practice']}'),
//                   SizedBox(width: 16),
//                   Text('الكاملة: ${item['total']}'),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
