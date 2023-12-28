import 'package:favorite_button/favorite_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instgram/models/posts.dart';
import 'package:instgram/models/stories.dart';
import 'package:instgram/story_view.dart';

import '../shared_prefrances.dart';
import 'login/page/login_screen.dart';

class InstaHomeScreen extends StatefulWidget {
  const InstaHomeScreen({super.key});

  @override
  State<InstaHomeScreen> createState() => _InstaHomeScreenState();
}

class _InstaHomeScreenState extends State<InstaHomeScreen> {

  dynamic titles = ["Instagram", "search", "Add", "Reels", "Profile"];
   int currentIndex =0;
  List <Stories> myStory = [
    Stories(1,
        "https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg",
        "Rahma_",
        "13 augest",
        true
    ),
    Stories(2,
        "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
        "Ayman_", '15 augest', false
    ),
    Stories(3,
        "https://www.shutterstock.com/image-photo/successful-caucasian-young-man-student-260nw-2141124049.jpg",
        "Mohamed..",
        "13 augest", false
    ),
    Stories(4,
        "https://img.freepik.com/premium-photo/couple-love-postcard-valentine-s-day-generative-ai_791958-21.jpg",
        "reem ali",'15 augest', false
    ),
    Stories(5,
        "https://thumbs.dreamstime.com/b/handsome-man-style-16892120.jpg",
        "layla_",
        "13 augest", false
    ),
    Stories(6,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd4y7zVmHqMDDZPFYCAtIvlWWGYofVYEwNg4AyzbXsRg&s",
        "yomna_",
        '15 augest',
        true
    ),
    Stories(7,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSL10S3KZOUd2Yp9BpTCwbwjD2-ECWLciYSpw&usqp=CAU",
        "Miss_kl..",
        "13 augest", true
    ),
    Stories(8,
        "https://media.istockphoto.com/id/613557584/photo/portrait-of-a-beautifull-smiling-man.jpg?s=612x612&w=0&k=20&c=hkCg5CrmTKOApePbPOyo1U9GexEfIJOJqoLXJIvcN8E=",

        "Ali_yous..",
        '15 augest',
        true
    ),

  ];
  List<Posts> myPosts = [
    Posts(
        1,
      'https://thumbs.dreamstime.com/b/close-up-portrait-her-nice-looking-cute-lovely-attractive-funny-cheerful-cheery-girl-buns-beaming-smile-isolated-over-139731748.jpg',
        'Mystical Dimples',
      'https://st4.depositphotos.com/1017228/21338/i/450/depositphotos_213386084-stock-photo-portrait-excited-young-woman-celebrating.jpg',
        '7 hours ago',
        'reem ali',
        '634',
        'datetime',
        'https://img.freepik.com/premium-photo/close-up-portrait-casual-pretty-young-smiling-girl-looking-camera-isolated-blue-background_171337-78085.jpg',
        'https://www.shutterstock.com/image-photo/portrait-standing-thoughtful-serious-smart-600nw-2154370765.jpg',
        'https://t4.ftcdn.net/jpg/03/03/11/75/360_F_303117590_NNmo6BS2fOBEmDp8uKs2maYmt03t8fSL.jpg',

    ),
    Posts(
        2,
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjjAUdWYxgJxYrI9q2EJNSRPcLdBr3EA4YR4LlNPZ2HgvoxDu3xUKIdmcxvrT0kWM_fBI&usqp=CAU',
        'Jigra_Hai_Tiger',
        'https://media.istockphoto.com/id/1014791354/photo/charming-man.webp?b=1&s=170667a&w=0&k=20&c=Av2D8VYfMM53SN6xNE_NJO9drAvdUDbInTS_j67vbx0=',
        '11 hours ago',
        'Ahmed Mohamed',
        '825',
        'datetime',
        'https://st3.depositphotos.com/1017228/18878/i/450/depositphotos_188781580-stock-photo-handsome-cheerful-young-man-standing.jpg',
        'https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg',
        'https://img.freepik.com/premium-photo/attractive-man-points-with-both-hands-himself-handsome-guy-proposes-smiles_324489-2222.jpg'
    ),
    Posts(
        3,
        'https://images.pexels.com/photos/445109/pexels-photo-445109.jpeg?auto=compress&cs=tinysrgb&w=600',
        'Garden Rose',
        'https://media.istockphoto.com/id/1064747712/photo/traveler-girl-follow-me.jpg?s=612x612&w=0&k=20&c=KbEVU7xK7G-2xf53vT5g2oDhpbmikcg5eUNC7Ks6sfA=',
        '15 hours ago',
        'youra_sabry',
        '2,854',
        'datetime',
        'https://st4.depositphotos.com/1049680/24950/i/450/depositphotos_249505144-stock-photo-young-handsome-man-wearing-casual.jpg',
        'https://t4.ftcdn.net/jpg/03/03/11/75/360_F_303117590_NNmo6BS2fOBEmDp8uKs2maYmt03t8fSL.jpg',
      'https://st3.depositphotos.com/1017228/18878/i/450/depositphotos_188781580-stock-photo-handsome-cheerful-young-man-standing.jpg',
    ),
    Posts(
        4,
        'https://thumbs.dreamstime.com/b/photo-astonished-girl-hold-phone-look-screen-open-mouth-raise-fist-wear-orange-sweater-isolated-teal-color-background-209876707.jpg',
        'Daisy Louis',
        'https://img.freepik.com/free-photo/excited-happy-young-pretty-woman_171337-2006.jpg',
        '20 hours ago',
        'saber_elsayed',
        '1,456',
        'datetime',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJEdn_T4hoO_D_BA2Mbqx0ynqae50GobLo8bZg_CbWIpjo2HKOiBDw6Ro1cW6HPsKi-CQ&usqp=CAU',
      'https://img.freepik.com/premium-photo/attractive-man-points-with-both-hands-himself-handsome-guy-proposes-smiles_324489-2222.jpg',
          'https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg',
    ),
    Posts(
      5,
      'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?size=626&ext=jpg&ga=GA1.1.1638002128.1695230163&semt=sph',
      'MrMystery',
      'https://thumbs.dreamstime.com/b/portrait-healthy-man-combing-his-hair-fingers-portrait-healthy-man-combing-his-hair-fingers-171648419.jpg',
      '16 August',
      'karam_fawzy',
      '935',
      'datetime',
     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIo9RNH8yjHxyPlX-D85QYZxd2ge2a0VbzjSt3aOFZeUaslNF2Nzyl5anNi5Y6NJoAQlA&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZBp400mAwT3OI0I6LeAcg1tu7xuw1JX5RCco3u5ofvZAJ5zEOIsZe1nHWjuIE3mH72E0&usqp=CAU',
      'https://t4.ftcdn.net/jpg/03/03/11/75/360_F_303117590_NNmo6BS2fOBEmDp8uKs2maYmt03t8fSL.jpg',
    ),
    Posts(
      6,
      'https://st3.depositphotos.com/12982378/36300/i/450/depositphotos_363001364-stock-photo-pensive-businesswoman-holding-hand-chin.jpg',
      'selfmadegirl',
      'https://img.freepik.com/free-photo/medium-shot-woman-holding-coffee-cup_23-2149455866.jpg?size=626&ext=jpg&ga=GA1.1.2116175301.1701129600&semt=ais',
      '4 April',
      'pelli_karla',
      '845',
      'datetime',
      'https://www.shutterstock.com/image-photo/portrait-standing-thoughtful-serious-smart-600nw-2154370765.jpg',
      'https://img.freepik.com/premium-photo/close-up-portrait-casual-pretty-young-smiling-girl-looking-camera-isolated-blue-background_171337-78085.jpg',
      'https://t4.ftcdn.net/jpg/03/03/11/75/360_F_303117590_NNmo6BS2fOBEmDp8uKs2maYmt03t8fSL.jpg',
    ),


  ];
  bool isFavorited = false;
  bool isBooked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar:AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            titles[currentIndex],
            style: GoogleFonts.getFont('Lobster Two', fontSize: 30),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),

            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                saveLoggedOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              icon: ImageIcon(
                AssetImage(
                  "lib/images/4805005-200.png",
                ),
                //color: Colors.black,
              ),
            ),
          ],

        ),
        body:
        ListView(
          children: [
            buildStoryItem(),
            postsItem(),
          ],
        ),

    );
  }


  Widget buildStoryItem() {
    return SizedBox(
        height: 100,
        child:
        ListView.builder(
          scrollDirection: Axis.horizontal,
            itemCount: myStory.length +1,
            itemBuilder: (context, index) {
              return index == 0
                  ? yourStoryWidget()
                  :
              InkWell(
                onTap: ()=> Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context)=>
                      StoryViewScreen(),)),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Visibility(
                              visible: !myStory[index -1 ].shown,
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration:
                                // !myStory[index -1 ].shown?
                                // BoxDecoration() :
                                BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFf9ce34),
                                          Color(0xFFee2a7b),
                                          Colors.deepOrangeAccent,
                                          Colors.purpleAccent,
                                    ]),
                                    shape: BoxShape.circle),
                                child: Padding(
                                  //this padding will be you border size
                                  padding: EdgeInsets.all(3.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                  ),
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: !myStory[index -1 ].shown? 24 : 28,
                              backgroundColor: Colors.white,
                              foregroundImage: NetworkImage(myStory[index -1].image),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(myStory[index -1].name),


                      ]),
                ),
              );
            },
        )
    );
  }

  Widget yourStoryWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              GestureDetector(
                onTap: () {},
                    //openAddStory(),
                // Image tapped
                child: CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage('lib/images/image.png'),
                ),
              ),

              CircleAvatar(
                radius: 10,
                backgroundColor: Colors.white,
              ),
              CircleAvatar(
                  radius: 9,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.add,
                    size: 16,
                    color: Colors.white,)
              ),

            ],
          ),
          const SizedBox(height: 5),
          const Text("Your story"),
        ],
      ),
    );
  }

  Widget postsItem() {
    return Expanded(
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: myPosts.length,
            itemBuilder: (context, index) {
              Posts post = myPosts[index];
              return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 5, right: 5, top: 10),
                        child: Row(children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                post.profImage),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text( post.name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.more_vert)),
                        ]),
                      ),
                      SizedBox(height: 3,),
                      Image.network(
                        post.postImage,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                      Row(
                        children: [
                          SizedBox(width: 5,),
                          // IconButton(
                          //   onPressed: () {
                          //     myPosts[index]== 1?
                          //     setState(() => isFavorited = !isFavorited)
                          //     :setState(() => isFavorited = isFavorited);
                          //   },
                          //   icon: isFavorited
                          //       ? Icon(Icons.favorite,color: Colors.red,)
                          //       : Icon(Icons.favorite_border),
                          // ),

                          FavoriteButton(
                            iconSize: 40,
                            isFavorite: false,
                            valueChanged: (_isFavorite) {
                              print('Is Favorite : $_isFavorite');
                            },
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: ImageIcon(
                              AssetImage(
                                "lib/images/comment.png",
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: ImageIcon(
                              AssetImage(
                                "lib/images/share.png",
                              ),
                            ),
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () {
                                setState(() => isBooked = !isBooked);
                              },
                              icon: isBooked?
                            Icon(Icons.bookmark):
                                  Icon(Icons.bookmark_border)
                          ),
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 10,
                                backgroundImage:
                                NetworkImage(
                                  post.image1,
                                ),
                              ),
                              CircleAvatar(
                                radius: 10,
                                backgroundImage:
                                NetworkImage(
                                  post.image2,
                                ),
                              ),
                              CircleAvatar(
                                radius: 10,
                                backgroundImage:
                                NetworkImage(
                                  post.image3,
                                ),
                              ),

                              SizedBox(width: 10),
                              RichText(
                                text: TextSpan(
                                  text: 'Liked by ',
                                  style: DefaultTextStyle
                                      .of(context)
                                      .style,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: post.likedBy,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: ' and '),
                                    TextSpan(
                                        text: 'Others',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              )
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: Text("View all ${ myPosts[index].number} comments"),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: RichText(
                            text: TextSpan(
                              text:  myPosts[index].date,
                              style: DefaultTextStyle
                                  .of(context)
                                  .style,
                              children: <TextSpan>[
                                TextSpan(
                                    text: ' . see translation',
                                    style: TextStyle(fontWeight: FontWeight
                                        .bold)),
                              ],
                            ),

              ))
            ] )
              );
              } )
              );
            }

 //void openAddStory() {
 //   Navigator.push(context, MaterialPageRoute(
 //       builder: (context) => AddStory())
  //  ).then((value) => addToStory(value),);
  //}

 void addToStory(Stories value) {
    myStory.add(value);
    setState(() {

    });
  }

// void openAddPostScreen() {
//    Navigator.push(context, MaterialPageRoute(
 //       builder: (context) => AddPostScreen())
 //   ).then((value) => addNewPost(value));
 // }

 void addNewPost(Posts value) {
    myPosts.add(value);
    setState(() {
    });
  }

  void saveLoggedOut() async {
    final loggedOut = PreferenceUtils.setBool(PreferenceKey.loggedIn, false);
  }
}

