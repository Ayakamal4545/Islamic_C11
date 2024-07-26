import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_c11/hadeth_model.dart';

class HadethDeatilsScreen extends StatelessWidget {
  static const String routeName="HadethScreen";
  const HadethDeatilsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model=ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(model.title),
      ),
      body: ListView.builder(itemBuilder: (context,index){
        return Text(model.content[index],
        style:GoogleFonts.elMessiri(
          fontSize: 25,
            wordSpacing: 5,
          fontWeight: FontWeight.bold
        ) ,);

      },
        itemCount: model.content.length,
      ),
    );

  }
}
