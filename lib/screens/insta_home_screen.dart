import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instgram/models/posts.dart';
import 'package:instgram/screens/add_post.dart';
import 'package:instgram/screens/add_story.dart';
import 'package:instgram/models/stories.dart';
import 'package:instgram/story_model.dart';

class InstaHomeScreen extends StatefulWidget {
  const InstaHomeScreen({super.key});

  @override
  State<InstaHomeScreen> createState() => _InstaHomeScreenState();
}

class _InstaHomeScreenState extends State<InstaHomeScreen> {
  int currentIndex = 0;
  dynamic titles = ["Instagram", "search", "Add", "Reels", "Profile"];

  List <Stories> myStory = [
    Stories(
        "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
        "Rahma"
    ),
  ];
  List<Posts> myPosts = [
    Posts('https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg',
        'rahoma',
        'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
        '30 August', '345'),
  ];
  bool isFavorited = false;
  bool isBooked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
            onPressed: () =>
                openAddPostScreen(),

          child: Icon(Icons.add),
        ),
        body:
        Column(children: [
          buildStoryItem(),
          postsItem(),

        ],
        )
    );
  }

  Widget buildStoryItem() {
    return SizedBox(
        height: 100,
        child:
        ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: myStory.length,
            itemBuilder: (context, index) {
              return index == 0
                  ? yourStoryWidget()
                  :
              Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
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
                              padding: EdgeInsets.all(3.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                              ),

                            ),
                          ),
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.white,
                            foregroundImage: NetworkImage(myStory[index].image),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(myStory[index].name),


                    ]),
              );
            }
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
                onTap: () => openAddStory(),
                // Image tapped
                child: CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage('lib/images/proffile.jpg'),
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
    return  Expanded(
      child: ListView.builder(
              itemCount: myPosts.length,
              itemBuilder: (context, index) {
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
                            child: Text(myPosts[index].name,
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
                                backgroundImage: AssetImage(
                                    'lib/images/mountain-landscape-2031539_640.jpg'),
                              ),
                              CircleAvatar(
                                radius: 10,
                                backgroundImage:
                                AssetImage(
                                    'lib/images/mountains-736886_1280.jpg'),
                              ),
                              CircleAvatar(
                                radius: 10,
                                backgroundImage:
                                AssetImage('lib/images/night-3078326_640.jpg'),
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
                                        text: 'Rahma Ahmed',
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
                        child: Text("View all ${myPosts[index].number} comments"),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: RichText(
                            text: TextSpan(
                              text: myPosts[index].date,
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
                          )
                      ),
                    ],
                  ),
                );
              }


      ),
    );
  }

 void openAddStory() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => AddStory())
    ).then((value) => addToStory(value),);
  }

 void addToStory(Stories value) {
    myStory.add(value);
    setState(() {

    });
  }

 void openAddPostScreen() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => AddPostScreen())
    ).then((value) => addNewPost(value));
  }

 void addNewPost(Posts value) {
    myPosts.add(value);
    setState(() {
    });
  }
}
