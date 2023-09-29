
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

Widget storyModel ({required String image,required String text}){
  return
    Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        child:
           Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.green,
                        Colors.yellow,
                        Colors.red,
                        Colors.purple
                      ]),
                      shape: BoxShape.circle),
                  child: Padding(
                    //this padding will be you border size
                    padding:  EdgeInsets.all(3.0),
                    child: Container(
                      decoration:  BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                    ),

                  ),
        ),
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.white,
                        foregroundImage: AssetImage(image),
                      ),
            ],
          ),
              const SizedBox(height: 5),
              Text(text),

        ],),
      ),
    );
}