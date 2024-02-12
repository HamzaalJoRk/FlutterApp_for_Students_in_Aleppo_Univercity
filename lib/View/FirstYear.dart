import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class FirstYear extends StatefulWidget {
  const FirstYear({Key? key}) : super(key: key);

  @override
  State<FirstYear> createState() => _FirstYearState();
}

class _FirstYearState extends State<FirstYear> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'First Year',
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
                    'برمجة 1',
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
                    'جبر خطي',
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
                    'مبادئ عمل الحاسوب',
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
                    'فيزياء 1',
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
                    '1 لغة إنكليزية',
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
                    'تحليل 1',
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
                    'ثقافة و حضارة',
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
                    'برمجة 2',
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
                    'تحليل 2',
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
                    'دارات كهربائية',
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
                    'لغة عربية',
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
                    'لغة انكليزية 2',
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
                    'رياضيات متقطعة',
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
                    'فيزياء 2',
                    style: TextStyle(
                      color: HexColor("#475071"),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
              ),
            ],
          ),
        ));
  }
}
