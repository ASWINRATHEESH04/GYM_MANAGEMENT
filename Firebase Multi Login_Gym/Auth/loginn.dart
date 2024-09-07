import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_management/Firebase%20Multi%20Login_Gym/Auth/registerr.dart';
import 'package:gym_management/Firebase%20Multi%20Login_Gym/Auth/reset_password.dart';

import '../../main.dart';
import '../Trainer/trainer_add_data.dart';
import '../Trainer/trainer_home_page.dart';
import '../Owner/Owner_Home_Page.dart';
import '../../edit_profile_test/TrainerAddData.dart';
import '../../edit_profile_test/TrainerHomePage.dart';
import '../member/Member_add_data.dart';
import '../member/Member_home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure3 = true;
  bool visible = false;



  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController codeController = new TextEditingController();


  var existinmessage;

  @override
  void initState() {

    existinmessage = '';

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height * 0.70,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(30),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 250,
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,

                            hintText: 'Email',
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                            border: OutlineInputBorder(
                              borderSide: new BorderSide(width:3,color: Colors.black),
                              borderRadius: new BorderRadius.circular(15),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value!.length == 0) {
                              return "Email cannot be empty";
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please enter a valid email");
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            emailController.text = value!;
                          },
                          keyboardType: TextInputType.emailAddress
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: _isObscure3,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure3
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscure3 = !_isObscure3;
                                  });
                                }),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Password',
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 15.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            RegExp regex = new RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            }
                            if (!regex.hasMatch(value)) {
                              return ("please enter valid password min. 6 character");
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            passwordController.text = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                          controller: codeController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Personal code',
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value!.length == 0) {
                              return "code cannot be empty";
                            }


                            
                          },
                          onSaved: (value) {
                            emailController.text = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),

                        SizedBox(height: 20,),
                        Padding(
                          padding: EdgeInsets.only(left:230),
                          child: TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPassword()));
                          }, child: Text("Forget Password?"))
                        ),SizedBox(height: 20,),

                        SizedBox(
                          height: MediaQuery.of(context).size.height / 15,
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                            ),
                            onPressed: ()
                                //async
                                {
                              setState(() {
                                visible = true;
                              });

                              if (_formkey.currentState!.validate()) {
                                signIn(emailController.text,
                                    passwordController.text,
                                  codeController.text,


                                );
                                emailController.clear();
                                passwordController.clear();
                                // //codeController.clear();
                              }
                            },
                            child: Text(
                              'Login',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'New User?',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Register()));
                                },
                                child: Text("Register Now"))
                          ],
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        // Visibility(
                        //     maintainSize: true,
                        //     maintainAnimation: true,
                        //     maintainState: true,
                        //     visible: visible,
                        //     child: Container(
                        //         child: CircularProgressIndicator(
                        //       color: Colors.white,
                        //     ))),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('userdata')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        // FirebaseFirestore.instance
        //     .collection('Trainer_Add_Data')
        //     .limit(1)
        //     .get()
        //     .then((snapshot) {
          //  FirebaseFirestore.instance.collection('image_tb').limit(1).get().then((snapshot) {

        //   if (documentSnapshot.get('role') == "Trainer" && snapshot.size == 1) {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => Trainer(),
        //       ),
        //     );
        //   }
        //
        //   if (documentSnapshot.get('role') == "Trainer" && snapshot.size == 0) {
        //     print("No collection");
        //
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => Trainer_add_Data(),
        //       ),
        //     );
        //   }
        // });

        if (documentSnapshot.get('role') == "Owner" && codeController.text == '1400') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Owner(),
            ),
          );
        }


        var tt = await FirebaseFirestore.instance
            .collection('Trainer_add_data')
            .doc(email_get)
            .get();

        if (documentSnapshot.get('role') == "Trainer" && tt.exists && codeController.text == '900') {
          existinmessage = "Trainer $email_get is exist";
          print(existinmessage);

          setState(() {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => trainerrhome(),
                ));
          });


        }
        if (documentSnapshot.get('role') == "Trainer" && !tt.exists &&  codeController.text == '900') {
          existinmessage = "Trainer $email_get is not exist";
          print(existinmessage);

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => trainer_add_data(),
              ));
        }





        //
        // if (documentSnapshot.get('role') == "Member") {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => memberhome(),
        //     ),
        //   );
        // }

        var kk = await FirebaseFirestore.instance
            .collection('Member_Add_Data')
            .doc(email_get)
            .get();

        if (documentSnapshot.get('role') == "Member" && kk.exists &&  codeController.text == '1000') {
          existinmessage = "member $email_get is exist";
          print(existinmessage);

          setState(() {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => memberhome(),
                ));
          });


        }
        if (documentSnapshot.get('role') == "Member" && !kk.exists &&  codeController.text == '1000') {
          existinmessage = "member $email_get is not exist";
          print(existinmessage);

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Member_add_data(),
              ));
        }
      } else {
        print('Document does not exist on the database');
        Fluttertoast.showToast(
          msg: "Document does not exist on the database",
        );
      }
    });
  }

  void signIn(String email, String password,String code) async {
    if (_formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,

        );
        route();
        email_get = email;

        // emailController.clear();
        // passwordController.clear();
        // codeController.clear();

      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
          Fluttertoast.showToast(
              msg: "No user found for that email.",
              toastLength: Toast.LENGTH_SHORT,
              backgroundColor: Colors.teal,
              textColor: Colors.white
          );


        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');

          Fluttertoast.showToast(
            msg: "Wrong password provided for that user",
             toastLength: Toast.LENGTH_SHORT,
            backgroundColor: Colors.teal,
            textColor: Colors.white
          );
        }

        // else{
        //   Fluttertoast.showToast(
        //       msg: "No Internet Connection",
        //       toastLength: Toast.LENGTH_SHORT,
        //       backgroundColor: Colors.teal,
        //       textColor: Colors.white
        //   )
        //
        // }
        }
    }
  }
}
