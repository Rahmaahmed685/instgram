
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instgram/screens/edit_profile_screen.dart';

import '../shared_prefrances.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin{

  final usernameController = TextEditingController();
   final nameController = TextEditingController();

   final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;

   String imageUrl = '';
  bool uploading = false;

  @override
  void initState() {
    super.initState();
    getUserDataInLocalDataSource();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      appBar: AppBar(
        title:
        TextFormField(
          enabled: false,
          controller: usernameController,
          style: TextStyle(color: Colors.black),
          decoration: const InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.lock_outline, color: Colors.black,),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.add_box_outlined),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.menu, size: 30,),
          ),
        ],
      ),

      body:
      ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                    children: [
                  if (imageUrl.isEmpty)
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () => pickImage(),
                        child: const CircleAvatar(
                          radius: 30,
                          child: Icon(
                            Icons.person,
                            size: 45,
                          ),
                        ),
                      ),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: () => pickImage(),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(imageUrl),
                              radius: 30,
                            ),
                          ),
                          Visibility(
                            visible: uploading,
                            child: const CircularProgressIndicator(),
                          ),
                        ],
                      ),
                    ),
                  SizedBox(
                    width: 70,
                    child: TextFormField(
                      enabled: false,
                      controller: nameController,
                      style: TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ]),

                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Text("0"),
                    Text("posts"),
                  ],),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Text("0"),
                    Text("followers"),
                  ],),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Text("0"),
                    Text("following"),
                  ],),
                ),

              ],),

            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>
                                EditProfileScreen(),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder()),
                      child: const Text(
                        "Edit Profile", style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {

                      },
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder()),
                      child: const Text("Share Profile",
                        style: TextStyle(color: Colors.black87),),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        color: Colors.white10
                    ),
                    child: Center(
                        child:
                        Icon(Icons.person_add_outlined)

                    ),
                  ),
                ),
              ],),

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: Colors.white,
                        side:
                        BorderSide(
                          width: 1.0,
                          color: Colors.black87,
                        ),
                      ),
                      onPressed: () {},
                      child:
                      Icon(Icons.add, color: Colors.black,)
                  ),
                ),
                Text("New",)
              ],
            ),
            DefaultTabController(
              length: 2,
              child:
              TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                controller: _tabController,
                indicatorColor: Colors.black54,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(icon: Icon(Icons.apps)),
                  Tab(icon: Icon(Icons.person_pin_outlined)),
                ],
              ),
            ),
            Container(
              height: 300,
              width: double.maxFinite,
              child: TabBarView(
                  controller: _tabController,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 20, left: 20, top: 25, bottom: 10),
                          child: Text("Capture the moment with a friend",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),),
                        ),
                        Text('Create Your first post',
                          style: TextStyle(color: Colors.blue),)
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text("Photos and\nvideos of you",
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 26
                              )),
                        ),
                        Text(
                            "when people tag you in photos and"),
                       Text("videos, they\'ll appear here.")
                      ],
                    ),
                  ]),
            ),
          ]),
    );
  }

  void getUserData() {
    firestore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .get()
        .then((value) {
      saveUserDataInLocalDataSource(value.data()!);
      updateUi(value.data()!);
    }).catchError((error) {});
  }

  void saveUserDataInLocalDataSource(Map<String, dynamic> data) async {
    final json = jsonEncode(data);
    PreferenceUtils.setString(PreferenceKey.ProfileData, json);
  }

  void getUserDataInLocalDataSource() async {
    final json = PreferenceUtils.getString(PreferenceKey.ProfileData);
    final userData = jsonDecode(json ?? '');
    updateUi(userData);
  }


  void updateUi(Map<String, dynamic> data) {
    usernameController.text = data['username'];
    nameController.text = data['name'];
    imageUrl = data['imageUrl'];
    setState(() {});
  }


  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);

    File image = File(file!.path);

    uploadImage(image);
  }

  void uploadImage(File image) {
    setState(() {
      uploading = true;
    });
    final userId = auth.currentUser!.uid;

    storage.ref("profileImages/$userId").putFile(image).then((value) {
      print('uploadImage => SUCCESS');
      getImageUrl();
    }).catchError((error) {
      setState(() {
        uploading = false;
      });
      print('uploadImage => $error');
    });
  }

  void getImageUrl() {
    final userId = auth.currentUser!.uid;

    storage.ref("profileImages/$userId").getDownloadURL().then((value) {
      print('getImageUrl => $value');
      setState(() {
        imageUrl = value;
        uploading = false;
      });
      saveImageUrl(imageUrl);
    }).catchError((error) {
      print('getImageUrl => $error');
    });
  }

  void saveImageUrl(String imageUrl) {
    final userId = auth.currentUser!.uid;

    firestore.collection("users").doc(userId).update({
      'imageUrl': imageUrl,
    });
  }
}