import 'package:flutter/material.dart';

class LanguageProvider with ChangeNotifier{

  bool isEn=true;

  Map <String, Object> textAr= {
    "drawer_switch_title":"اختر لغتك المفضلة.",
    "drawer_switch_item2":"العربية",
    "drawer_switch_item1":"الانكليزية",
    "Logout":"تسجيل الخروج",
    "About Us":"حول",
    "  Who Are We?":"  من نحن؟",
    "   What Do We Do?":"   ما هو عملنا؟",
    "Us":"",
    "Description":"الوصف",
    "Add To Cart":"أضف إلى السلة",
    "Read":"قراءة",
    'Scientific Books':'كتب علمية',
    'Story':'قصص',
    'Novels':'روايات',
    'Childrens Books':'كتب أطفال',
    "Edit Books":"تعديل الكتاب",
    "Add Book":"إضافة كتاب",
    "Title":"العنوان",
    "Please Enter The Title.":"الرجاء إدخال عنوان",
    "Price":"السعر",
    "Please Enter A Price.":"الرجاء إدخال سعر.",
    "Please Enter A Valid Price.":"الرجاء إدخال سعر صالح.",
    "Please Enter A Number Grater Than Zero.":"الرجاء إدخال رقم أكبر من صفر.",
    "Category":"التصنيف",
    "Please Enter A Category.":"الرجاء إدخال تصنيف.",
    "description":"الوصف",
    "Please Enter The description.":"الرجاء إدخال وصف.",
    "Enter Url":"أدخل عنوان url",
    "Image URL":"رابط الصورة",
    "Please Enter A Image URL.":"الرجاء إدخال رابط الصورة.",
    "Please Enter A Valid URL.":"الرجاء إدخال رابط صالح.",
    "Edit Books Free ":"تعديل كتاب مجاني ",
    "Add Book Free":"إضافة كتاب مجاني",
    "Please Select A Pdf.":"الرجاء إدخال Pdf.",
    'Home':'الرئيسية',
    'Top':'مجاني',
    'Categories':'التصنيفات',
    'favorite':'المفضلة',
    "your order":"طلباتك",
    "an error occurred":"حدث خطأ ما.",
    "My Books Paid":"كتبي المدفوعة",
    "My Books Free":"كتبي المجانية",
    "Organization":"صفحة التنظيم",
    'Free Books':'الكتب المجانية',
    'Paid Books':'الكتب المدفوعة',
    'Result of Search':'نتيجة البحث',
    "Search":"البحث",
    'No result found':'لا توجد نتائج.',
    "Iqra Library":"مكتبة إقرأ",
    'My Account':'حسابي',
    'the Search':'البحث',
    'LIBRARY':'المكتبة',
    'ORDERS':'الطلبات',
    'ABOUT US':'حول',
    '   Choose Your Prefer Theme.':'اختر ثيمك المفضل.',
    'Dark':'مظلم',
    'Light':'مضيء',
    'LOUGOUT':'تسجيل الخروج',
    'Are you sure?':'هل أنت متأكد؟',
    'Do you want to remove item from the cart?':'هل تريد حذف الكتاب من السلة؟',
    'No!':'لا!',
    'Yes':'نعم',
    'Free':'مجاني',
    'tDescription':'Description',
  };
  Map <String, Object> textEn={
    "drawer_switch_title":"  Choose Your Prefer Language.",
    "drawer_switch_item2":"Arabic",
    "drawer_switch_item1":"English",
    "Logout":"Logout",
    "About Us":"About Us",
    "  Who Are We?":"  Who Are We?",
    "   What Do We Do?":"   What Do We Do?",
    "Us":" Hello, welcome to our library, "
        " I hope you enjoy reading and benefit as much as possible,"
        " We are a team of application developers,"
        " if you have some feedback please contact us and "
        " let us know and we will be pleased."
        " Hello, welcome to our library, "
        " I hope you enjoy reading and benefit as much as possible,"
        " We are a team of application developers,"
        " if you have some feedback please contact us and "
        " let us know and we will be pleased."
        " Hello, welcome to our library, "
        " I hope you enjoy reading and benefit as much as possible,"
        " We are a team of application developers,"
        " if you have some feedback please contact us and "
        " let us know and we will be pleased."
        " Hello, welcome to our library, "
        " I hope you enjoy reading and benefit as much as possible,"
        " We are a team of application developers,"
        " if you have some feedback please contact us and "
        " let us know and we will be pleased.",
    "Description":"Description",
    "Add To Cart":"Add To Cart",
    "Read":"Read",
    'Scientific Books':'Scientific Books',
    'Story':'Story',
    'Novels':'Novels',
    'Childrens Books':'Childrens Books',
    "Edit Books":"Edit Books",
    "Add Book":"Add Book",
    "Title":"Title",
    "Please Enter The Title.":"Please Enter The Title.",
    "Price":"Price",
    "Please Enter A Price.":"Please Enter A Price.",
    "Please Enter A Valid Price.":"Please Enter A Valid Price.",
    "Please Enter A Number Grater Than Zero.":"Please Enter A Number Grater Than Zero.",
    "Category":"Category",
    "Please Enter A Category.":"Please Enter A Category.",
    "description":"description",
    "Please Enter The description.":"Please Enter The description.",
    "Enter Url":"Enter Url",
    "Image URL":"Image URL",
    "Please Enter A Image URL.":"Please Enter A Image URL.",
    "Please Enter A Valid URL.":"Please Enter A Valid URL.",
    "Edit Books Free ":"Edit Books Free ",
    "Add Book Free":"Add Book Free",
    "Please Select A Pdf.":"Please Select A Pdf.",
    'Home':'Home',
    'Top':'Free',
    'Categories':'Categories',
    'favorite':'favorite',
    "your order":"your order",
    "an error occurred":"an error occurred",
    "My Books Paid":"My Books Paid",
    "My Books Free":"My Books Free",
    "Organization":"Organization",
    'Free Books':'Free Books',
    'Paid Books':'Paid Books',
    'Result of Search':'Result of Search',
    "Search":"Search",
    'No result found':'No result found',
    "Iqra Library":"Iqra Library",
    'My Account':'My Account',
    'the Search':'Search',
    'LIBRARY':'LIBRARY',
    'ORDERS':'ORDERS',
    'ABOUT US':'ABOUT US',
    '   Choose Your Prefer Theme.':'   Choose Your Prefer Theme.',
    'Dark':'Dark',
    'Light':'Light',
    'LOUGOUT':'LOUGOUT',
    'Are you sure?':'Are you sure?',
    'Do you want to remove item from the cart?':'Do you want to remove item from the cart?',
    'No!':'No!',
    'Yes':'Yes',
    'Free':'Free',
    'tDescription':'Description',
  };

  changeLan(bool lan){
    isEn=lan;
    notifyListeners();
  }

  Object getTexts(String txt){
    if(isEn==true) return textEn[txt];
    return textAr[txt];
  }


}