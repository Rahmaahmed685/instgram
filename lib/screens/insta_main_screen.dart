import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instgram/screens/insta_home_screen.dart';

class InstaMainScreen extends StatefulWidget {
  const InstaMainScreen({super.key});

  @override
  State<InstaMainScreen> createState() => _InstaMainScreenState();
}

class _InstaMainScreenState extends State<InstaMainScreen> {

  int currentIndex = 0;
  final titles = [
    "Instagram",
    "search",
    "Add",
    "Reels",
    "Proffile"
  ];
  final screens = [
    InstaHomeScreen(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
          unselectedItemColor:Colors.black ,
          currentIndex: currentIndex,
          onTap: (value){
          currentIndex = value;
          setState(() {

          });
          },

          items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled,color: Colors.black,),
          label: "",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.search,color: Colors.black,),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("lib/images/9364306.png",),
            color: Colors.black,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("lib/images/movie.png"),
            color: Colors.black,
          ),
          label: '',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person,
          color: Colors.black,),
          label: "",
        ),
      ]),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          titles[currentIndex],
          style: GoogleFonts.getFont('Lobster Two', fontSize: 30),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage(
                "lib/images/4805005-200.png",
              ),
              //color: Colors.black,
            ),
          ),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}

