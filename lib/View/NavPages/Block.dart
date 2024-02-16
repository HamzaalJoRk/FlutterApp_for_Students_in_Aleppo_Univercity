import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Block extends StatefulWidget {
  const Block({Key? key}) : super(key: key);

  @override
  State<Block> createState() => _BlockState();
}

class _BlockState extends State<Block> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Articles'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Wrapper(
                txt:
                    "المؤتمر العلمي الدولي الأول... فكرته، أهدافه وتوصياته\n\nنظّمت جامعة حلب في المناطق المحرّرة، ومركز مداد للدراسات والبحوث، برعاية رئيس الحكومة السورية المؤقتة، المؤتمر العلمي الدولي الأول تحت عنوان “التعليم العالي في الأزمات”، وذلك يومي 5 و6 من شهر تشرين الأول الجاري\nبدأت فكرة المؤتمر منذ عامين، نتيجة ازدياد الأزمات الناجمة عن النزاعات والكوارث الطبيعية والأوبئة في العالم، وبالتحديد في ظل جائحة كورونا، وأن العديد من هذه الأزمات تمتد لتشمل كافة الأعمار وتظل مستمرةً لأجيالٍ تاليةٍ متتابعة\nوازداد الاهتمام بالفكرة لبحث واقع ومآل العملية التعليمية خلال هذه الأزمات غير المتوقعة، والحروب والثورات المنتشرة في العديد من دول العالم، كما في الثورة السورية الآن، وكذلك مساهمة في التنمية المستدامة\n",
              ),
              Divider(
                height: 30,
              ),
              Wrapper(
                  txt:
                      "انطلاق فعاليات مؤتمر الاستثمار الأول في الشمال السوري\n\nانطلقت اليوم الأربعاء 17 / 1 / 2024 م في المدينة الصناعيّة في مدينة الراعي فعاليات #مؤتمر_الإستثمار_الأول_في_الشمال_السوري الذي نظّمته كلٌ من وزارة الماليّة والاقتصاد في الحكومة السوريّة المؤقتة، و جامعة حلب في المناطق المحرّرة ممثلة بمركز الدراسات والأبحاث، و نقابة الاقتصاديين، و مؤسسة 2020IDEA، تحت شعار ” استثمار.. استقرار.. تنمية وازدهار\nحضر اليوم الأول من المؤتمر رئيس الحكومة السورية المؤقتة الأستاذ عبد الرحمن مصطفى، ونائب رئيس الائتلاف الوطني لقوى الثورة والمعارضة السوريّة السيد عبد المجيد بركات، وعدد من السادة الوزراء، ورئيس جامعة حلب في المناطق المحررة أ. د. أحمد بكار، وعدد من ممثلي الجهات المنظّمة والراعية، وممثلي مراكز الأبحاث، والأكاديميين والباحثين، والعديد من المستثمرين من سوريا وتركيا ودول عربية ومن جميع أنحاء العالم، وممثلون عن غرف الصناعة والتجارة ومنظمات المجتمع المدني والجهات الإعلاميّة\nافتتح المؤتمر بتلاوة مباركة من القرآن الكريم وكلمات للجهات المنظّمة وبعض الجهات الراعية للمؤتمر، ومن ضمنها كلمة لرئيس جامعة حلب في المناطق المحرّرة أ. د. أحمد بكار، ومن ثم تم تقديم عرض مسرحي من قبل طلاب المدرسة الدوليّةتلا ذلك افتتاح المعرض الصناعي الأول لعدد من منتجات الشركات والمؤسسات التجاريّة"),
              Divider(
                height: 30,
              ),
              Wrapper(
                  txt:
                      "إصدار العدد الثالث من دوريّة ” إضاءات من جامعة حلب في المناطق المحرّرة\n\nتضمن العدد:\nنشرة بأسعار المواد الغذائيّة في الشمال المحرر خلال شهر نيسان\n استعراض رسائل الماجستير وأطروحات الدكتوراه التي تمت مناقشتها خلال شهر نيسان.\n لمحة تعريفيّة بكليّة الصيدلة في جامعة حلب في المناطق المحرّرة\nمقال “القلق الامتحاني لدى الطلبة الجامعيين ” للدكتور عبد الحي المحمود\n مقال “بعض أدوات الذكاء الصناعي” للدكتور محمود الموسى\n مقال “رسالة إلى كل طالب علم وثائر ” للدكتور عبد السلام بيطار شخصية العدد البحثيّة"),
            ],
          ),
        ),
      ),
    );
  }
}

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key, required this.txt}) : super(key: key);

  final String txt;

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool isReadMore = false;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: ConstrainedBox(
              constraints: isReadMore
                  ? const BoxConstraints()
                  : const BoxConstraints(maxHeight: 70),
              child: Text(
                widget.txt,
                style: const TextStyle(fontSize: 15),
                softWrap: true,
                overflow: TextOverflow.fade,
              ))),
      isReadMore
          ? TextButton.icon(
              icon: const Icon(Icons.remove_circle),
              label: const Text('Read less'),
              onPressed: () => setState(() => isReadMore = false))
          : TextButton.icon(
              icon: const Icon(Icons.add_circle),
              label: const Text('Read more'),
              onPressed: () => setState(() => isReadMore = true))
    ]);
  }
}
