import 'package:flutter/material.dart';

class AppDimen {

  getResponsiveSize(BuildContext context,dynamic size) {

    var y = MediaQuery.of(context).size.shortestSide;

    dynamic x = (size/392.72727272727275) * 100;

    return (y*x)/100;

  }


}