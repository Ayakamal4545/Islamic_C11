import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_c11/hadeth_model.dart';

class HadethDeatilsScreen extends StatelessWidget {
  static const String routeName="HadethScreen";
  const HadethDeatilsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model=ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Container(
      decoration:BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/main_pg.png")
        )
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(model.title),
        ),
        body:Padding(
          padding: const EdgeInsets.all(18.0),
          child: Card(
            child: ListView.builder(itemBuilder: (context,index){
              return Text(
                model.content[index],
              style:Theme.of(context).textTheme.bodyLarge ,);
            
            },
              itemCount: model.content.length,
            ),
          ),
        ),
      ),
    );

  }
}
