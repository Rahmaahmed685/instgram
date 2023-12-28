
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(''),),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text("Find Your Account",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900),)),
              Padding(
                padding: const EdgeInsets.only(left: 60,right: 60),
                child: Text('Enter Your username or the email or phone number linked to your account',style: TextStyle(fontSize: 15,),),
              ),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8),
                child: TextFormField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText:  'username,email address or phone number',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return " Enter a valid email";
                    }
                    return null;
                  },

                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8),
                child:
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      resetPassword();
                    },
                    child: Text('Reset Password',style: TextStyle(color: Colors.white54),),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.cyan[200],
                      onPrimary: Colors.blue[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(  context,
                    //   MaterialPageRoute(
                    //       builder: (context) => SignUp()), );
                  },
                  child: Text(
                    'can\'t Reset your Password?',
                    style: TextStyle(fontSize: 15,
                        color: Colors.blue),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 1.0,
                      width: 130.0,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    'OR',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 1.0,
                      width: 130.0,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      //action coe when button is pressed
                    },
                    icon: Icon(Icons.facebook,color: Colors.blue[900],),
                  ),
                  Text("Log in With Facebook",style: TextStyle(color: Colors.blue[900]),)

                ],),
            ],),
        ),
      ),

    );
  }
  Future<void> resetPassword() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    String email = emailController.text.trim();

    await FirebaseAuth.instance
        .sendPasswordResetEmail(
      email: email,
    ).then((value) {
      Fluttertoast.showToast(msg: "Password Email Sent");
      Navigator.pop(context);
    }).catchError((error) {
      print("Error => ${error}");

      if (error is FirebaseAuthException) {
        print("Error => ${error.code}");
        if (error.code == 'user-not-found') {
          displayToast('No user found for that email.');
        } else if (error.code == 'wrong-password') {
          displayToast('Wrong password provided for that user.');
        } else if (error.code == 'too-many-requests') {
          displayToast(
              'We have blocked all requests from this device due to unusual activity. Try again later.');
        }
      } else {
        Fluttertoast.showToast(msg: error.toString());

      }

    });

  }
  void displayToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}


