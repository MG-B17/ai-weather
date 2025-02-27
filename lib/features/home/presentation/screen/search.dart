import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Search",style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),),),
    );
  }
}
