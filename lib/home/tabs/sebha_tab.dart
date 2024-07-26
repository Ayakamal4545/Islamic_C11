
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_c11/colors.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({Key? key}) : super(key: key);

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int count=0;
  double angle=0.0;
  int index=0;
  List<String> Azkar=[
    "سبحان الله",
    "الحمدلله",
    "لا اله الا الله",
    "الله اكبر"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset("assets/images/head of seb7a.png"),

            Padding(
              padding: const EdgeInsets.only(top:22),
                child: Transform.rotate(
                  angle:angle ,
                  child: GestureDetector(
                    onTap: (){
                      OnTap();
                    },
                      child: Image.asset("assets/images/body of seb7a.png")),
                )
            ),

          ],
        ),

        Padding(
          padding: const EdgeInsets.only(top :15),
          child: Text("عدد التسبيحات",
          textAlign: TextAlign.center,style:GoogleFonts.elMessiri(
              fontSize: 25,
              wordSpacing: 5,
              fontWeight: FontWeight.w400,
            ),
            ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:26.0),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color:AppColors.primaryColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text("$count"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:26.0),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color:AppColors.primaryColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text("${Azkar[index]}",style:GoogleFonts.elMessiri(
                fontSize: 25,
                wordSpacing: 5,
                fontWeight: FontWeight.w400,
              ),),
            ),
          ),
        )
      ],
    );
  }
  OnTap(){
    count++;
    if(count %33==0){
      index++;
      count++;
      count=0;
    }
    if(index==Azkar.length){
      index=0;
    }
    angle+=360/4;
    setState(() {

    });
  }
}
