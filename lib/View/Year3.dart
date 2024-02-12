import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Year3 extends StatefulWidget {
  const Year3({Key? key}) : super(key: key);

  @override
  State<Year3> createState() => _Year3State();
}

class _Year3State extends State<Year3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Third Year',
              style: TextStyle(
                  color: HexColor("#475071"), fontWeight: FontWeight.bold),
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
      body: YearsPage2(),
      backgroundColor: HexColor("#E7E7F0"),
    );
  }
}

class YearsPage2 extends StatefulWidget {
  const YearsPage2({Key? key}) : super(key: key);

  @override
  State<YearsPage2> createState() => _YearsPage2State();
}

class _YearsPage2State extends State<YearsPage2> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(color: HexColor("#E7E7F0")),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 50),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    ' الفصل الأول',
                    style: TextStyle(
                      color: HexColor("#475071"),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 6,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      padding: EdgeInsets.all(12),
                      minimumSize: Size(275, 65)),
                  child: Text(
                    'خوارزميات 2',
                    style: TextStyle(
                      color: HexColor("#475071"),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 6,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      padding: EdgeInsets.all(12),
                      minimumSize: Size(275, 65)),
                  child: Text(
                    'رسوميات حاسوبية',
                    style: TextStyle(
                      color: HexColor("#475071"),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 6,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      padding: EdgeInsets.all(12),
                      minimumSize: Size(275, 65)),
                  child: Text(
                    'نظرية المعلومات',
                    style: TextStyle(
                      color: HexColor("#475071"),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 6,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      padding: EdgeInsets.all(12),
                      minimumSize: Size(275, 65)),
                  child: Text(
                    'نظرية المخططات',
                    style: TextStyle(
                      color: HexColor("#475071"),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 6,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      padding: EdgeInsets.all(12),
                      minimumSize: Size(275, 65)),
                  child: Text(
                    'معالجة الإشارة',
                    style: TextStyle(
                      color: HexColor("#475071"),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 6,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      padding: EdgeInsets.all(12),
                      minimumSize: Size(275, 65)),
                  child: Text(
                    'معالج مصغر',
                    style: TextStyle(
                      color: HexColor("#475071"),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 6,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      padding: EdgeInsets.all(12),
                      minimumSize: Size(275, 65)),
                  child: Text(
                    'قواعد معطيات 1',
                    style: TextStyle(
                      color: HexColor("#475071"),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 100),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  'الفصل الثاني',
                  style: TextStyle(
                    color: HexColor("#475071"),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 6,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      padding: EdgeInsets.all(12),
                      minimumSize: Size(275, 65)),
                  child: Text(
                    'خوارزميات 3',
                    style: TextStyle(
                      color: HexColor("#475071"),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 6,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      padding: EdgeInsets.all(12),
                      minimumSize: Size(275, 65)),
                  child: Text(
                    'هندسة البرمجيات',
                    style: TextStyle(
                      color: HexColor("#475071"),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 6,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      padding: EdgeInsets.all(12),
                      minimumSize: Size(275, 65)),
                  child: Text(
                    'ذكاء صنعي',
                    style: TextStyle(
                      color: HexColor("#475071"),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 6,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      padding: EdgeInsets.all(12),
                      minimumSize: Size(275, 65)),
                  child: Text(
                    'بنية الحاسب 1',
                    style: TextStyle(
                      color: HexColor("#475071"),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 6,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      padding: EdgeInsets.all(12),
                      minimumSize: Size(275, 65)),
                  child: Text(
                    'لغات صورية',
                    style: TextStyle(
                      color: HexColor("#475071"),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 6,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      padding: EdgeInsets.all(12),
                      minimumSize: Size(275, 65)),
                  child: Text(
                    'اتصالات',
                    style: TextStyle(
                      color: HexColor("#475071"),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 6,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      padding: EdgeInsets.all(12),
                      minimumSize: Size(275, 65)),
                  child: Text(
                    'شبكات',
                    style: TextStyle(
                      color: HexColor("#475071"),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40),
              ),
            ],
          ),
        ));
  }
}
