
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final bioController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    bioController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
            key: formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nameController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: usernameController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'username',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.verified_user),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: phoneController,
                textInputAction: TextInputAction.next,
                maxLength: 11,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: emailController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return ' Please Enter Your Email';
                  }if(!value.contains('@') || !value.contains('.')){
                    return 'Please Enter Valid Email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: passwordController,
                textInputAction: TextInputAction.done,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                validator:  (value){
                  if(value!.isEmpty){
                    return 'Enter Your password';
                  }if(value.length < 6){
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(

                  onPressed: () {
                    String email = emailController.text;
                    String password = passwordController.text;
                    createAccount(email, password);
                    print('Register pressed');
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder()),
                  child: const Text("Sign Up"),
                ),
              ),
              TextFormField(
                controller: bioController,
                decoration: const InputDecoration(
                  border: InputBorder.none
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void createAccount(String emailAddress, String password) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    try {
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      onRegisterSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Fluttertoast.showToast(msg: "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Fluttertoast.showToast(
            msg: "The account already exists for that email.");
      }
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  void onRegisterSuccess() {
    saveUserData();
    Fluttertoast.showToast(msg: "Account Created!");
    Navigator.pop(context);
  }

  void saveUserData() {
    final userId = auth.currentUser!.uid;

    final data = {
      'id': userId,
      'name': nameController.text,
      'phone': phoneController.text,
      'email': emailController.text,
      'username': usernameController.text,
      'bio': bioController.text,
      'imageUrl': ''
    };

    firestore.collection("users").doc(userId).set(data);
  }
}