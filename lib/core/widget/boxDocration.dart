import 'package:flutter/cupertino.dart';

BoxDecoration myBoxDecoration (){
  return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromRGBO(8, 36,79, 1),
          Color.fromRGBO(19, 76,181, 1),
          Color.fromRGBO(11, 66,171, 1),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.15, 0.7,1],
      )
  );
}