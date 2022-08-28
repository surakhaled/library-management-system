import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:library_management_system/widget/Search_item.dart';
import '../models/book.dart';
import '../provider/BOOKS.dart';
import '../provider/lanproviders.dart';
import '../provider/themeprovider.dart';



class AllBooksPage extends StatefulWidget {

  @override
  State<AllBooksPage> createState() => _AllBooksPageState();
}

class _AllBooksPageState extends State<AllBooksPage> {

  List<Book> display_list = [];
  Widget build(BuildContext context) {
    var book1= Provider.of<products>(context,listen:false);
    var Book= book1.item;
    var Th=Provider.of<ThemeProvider>(context,listen: true);
    var lan=Provider.of<LanguageProvider>(context,listen: true);

    return Directionality(
      textDirection: lan.isEn? TextDirection.ltr:TextDirection.rtl,
      child: Scaffold(
        backgroundColor:Th.getColor("thirdColor"),
        appBar: AppBar(
          toolbarHeight:70,
          backgroundColor:Th.getColor("firstColor"),
          title: Text(lan.getTexts('Result of Search'),style: TextStyle(fontSize:25,
            fontWeight: FontWeight.bold,
            fontFamily: "Pacifico",
            color:Colors.white,
          ),),
        ),
        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  setState((){
                    display_list =Book
                        .where((element) =>
                        element.name.toLowerCase().contains(value.toLowerCase()))
                        .toList();
                  }
                  );
                },
                style: TextStyle(color: Th.getColor("BW")),
                decoration: InputDecoration(
                  fillColor:Color(0xffDCD2D2).withOpacity(0.4),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  hintText: lan.getTexts("Search"),
                  hintStyle: TextStyle(color: Th.getColor("BW54")),
                  prefixIcon: Icon(
                    Icons.search,
                    color:Th.getColor("BW54") ,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: display_list.length == 0
                    ? Center(
                    child: Text(
                      lan.getTexts('No result found'),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Th.getColor("BW38"),fontSize: 15),
                    ))
                    :ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemBuilder: (ctx,index){
                    return Search(
                      id: display_list[index].id,
                      imageUrl: display_list[index].imageUrl,
                      name: display_list[index].name,
                      price: display_list[index].price,
                      category: display_list[index].category,
                    );
                  },
                  itemCount: display_list.length,
                ),


              ),
            ],
          ),
        ),
      ),
    );
  }
}

