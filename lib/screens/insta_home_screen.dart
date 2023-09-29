import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instgram/story_model.dart';

class InstaHomeScreen extends StatefulWidget {
  const InstaHomeScreen({super.key});

  @override
  State<InstaHomeScreen> createState() => _InstaHomeScreenState();
}

class _InstaHomeScreenState extends State<InstaHomeScreen> {
  int currentIndex = 0;
  final titles = ["Instagram", "search", "Add", "Reels", "Profile"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                yourStoryWidget(),
               storyModel(image: 'lib/images/image6.jpg', text: "title1"),
                storyModel(image: 'lib/images/image5.jpg', text: "title1"),
                storyModel(
                    image: 'lib/images/tree-838667_640.jpg', text: 'story1'),
                storyModel(image: 'lib/images/image2.jpg', text: 'story2'),
                storyModel(image: 'lib/images/image8.webp', text: 'story3'),
                storyModel(image: 'lib/images/image4.jpg', text: 'story4'),
                storyModel(
                    image: 'lib/images/image5.jpg',
                    text: 'story5'),
                storyModel(image: 'lib/images/image6.jpg', text: 'story6'),
                storyModel(image: 'lib/images/image7.jpg', text: 'story7'),
                storyModel(image: 'lib/images/image8.webp', text: 'story8'),
              ],
            ),
          ),

            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  postsModel(
                      profImage: 'lib/images/image4.jpg',
                      title: "Reem Sherif",
                      postImage: 'lib/images/mountains-736886_1280.jpg',
                      date: '10 hour ago ',
                      number: 450
                  ),
                  postsModel(
                      profImage: 'lib/images/image5.jpg',
                      title: "Reham Taha",
                      postImage:'lib/images/image1.jpg',
                      date: '11 hour ago ',
                      number: 365
                  ),
                  postsModel(
                      profImage: 'lib/images/image2.jpg',
                      title: "Adam Ali",
                      postImage: 'lib/images/image8.webp',
                      date: '17 hour ago ',
                      number: 459
                  ),
                  postsModel(
                      profImage: 'lib/images/image7.jpg',
                      title: "Hossam Ahmed",
                      postImage: 'lib/images/Snow night.jpg',
                      date: '3 March ',
                      number: 760

                  ),
                  postsModel(
                      profImage: 'lib/images/image2.jpg',
                      title: "Hager Salah",
                      postImage: 'lib/images/image5.jpg',
                      date: '14 Septemper ',
                      number: 345
                  ),
                  postsModel(
                      profImage: 'lib/images/image7.jpg',
                      title: "Gehad Nabil",
                      postImage: 'lib/images/pexels-vh-s-2377965.jpg',
                      date: '30 July ',
                      number: 123
                  ),
                  postsModel(
                      profImage: 'lib/images/image6.jpg',
                      title: "Sara Mohamed",
                      postImage: 'lib/images/sea-164989_640.jpg',
                      date: '29 August ',
                      number: 205
                  ),
                ],
              ),
            ),

          ]),
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
              CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage('lib/images/proffile.jpg'),
              ),
              const CircleAvatar(
                radius: 10,
                backgroundColor: Colors.white,
              ),
              const CircleAvatar(
                radius: 9,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.add,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Text("Your story"),
        ],
      ),
    );
  }
  Widget postsModel ({
    required String profImage ,
    required String title,
    required String postImage,
    required String date,
    required int number
  }) {
    return Expanded(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
              child: Row(children: [
                CircleAvatar(
                  backgroundImage: AssetImage(profImage),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(title,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
              ]),
            ),
            SizedBox(height: 3,),
            Image.asset(
              postImage,
              height: 200,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon:  Icon(Icons.favorite_border_rounded),
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
                    onPressed: () {}, icon: Icon(Icons.bookmark_border)),
              ],
            ),
            Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10),
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
                      AssetImage('lib/images/mountains-736886_1280.jpg'),
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
                        style: DefaultTextStyle.of(context).style,
                        children:  <TextSpan>[
                          TextSpan(
                              text: 'Rahma Ahmed',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: ' and '),
                          TextSpan(
                              text: 'Others',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 5),
              child: Text("View all $number comments"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
               child: RichText(
                  text: TextSpan(
                    text: date,
                    style: DefaultTextStyle.of(context).style,
                    children:  <TextSpan>[
                      TextSpan(
                          text: '. see translation',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }

  Widget postView() {
    return Expanded(
      child: ListView.builder(
          //scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
        return Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
                child: Row(children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('lib/images/Snow night.jpg'),
                  ),
                  const SizedBox(width: 5),
                  const Expanded(
                    child: Text(
                      'Rahma Ahmed',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
                ]),
              ),
              Image.asset(
                'lib/images/sunset-3325080_640.jpg',
                height: 200,
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border_rounded),
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
                      onPressed: () {}, icon: Icon(Icons.bookmark_border)),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 8,
                        backgroundImage: AssetImage(
                            'lib/images/mountain-landscape-2031539_640.jpg'),
                      ),
                      CircleAvatar(
                        radius: 8,
                        backgroundImage:
                            AssetImage('lib/images/mountains-736886_1280.jpg'),
                      ),
                      CircleAvatar(
                        radius: 8,
                        backgroundImage:
                            AssetImage('lib/images/night-3078326_640.jpg'),
                      ),
                      const SizedBox(width: 10),
                      RichText(
                        text: TextSpan(
                          text: 'Liked by ',
                          style: DefaultTextStyle.of(context).style,
                          children: const <TextSpan>[
                            TextSpan(
                                text: 'Rahma Ahmed',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: ' and '),
                            TextSpan(
                                text: 'Others',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      )
                    ],
                  )),
            ],
          ),
        );
      }),
    );
  }

  Widget viewPost() {
    return Expanded(
      child: ListView.builder(
          //scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
        return Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
                child: Row(children: [
                  CircleAvatar(
                    backgroundImage:
                        AssetImage('lib/images/mountains-736886_1280.jpg'),
                  ),
                  const SizedBox(width: 5),
                  const Expanded(
                    child: Text(
                      'Reem Ahmed',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
                ]),
              ),
              Image.asset(
                'lib/images/sea-164989_640.jpg',
                height: 270,
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border_rounded),
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
                      onPressed: () {}, icon: Icon(Icons.bookmark_border)),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 8,
                        backgroundImage: AssetImage(
                            'lib/images/mountain-landscape-2031539_640.jpg'),
                      ),
                      CircleAvatar(
                        radius: 8,
                        backgroundImage:
                            AssetImage('lib/images/mountains-736886_1280.jpg'),
                      ),
                      CircleAvatar(
                        radius: 8,
                        backgroundImage:
                            AssetImage('lib/images/night-3078326_640.jpg'),
                      ),
                      const SizedBox(width: 10),
                      RichText(
                        text: TextSpan(
                          text: 'Liked by ',
                          style: DefaultTextStyle.of(context).style,
                          children: const <TextSpan>[
                            TextSpan(
                                text: 'Rahma Ahmed',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: ' and '),
                            TextSpan(
                                text: 'Others',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      )
                    ],
                  )),
            ],
          ),
        );
      }),
    );
  }
}
