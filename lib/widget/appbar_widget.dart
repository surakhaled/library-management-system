import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import '/themes.dart';
import 'package:library_management_system/models/user_prefrences.dart';

AppBar buildAppBar(BuildContext context) {

  return AppBar(
    leading: BackButton(),
    backgroundColor: Colors.blueGrey,
    elevation: 0,
  );
}