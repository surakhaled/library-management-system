import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/lanproviders.dart';
class badge extends StatelessWidget {
  final Widget child;
  final String value;
  final Color color;

  const badge({
    @required this.value,
    this.color,
    @required this.child
  }) ;
  @override
  Widget build(BuildContext context) {

    var lan=Provider.of<LanguageProvider>(context,listen: true);

    return Directionality(
      textDirection: lan.isEn? TextDirection.ltr:TextDirection.rtl,

      child: Stack(
        alignment: Alignment.center,
        children: [
          child,
          Positioned(
            right:8,
            top:8,
            child: Container(
              padding: EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: color!=null?color:Theme.of(context).accentColor,
              ),
              constraints: BoxConstraints(
                minHeight: 16,
                minWidth: 16,
              ),
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10),
              ),
            ),
          )
        ],
      ),
    );
  }
}
