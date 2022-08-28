import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:library_management_system/widget/top_item.dart';
//import '../provider/BOOKS.dart';
import '../provider/BOOKS_Free.dart';
import '../provider/lanproviders.dart';
import '../provider/themeprovider.dart';

class Toop extends StatefulWidget {

  @override
  State<Toop> createState() => _ToopState();
}

class _ToopState extends State<Toop> {

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<productsFree>(context, listen: false)
        .fetchandsetproducts();
  }

  @override
  Widget build(BuildContext context) {
    var lan=Provider.of<LanguageProvider>(context,listen: true);

    return Directionality(
      textDirection: lan.isEn? TextDirection.ltr:TextDirection.rtl,
      child: FutureBuilder(
        future: _refreshProducts(context),
        builder: (ctx, AsyncSnapshot<dynamic> snapshot) =>
        snapshot.connectionState == ConnectionState.waiting
            ? const Center(child: CircularProgressIndicator())
            :RefreshIndicator(
          onRefresh: () => _refreshProducts(context),
          child:Consumer<productsFree>(
            builder: (ctx, productsData,_)=> ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: productsData.item.length,
                itemBuilder: (BuildContext c, int index){
                  return TopItem(
                    id: productsData.item[index].id,
                    imageUrl: productsData.item[index].imageUrl,
                    name: productsData.item[index].name,
                    pdf: productsData.item[index].pdf,
                    category: productsData.item[index].category,
                    description:productsData.item[index].description,
                  );
                }
            ),
          ),
        ),
      ),
    );
  }
}
