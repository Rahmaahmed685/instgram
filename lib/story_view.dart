import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoryViewScreen extends StatefulWidget {
  const StoryViewScreen({super.key});

  @override
  State<StoryViewScreen> createState() => _StoryViewScreenState();
}

class _StoryViewScreenState extends State<StoryViewScreen> {

  final controller = StoryController();

int currentIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    List<StoryItem> storyItems = [
      StoryItem.text(
          title: 'Rahma Ahmed',
          backgroundColor: Colors.lightBlueAccent,
      ),
      StoryItem.pageImage(
        url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd4y7zVmHqMDDZPFYCAtIvlWWGYofVYEwNg4AyzbXsRg&s"
         , controller: controller,),
    ]; // your list of stories

    return StoryView(
      storyItems: storyItems,
      controller: controller,
      // pass controller here too
      repeat: false,
      // should the stories be slid forever
      onStoryShow: (s) {
        //notifyServer(s)
      },
      onComplete: () {},
      onVerticalSwipeComplete: (direction) {
        if (direction == Direction.down) {
          Navigator.pop(context);
        }
      }, // To disable vertical swipe gestures, ignore this parameter.
    );
  }
}