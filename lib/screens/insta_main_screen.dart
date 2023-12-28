import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instgram/screens/insta_home_screen.dart';
import 'package:instgram/screens/edit_profile_screen.dart';
import 'package:instgram/screens/login/page/login_screen.dart';
import 'package:instgram/screens/profile/page/profile_screen.dart';
import 'package:instgram/screens/search_Screen.dart';

import '../shared_prefrances.dart';

class InstaMainScreen extends StatefulWidget {
  const InstaMainScreen({super.key});

  @override
  State<InstaMainScreen> createState() => _InstaMainScreenState();
}

class _InstaMainScreenState extends State<InstaMainScreen> {

  int currentIndex = 0;


  final screens = [
    InstaHomeScreen(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
   ProfileScreen(),
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
        BottomNavigationBarItem(icon: IconButton(onPressed: (){
          showSearch(context: context,
              delegate: CustomSearchDelegate());
        },
            icon: Icon(Icons.search)),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("lib/images/pluss.png",),
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

      body: screens[currentIndex],
    );
  }
  void isLoggedIn() async {
    final loggedIn = PreferenceUtils.getBool(PreferenceKey.loggedIn);
    print('loggedIn = > $loggedIn');
  }

  void saveLoggedOut() async {
    final loggedOut = PreferenceUtils.setBool(PreferenceKey.loggedIn, false);
  }


}
class CustomSearchDelegate extends SearchDelegate{
  List<String> serchTerms = [
    'Hajar.salah',
    'Hossamahmed',
    'Ayman_',
    'reem ali',
    'Ali_yousef',
  ];
  @override
  List<Widget> buildActions(BuildContext context){
    return [
      IconButton(onPressed: (){
        query = "";
      },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context){
    return IconButton(onPressed: (){
      close(context, null);
    },
        icon: Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context){
    List<String> matchQuery = [];
    for(var name in serchTerms) {
      if (name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(name);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context,index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context){
    List<String> matchQuery = [];
    for(var name in serchTerms) {
      if (name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(name);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context,index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
