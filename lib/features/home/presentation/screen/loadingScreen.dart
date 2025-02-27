import 'package:flutter/material.dart';
import '../../../../core/widget/boxDocration.dart';
import '../../../../core/widget/loading.dart';

class LoadingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration:myBoxDecoration(),
          child: Center(child: spinkit,)
      ),
    );
  }
}
