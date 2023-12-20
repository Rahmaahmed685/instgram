import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoryViewScreen extends StatefulWidget {
  const StoryViewScreen({super.key});

  @override
  State<StoryViewScreen> createState() => _StoryViewScreenState();
}

class _StoryViewScreenState extends State<StoryViewScreen> {

  final controller = StoryController();


  @override
  Widget build(BuildContext context) {
    List<StoryItem> storyItems = [
      StoryItem.text(
          title: 'Rahma Ahmed',
          backgroundColor: Colors.lightBlueAccent,
        textStyle: TextStyle(),
      ),
      StoryItem.pageImage(
        url: 'https://thumbs.dreamstime.com/b/blue-gerbera-flower-isolated-png-format-white-background-macro-photograph-137393818.jpg'
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