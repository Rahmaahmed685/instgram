import 'package:flutter/material.dart';
import 'package:instgram/models/stories.dart';

class AddStory extends StatefulWidget {
  const AddStory({super.key});

  @override
  State<AddStory> createState() => _AddStoryState();
}

class _AddStoryState extends State<AddStory> {

  final nameController = TextEditingController();
  final imageController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Add Story",style: TextStyle(color: Colors.white),),),
      body :
      Form(
        key: formKey,
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("name"),
              ),
              validator:(value){
                if(value!.isEmpty){
                  return "enter name";
                }return null;
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: imageController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("image"),
              ),
                 validator:(value) {
                   if (value!.isEmpty) {
                     return "enter url";
                   }
                   return null;
                 }
            ),
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: ()=>
          addStory(),
              child: Text("Add story"),
          )
        ],),
      )

    );
  }

 void addStory() {
    if(!formKey.currentState!.validate()){
      return;
    }
    String name = nameController.text;
    String image = imageController.text;

    final story = Stories(image, name);

    Navigator.pop(context,story);
  }

}
