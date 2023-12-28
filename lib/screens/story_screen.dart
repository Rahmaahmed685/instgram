import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("x",style: TextStyle(fontSize: 30),),
        ),
        title: Center(child: Text("Add to Story")),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.settings),
        ),
      ],
      ),
      body: GestureDetector(
        onTap: (){},
        child: Container(
    width: double.maxFinite,
    height: double.maxFinite,
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage("lib/images/pluss.png"),
    fit: BoxFit.fill
    ),
    ),
    ),
      )
    );
  }

  }


