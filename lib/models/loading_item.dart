import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instgram/screens/insta_home_screen.dart';

class LoadingItem extends StatelessWidget {
  const LoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemCount: 6,
        itemBuilder: (context,index){
          return InstaHomeScreen();
        });

  }
}
