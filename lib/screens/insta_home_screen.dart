import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instgram/models/posts.dart';
import 'package:instgram/models/stories.dart';
import 'package:instgram/story_view.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

class InstaHomeScreen extends StatefulWidget {
  const InstaHomeScreen({super.key});

  @override
  State<InstaHomeScreen> createState() => _InstaHomeScreenState();
}

class _InstaHomeScreenState extends State<InstaHomeScreen> {
  final _controllerGroup = LinkedScrollControllerGroup();

  int currentIndex = 0;
  dynamic titles = ["Instagram", "search", "Add", "Reels", "Profile"];

  List <Stories> myStory = [
    Stories(1,
        "https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg",
        "Rahma",
        "13 augest", false
    ),
    Stories(2,
        "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
        "Rahma", '15 augest', false
    ),
    Stories(3,
        "https://www.shutterstock.com/image-photo/successful-caucasian-young-man-student-260nw-2141124049.jpg",
        "Rahma",
        "13 augest", true
    ),
    Stories(4,
        "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
        "Rahma", '15 augest', true
    ),
    Stories(5,
        "https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg",
        "Rahma",
        "13 augest", false
    ),
    Stories(6,
        "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
        "Rahma", '15 augest', true
    ),
    Stories(7,
        "https://www.shutterstock.com/image-photo/successful-caucasian-young-man-student-260nw-2141124049.jpg",
        "Rahma",
        "13 augest", false
    ),
    Stories(8,
        "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
        "Rahma", '15 augest', true
    ),

  ];
  List<Posts> myPosts = [
    Posts(
        1,
      'https://thumbs.dreamstime.com/b/close-up-portrait-her-nice-looking-cute-lovely-attractive-funny-cheerful-cheery-girl-buns-beaming-smile-isolated-over-139731748.jpg',
        'rahoma',
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
        'https://thumbs.dreamstime.com/b/photo-astonished-girl-hold-phone-look-screen-open-mouth-raise-fist-wear-orange-sweater-isolated-teal-color-background-209876707.jpg',
        'rahoma',
        'https://img.freepik.com/free-photo/excited-happy-young-pretty-woman_171337-2006.jpg',
        '20 August',
        'Ahmed Mohamed',
        '825',
        'datetime',
        'https://st3.depositphotos.com/1017228/18878/i/450/depositphotos_188781580-stock-photo-handsome-cheerful-young-man-standing.jpg',
        'https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg',
        'https://img.freepik.com/premium-photo/attractive-man-points-with-both-hands-himself-handsome-guy-proposes-smiles_324489-2222.jpg'
    ),
    Posts(
      1,
      'https://thumbs.dreamstime.com/b/close-up-portrait-her-nice-looking-cute-lovely-attractive-funny-cheerful-cheery-girl-buns-beaming-smile-isolated-over-139731748.jpg',
      'rahoma',
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
        'https://thumbs.dreamstime.com/b/photo-astonished-girl-hold-phone-look-screen-open-mouth-raise-fist-wear-orange-sweater-isolated-teal-color-background-209876707.jpg',
        'rahoma',
        'https://img.freepik.com/free-photo/excited-happy-young-pretty-woman_171337-2006.jpg',
        '20 August',
        'Ahmed Mohamed',
        '825',
        'datetime',
        'https://st3.depositphotos.com/1017228/18878/i/450/depositphotos_188781580-stock-photo-handsome-cheerful-young-man-standing.jpg',
        'https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg',
        'https://img.freepik.com/premium-photo/attractive-man-points-with-both-hands-himself-handsome-guy-proposes-smiles_324489-2222.jpg'
    ),
    Posts(
      1,
      'https://thumbs.dreamstime.com/b/close-up-portrait-her-nice-looking-cute-lovely-attractive-funny-cheerful-cheery-girl-buns-beaming-smile-isolated-over-139731748.jpg',
      'rahoma',
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
        'https://thumbs.dreamstime.com/b/photo-astonished-girl-hold-phone-look-screen-open-mouth-raise-fist-wear-orange-sweater-isolated-teal-color-background-209876707.jpg',
        'rahoma',
        'https://img.freepik.com/free-photo/excited-happy-young-pretty-woman_171337-2006.jpg',
        '20 August',
        'Ahmed Mohamed',
        '825',
        'datetime',
        'https://st3.depositphotos.com/1017228/18878/i/450/depositphotos_188781580-stock-photo-handsome-cheerful-young-man-standing.jpg',
        'https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg',
        'https://img.freepik.com/premium-photo/attractive-man-points-with-both-hands-himself-handsome-guy-proposes-smiles_324489-2222.jpg'
    ),
  ];
  bool isFavorited = false;
  bool isBooked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
          //controller: _controllerGroup.addAndGet(), // << add here
         // shrinkWrap: true,
          scrollDirection: Axis.horizontal,
         // separatorBuilder: (context, j) => SizedBox(width: 5,),
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
                  backgroundImage: AssetImage('lib/images/imagess.png'),
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
                                myPosts[index].profImage),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text( myPosts[index].name,
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
                        myPosts[index].postImage,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() => isFavorited = !isFavorited);
                            },
                            icon: isFavorited
                                ? Icon(Icons.favorite,color: Colors.red,)
                                : Icon(Icons.favorite_border),
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
                                  myPosts[index].image1,
                                ),
                              ),
                              CircleAvatar(
                                radius: 10,
                                backgroundImage:
                                NetworkImage(
                                  myPosts[index].image2,
                                ),
                              ),
                              CircleAvatar(
                                radius: 10,
                                backgroundImage:
                                NetworkImage(
                                  myPosts[index].image3,
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
                                        text: myPosts[index].likedBy,
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
}

