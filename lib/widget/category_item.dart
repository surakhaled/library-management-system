import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/category.dart';
import '../provider/lanproviders.dart';
import '../widget/card_scroll_view.dart';
import '../screens/Books_Screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;


  void selectbook(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(BooksScreen.routename,
        arguments:{
          'id': id,
          'title':title,
        });
  }

  CategoryItem( this.id, this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {

    var lan=Provider.of<LanguageProvider>(context,listen: true);

    return Directionality(
      textDirection: lan.isEn? TextDirection.ltr:TextDirection.rtl,
      child: InkWell(
        onTap: ()=> selectbook(context),
        splashColor: Theme.of(context).primaryColor,
        child: Container(
          padding: EdgeInsets.all(15),
          child: Text(title,style:TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),),
        ),
      ),
    );
  }
}
