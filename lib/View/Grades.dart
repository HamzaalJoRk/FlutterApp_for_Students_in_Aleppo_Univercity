import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:test_project/Controller/StudentController.dart';
import 'package:http/http.dart' as http;

class Grades extends StatefulWidget {
  const Grades({required this.year, Key? key}) : super(key: key);
  final String year;
  @override
  _GradesState createState() => _GradesState();
}

class _GradesState extends State<Grades> {
  final PageController controller = PageController(initialPage: 0);
  int currentPage = 0, totalSubjects = 0;
  double average1 = 0, totalGrades = 0, average2 = 0, average = 0;
  var totalGrade, numPassedCourses = 0;
  late String honor = '', academicStatus = '';
  List results = [];
  Set<String> numFilledCourses = {};
  bool isLoading = true;
  final StudentController studentController = Get.find();
  late String studentId = studentController.getStudentId();
  late String years = widget.year;

  Future<void> getData() async {
    String url =
        'http://10.0.2.2:8000/api/student/result?id_student=$studentId';
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);

        setState(() {
          if (responseBody is List<dynamic>) {
            results = responseBody.cast<Map<String, dynamic>>().toList();
          } else {
            results = [responseBody].cast<Map<String, dynamic>>();
          }
          setState(() {
            if (responseBody is List<dynamic>) {
              results = responseBody.cast<Map<String, dynamic>>().toList();
            } else {
              results = [responseBody].cast<Map<String, dynamic>>();
            }
            isLoading = false;
          });
        });
        print(results);
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
        : Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Results',
                    style: TextStyle(
                        color: HexColor("#475071"),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Academic Year',
                    style: TextStyle(
                        color: HexColor("#475071"),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              backgroundColor: HexColor("#E7E7F0"),
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.indigo[800],
                ),
              ),
            ),
            backgroundColor: HexColor("#E7E7F0"),
            body: PageView(
              controller: controller,
              onPageChanged: (int page) {
                setState(() {
                  currentPage = page;
                });
              },
              children: <Widget>[
                Container(
                  color: HexColor("#E7E7F0"),
                  child: Center(
                    child: Container(
                      height: size.height / 1.53,
                      width: size.width / 1 * 0.9,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            height: size.height / 1.8 * 0.15,
                            color: Colors.white,
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'المجموع \n (100)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: HexColor("#475071"),
                                        fontSize: 14),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'النظري \n (70)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: HexColor("#475071"),
                                        fontSize: 14),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'العملي \n (30)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: HexColor("#475071"),
                                        fontSize: 14),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'اسم المادة',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: HexColor("#475071"),
                                        fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: size.height /
                                1.8 *
                                0.1214285714285 *
                                0.65 *
                                2.1 *
                                results[0]['data']['grades'][1]
                                        ['course_year_related']
                                    .length,
                            child: ListView.builder(
                              itemCount: results[0]['data']['grades'].length,
                              itemBuilder: (BuildContext context, int index) {
                                final grade =
                                    results[0]['data']['grades'][index];
                                final isEvenRow = index % 2 == 0;
                                final cardColor = isEvenRow
                                    ? HexColor("#D6D3E5")
                                    : Colors.white;
                                totalGrade =
                                    grade['pr_grade'] + grade['th_grade'];
                                totalGrades += totalGrade;
                                totalSubjects++;
                                if (grade['cource_chapter'] == "1" &&
                                    grade['course_year_related'] == '$years') {
                                  if (totalGrade < 60) {
                                    numFilledCourses.add(grade['course_name']);
                                  }
                                  if (numFilledCourses.length > 4) {
                                    academicStatus = 'fail';
                                  } else {
                                    academicStatus = 'successful';
                                  }
                                  return Card(
                                    color: totalGrade < 60
                                        ? Colors.red[200]
                                        : cardColor,
                                    child: ListTile(
                                      title: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              totalGrade.toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: HexColor("#475071")),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              grade['th_grade'].toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: HexColor("#475071")),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              grade['pr_grade'].toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: HexColor("#475071")),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              grade['course_name'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: HexColor("#475071")),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  average1 = totalGrades / totalSubjects;
                                  return SizedBox();
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: HexColor("#E7E7F0"),
                  child: Center(
                    child: Container(
                      height: size.height / 1.53,
                      width: size.width / 1 * 0.9,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            height: size.height / 1.8 * 0.15,
                            color: Colors.white,
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'المجموع \n (100)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: HexColor("#475071"),
                                        fontSize: 14),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'النظري \n (70)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: HexColor("#475071"),
                                        fontSize: 14),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'العملي \n (30)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: HexColor("#475071"),
                                        fontSize: 14),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'اسم المادة',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: HexColor("#475071"),
                                        fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: size.height /
                                1.8 *
                                0.1214285714285 *
                                0.65 *
                                2 *
                                results[0]['data']['grades'][0]
                                        ['course_year_related']
                                    .length,
                            child: ListView.builder(
                              itemCount: results[0]['data']['grades'].length,
                              itemBuilder: (BuildContext context, int index) {
                                final grade =
                                    results[0]['data']['grades'][index];
                                final isEvenRow = index % 2 == 0;
                                final cardColor = isEvenRow
                                    ? HexColor("#D6D3E5")
                                    : Colors.white;
                                totalGrade =
                                    grade['pr_grade'] + grade['th_grade'];
                                totalGrades += totalGrade;
                                totalSubjects++;
                                if (grade['cource_chapter'] == "2" &&
                                    grade['course_year_related'] == '$years') {
                                  if (totalGrade < 60) {
                                    numFilledCourses.add(grade['course_name']);
                                  }
                                  if (numFilledCourses.length > 4) {
                                    academicStatus = 'fail';
                                  } else {
                                    academicStatus = 'successful';
                                  }
                                  return Card(
                                    color: totalGrade < 60
                                        ? Colors.red[200]
                                        : cardColor,
                                    child: ListTile(
                                      title: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              totalGrade.toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: HexColor("#475071")),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              grade['th_grade'].toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: HexColor("#475071")),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              grade['pr_grade'].toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: HexColor("#475071")),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              grade['course_name'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: HexColor("#475071")),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  average2 = totalGrades / totalSubjects;
                                  average = (average2 + average1) / 2;

                                  if (average >= 90) {
                                    honor = "Excellent";
                                  } else if (average >= 80) {
                                    honor = "Very Good";
                                  } else if (average >= 70) {
                                    honor = "Good";
                                  } else if (average >= 60) {
                                    honor = "Pass";
                                  } else {
                                    honor = "Fail";
                                  }

                                  return SizedBox();
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: HexColor("#E7E7F0"),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 70),
                          height: size.height / 4,
                          width: size.width / 1 * 0.85,
                          decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: size.height / 1 * 0.07 * 0.595,
                                width: size.width / 1 * 0.8,
                                padding: EdgeInsets.only(left: 15),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        'Academic Date:',
                                        style: TextStyle(
                                          color: HexColor("#475071"),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        margin: EdgeInsets.only(top: 5),
                                        height: size.height / 1 * 0.06 * 0.595,
                                        width: size.width / 1 * 0.570,
                                        decoration: BoxDecoration(
                                          color: HexColor("#E7E7F0"),
                                          borderRadius:
                                              BorderRadius.circular(13),
                                        ),
                                        child: Center(
                                          child: Text(
                                            (results[0]['data']['grades'][0]
                                                ['course_year_related']),
                                            style: TextStyle(
                                              color: HexColor("#475071"),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: size.height / 1 * 0.07 * 0.595,
                                width: size.width / 1 * 0.8,
                                padding: EdgeInsets.only(left: 15),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        'Average:',
                                        style: TextStyle(
                                          color: HexColor("#475071"),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        margin: EdgeInsets.only(top: 5),
                                        height: size.height / 1 * 0.06 * 0.595,
                                        width: size.width / 1 * 0.570,
                                        decoration: BoxDecoration(
                                          color: HexColor("#E7E7F0"),
                                          borderRadius:
                                              BorderRadius.circular(13),
                                        ),
                                        child: Center(
                                          child: Text(
                                            average.toString(),
                                            style: TextStyle(
                                              color: HexColor("#475071"),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: size.height / 1 * 0.07 * 0.595,
                                width: size.width / 1 * 0.8,
                                padding: EdgeInsets.only(left: 15),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        'Student Status:',
                                        style: TextStyle(
                                          color: HexColor("#475071"),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        margin: EdgeInsets.only(top: 5),
                                        height: size.height / 1 * 0.06 * 0.595,
                                        width: size.width / 1 * 0.570,
                                        decoration: BoxDecoration(
                                          color: HexColor("#E7E7F0"),
                                          borderRadius:
                                              BorderRadius.circular(13),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '$academicStatus',
                                            style: TextStyle(
                                              color: HexColor("#475071"),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: size.height / 1 * 0.07 * 0.595,
                                width: size.width / 1 * 0.8,
                                padding: EdgeInsets.only(left: 15),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        'Apperaciation:',
                                        style: TextStyle(
                                          color: HexColor("#475071"),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        margin: EdgeInsets.only(top: 5),
                                        height: size.height / 1 * 0.06 * 0.595,
                                        width: size.width / 1 * 0.570,
                                        decoration: BoxDecoration(
                                          color: HexColor("#E7E7F0"),
                                          borderRadius:
                                              BorderRadius.circular(13),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '$honor',
                                            style: TextStyle(
                                              color: HexColor("#475071"),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 70),
                          height: size.height / 4,
                          width: size.width / 1 * 0.85,
                          decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: size.height / 1 * 0.07 * 0.595,
                                width: size.width / 1 * 0.8,
                                padding: EdgeInsets.only(left: 15),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        'Num Of Courses Passed:',
                                        style: TextStyle(
                                          color: HexColor("#475071"),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        margin: EdgeInsets.only(top: 5),
                                        height: size.height / 1 * 0.06 * 0.595,
                                        width: size.width / 1 * 0.570,
                                        decoration: BoxDecoration(
                                          color: HexColor("#E7E7F0"),
                                          borderRadius:
                                              BorderRadius.circular(13),
                                        ),
                                        child: Center(
                                          child: Text(
                                            ((results[0]['data']['grades'][0][
                                                            'course_year_related']
                                                        .length) -
                                                    numFilledCourses.length)
                                                .toString(),
                                            style: TextStyle(
                                              color: HexColor("#475071"),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: size.height / 1 * 0.07 * 0.595,
                                width: size.width / 1 * 0.8,
                                padding: EdgeInsets.only(left: 15),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        'Num Of Failed Courses :',
                                        style: TextStyle(
                                          color: HexColor("#475071"),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        margin: EdgeInsets.only(top: 5),
                                        height: size.height / 1 * 0.06 * 0.595,
                                        width: size.width / 1 * 0.570,
                                        decoration: BoxDecoration(
                                          color: HexColor("#E7E7F0"),
                                          borderRadius:
                                              BorderRadius.circular(13),
                                        ),
                                        child: Center(
                                          child: Text(
                                            numFilledCourses.length.toString(),
                                            style: TextStyle(
                                              color: HexColor("#475071"),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: size.height / 1 * 0.07 * 0.595,
                                width: size.width / 1 * 0.8,
                                padding: EdgeInsets.only(left: 15),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        'Full Num Of Courses:',
                                        style: TextStyle(
                                          color: HexColor("#475071"),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        margin: EdgeInsets.only(top: 5),
                                        height: size.height / 1 * 0.06 * 0.595,
                                        width: size.width / 1 * 0.570,
                                        decoration: BoxDecoration(
                                          color: HexColor("#E7E7F0"),
                                          borderRadius:
                                              BorderRadius.circular(13),
                                        ),
                                        child: Center(
                                          child: Text(
                                            (results[0]['data']['grades'][0]
                                                        ['course_year_related']
                                                    .length)
                                                .toString(),
                                            style: TextStyle(
                                              color: HexColor("#475071"),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomAppBar(
              color: HexColor("#E7E7F0"),
              child: Container(
                height: 100.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildPageIndicator(0),
                    _buildPageIndicator(1),
                    _buildPageIndicator(2),
                  ],
                ),
              ),
              elevation: 0,
            ),
          );
  }

  Widget _buildPageIndicator(int index) {
    return GestureDetector(
      onTap: () {
        controller.animateToPage(
          index,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      },
      child: Container(
        height: 8.0,
        width: 8.0,
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentPage == index ? Colors.orange : Colors.grey[400],
        ),
      ),
    );
  }
}
