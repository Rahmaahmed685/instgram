import 'package:flutter/material.dart';
import 'package:instgram/models/posts.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {

  final profImageController =TextEditingController();
  final nameController =TextEditingController();
  final postImageController =TextEditingController();
  final dateController =TextEditingController();
  final numberController =TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Form(
            key: formKey,
            child: ListView(children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  controller: profImageController,
                  decoration: InputDecoration(
                    label: Text("prof image")
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "invalid url";
                    }
                    return null;
                  }
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        label: Text("name")
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "invalid url";
                      }
                      return null;
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                    controller: postImageController,
                    decoration: InputDecoration(
                        label: Text("post image")
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "invalid url";
                      }
                      return null;
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                    controller: dateController,
                    decoration: InputDecoration(
                        label: Text("time")
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "invalid url";
                      }
                      return null;
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                    controller: numberController,
                    decoration: InputDecoration(
                        label: Text("number of comments")
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "invalid url";
                      }
                      return null;
                    }
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: ()=>
                  addPost(),
                child: Text("Add post"),
              )
            ],),
          )
    );
  }

  void addPost(){
    if(!formKey.currentState!.validate()){
      return;
    }
    String profImage = profImageController.text;
    String name = nameController.text;
    String postImage = postImageController.text;
    String date = dateController.text;
    String number = numberController.text;

    final post = Posts(
        profImage, name,
        postImage, date, number);

    Navigator.pop(context, post);

  }
}
