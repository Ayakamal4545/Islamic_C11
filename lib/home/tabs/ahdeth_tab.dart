import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_c11/colors.dart';
import 'package:islamic_c11/hadeth_deatils_screen.dart';
import 'package:islamic_c11/hadeth_model.dart';

class AhdethTab extends StatefulWidget {
  AhdethTab({Key? key}) : super(key: key);

  @override
  State<AhdethTab> createState() => _AhdethTabState();
}

class _AhdethTabState extends State<AhdethTab> {
  List<HadethModel> allAhadeth = [];

  @override
  void initState() {
    super.initState();
    loadHadethFile();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          "assets/images/hadith_bg.png",
          height: 219,
        ),
        Divider(
          thickness: 2,
          color: AppColors.primaryColor,
        ),
        Text(
          "Ahadeth",
          textAlign: TextAlign.center,
          style: GoogleFonts.elMessiri(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(
          thickness: 2,
          color: AppColors.primaryColor,
        ),
        Expanded(
          child: ListView.separated(separatorBuilder: (context,index)=>Divider(),
            itemBuilder:(context,index){
            return GestureDetector(
              onTap: (){
              Navigator.pushNamed(context, HadethDeatilsScreen.routeName,
              arguments: allAhadeth[index]);
              },
              child: Text(allAhadeth[index].title,
                textAlign: TextAlign.center,
                style: GoogleFonts.elMessiri(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
            );
          },
          itemCount:allAhadeth.length,
          ),
        )
      ],
    );
  }

  loadHadethFile() {
    rootBundle.loadString("assets/files/ahadeth.txt").then((value) {
      List<String> ahadeth = value.split("#");

      for(int i=0;i<ahadeth.length;i++){
        String HadethOne = ahadeth[i];

        List<String> hadethLine = HadethOne.trim().split("\n");

        String title = hadethLine[0];

        hadethLine.removeAt(0);

        List<String> content = hadethLine;
        HadethModel hadethModel = HadethModel(title, content);

        print(title);
        allAhadeth.add(hadethModel);
        setState(() {

        });
      }
    });
  }
}
