import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:library_management_system/models/book.dart';
import 'dart:convert';
import '../models/http_exception.dart';

class products with ChangeNotifier {
  List<Book> _item = [];
  String authtoken;
  String userid;

//(نستفيد منعا في البروكسي بروفايدر)تابع يقوم بارجاع البيانات
  getdata(String authtok, String uid, List<Book> prodcts) {
    authtoken = authtok;
    userid = uid;
    _item = prodcts;
    notifyListeners();
  }

  //تابع استخدمناه لاننا عرفنا المنتجات باريفت
  List<Book> get item {
    return [..._item];
  }

  List<Book> get favoritesitems {
    return _item.where((proditem) => proditem.isfavorite).toList();
  }

  Book findbyid(String id) {
    return _item.firstWhere((prod) => prod.id ==id);
  }

  List<Book> findbycategory(String category){
    return _item.where((prod) => prod.category ==category);
  }

  List<Book> BooksList(){
    List<Book> R;
    R= fetchandsetproductsNamed() as List<Book>;
    return R;
  }

  Future<void> fetchandsetproductsFree() async {
    //final filterstring = filterbyuser ? 'orderBy="creatorId"&equalTo="$userid"' : '';
    var url = 'https://thisone-186e0-default-rtdb.firebaseio.com/products.json';
    try {
      final res = await http.get(Uri.parse(url));
      final extractdata = json.decode(res.body) as Map<String, dynamic>;
      if (extractdata == null){
        return;
      }
      final List<Book> loadedproducts = [];
      extractdata.forEach((prodid,proddata) {
        if(proddata['price']==1){
          loadedproducts.add(
            Book(
              id: prodid,
              name: proddata['name'],
              imageUrl: proddata['imageUrl'],
              category:proddata['category'],
              price: proddata['price'],
              description: proddata['description'],
            ),
          );
        }
      });
      _item = loadedproducts;
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<List<Book>> fetchandsetproductsNamed() async {
    //final filterstring = filterbyuser ? 'orderBy="creatorId"&equalTo="$userid"' : '';
    var url = 'https://thisone-186e0-default-rtdb.firebaseio.com/products.json?auth=$authtoken';
    try {
      final res = await http.get(Uri.parse(url));
      final extractdata = json.decode(res.body) as Map<String, dynamic>;

      final List<Book> loadedproducts = [];
      extractdata.forEach((prodid, proddata) {
        loadedproducts.add(
          Book(
            id: prodid,
            name: proddata['name'],
            imageUrl: proddata['imageUrl'],
            category: proddata['category'],
            price: proddata['price'],
            description: proddata['description'],
          ),
        );
      });
      _item = loadedproducts;
      notifyListeners();
      return _item;
    } catch (e) {
      throw e;
    }
  }

  Future<void> fetchandsetproductsCat(String categoryName) async {
    //final filterstring = filterbyuser ? 'orderBy="creatorId"&equalTo="$userid"' : '';
    var url = 'https://thisone-186e0-default-rtdb.firebaseio.com/products.json';
    try {
      final res = await http.get(Uri.parse(url));
      final extractdata = json.decode(res.body) as Map<String, dynamic>;
      if (extractdata == null){
        return;
      }
      final List<Book> loadedproducts = [];
      extractdata.forEach((prodid,proddata) {
        if(proddata['category']==categoryName){
          loadedproducts.add(
            Book(
              id: prodid,
              name: proddata['name'],
              imageUrl: proddata['imageUrl'],
              category:categoryName,
              price: proddata['price'],
              description: proddata['description'],
            ),
          );
        }
      });
      _item = loadedproducts;
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }
  //تجلب البيانات كم الداتا
  Future<void> fetchandsetproducts([bool filterByUser = false]) async {
    //final filterstring = filterbyuser ? 'orderBy="creatorId"&equalTo="$userid"' : '';
    var url = 'https://thisone-186e0-default-rtdb.firebaseio.com/products.json?auth=$authtoken';
    try {
      final res = await http.get(Uri.parse(url));
      final extractdata = json.decode(res.body) as Map<String, dynamic>;
      if (extractdata == null){
        return;
      }
      url = 'https://thisone-186e0-default-rtdb.firebaseio.com/userfavorites/$userid.json?auth=$authtoken';
      final favres = await http.get(Uri.parse(url));
      final favdata = json.decode(favres.body) ;

      final List<Book> loadedproducts = [];
      extractdata.forEach((prodid, proddata) {
        loadedproducts.add(
          Book(
            id: prodid,
            name: proddata['name'],
            imageUrl: proddata['imageUrl'],
            category:proddata['category'] ,
            price: proddata['price'],
            description: proddata['description'],
            isfavorite: favdata==null?false:favdata[prodid]??false,
          ),
        );
      });
      _item = loadedproducts;
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> addproduct(Book prod) async {
    final url = 'https://thisone-186e0-default-rtdb.firebaseio.com/products.json?auth=$authtoken';
    try {
      //نضيف البيانات الى السيرفر
      final res = await http.post(Uri.parse(url),
          body: json.encode({
            'name': prod.name,
            'category':prod.category,
            'price': prod.price,
            'description': prod.description,
            'creatorId':userid,
            'imageUrl': prod.imageUrl,
          }));
      //عطي البيانات الى item_
      final newproduct = Book(
        id: json.decode(res.body)['name'],
        name: prod.name,
        category:prod.category,
        price: prod.price,
        description: prod.description,
        imageUrl: prod.imageUrl,
      );
      _item.add(newproduct);
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateproduct(String id, Book newproduct) async {
    final prodindex = _item.indexWhere((prod) => prod.id == id);
    if (prodindex >= 0) {
      //العنصر موجود
      final url =
          'https://thisone-186e0-default-rtdb.firebaseio.com/products/$id.json?auth=$authtoken';
      await http.patch(Uri.parse(url),
          body: json.encode({
            'name': newproduct.name,
            'imageUrl': newproduct.imageUrl,
            'category':newproduct.category,
            'price': newproduct.price,
            'description': newproduct.description,
          }));
      _item[prodindex] = newproduct;
      notifyListeners();
    }else{
      print("....");
    }
  }

  Future<void> deleteproduct(String id) async {
    final url = 'https://thisone-186e0-default-rtdb.firebaseio.com/products/$id.json?auth=$authtoken';
    final existingproductindex = _item.indexWhere((prod) => prod.id == id);
    var existingproduct = _item[existingproductindex];
    _item.removeAt((existingproductindex)); //يقوم بحذف العنصر من التطبيق
    notifyListeners();
    final res = await http.delete(Uri.parse(url));
    if (res.statusCode >= 400) {
      _item.insert(existingproductindex, existingproduct);
      notifyListeners();
      throw HttpException('could not delete product');
    }
    existingproduct = null; //
  }
}
