import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../main.dart';
import 'Member_home_page.dart';


class Member_Product_Buy_Page extends StatefulWidget {

 var price,producr_name;
 Member_Product_Buy_Page({required this.price,required this.producr_name});


  @override
  _Member_add_DataState createState() => _Member_add_DataState();
}

class _Member_add_DataState extends State<Member_Product_Buy_Page> {


  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController account = TextEditingController();
  TextEditingController bank = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController product_name = TextEditingController();

  String timeStamp24HR =DateTime.now().toString();


  var Custom_memberId;

  //var payment_code ="001";





  late bool status;

  late String message;



  @override
  void initState() {
    status = false;
    message = "";

    price = TextEditingController(text: widget.price+"/-");
    product_name = TextEditingController(text: widget.producr_name);


    Custom_memberId = email_get;



    super.initState();
  }

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green.shade50,

      appBar: AppBar(
        title: Text('Buy Product'),
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(
            //   height : 240,
            //
            //   child:  Image.asset('assets/images/c8.avif'),),
            Container(
              // margin: EdgeInsets.all(30),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                // border:Border.all(width:2,color: Colors.green.shade600),
                // borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              // height: MediaQuery.of(context).size.height,
              // width: double.infinity,
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    TextFormField(
                      controller: name,
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your Name";
                        }
                        return null;
                      },
                      onSaved: (name) {},
                      obscureText: false,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.grey.shade900),
                        ),
                        label: Text("Name"),
                        labelStyle: TextStyle(color: Colors.black),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            // color: Colors.grey[400],
                            color: Colors.grey.shade500,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.grey.shade500,
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: phone,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.length == 9) {
                          return "Please enter  phone number";
                        }
                        return null;
                      },
                      onSaved: (phone) {},
                      obscureText: false,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.grey.shade900),
                        ),
                        label: Text(" phone number"),
                        labelStyle: TextStyle(color: Colors.black),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            // color: Colors.grey[400],
                            color: Colors.grey.shade500,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.grey.shade500,
                        )),
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      controller: account,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter  your account no";
                        }
                        return null;
                      },
                      onSaved: (phone) {},
                      obscureText: false,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 2, color: Colors.grey.shade900),
                        ),
                        label: Text(" account no"),
                        labelStyle: TextStyle(color: Colors.black),
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            // color: Colors.grey[400],
                            color: Colors.grey.shade500,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade500,
                            )),
                      ),
                    ),
SizedBox(height: 20,),
                    TextFormField(
                      controller: bank,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter  bank name";
                        }
                        return null;
                      },
                      onSaved: (phone) {},
                      obscureText: false,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 2, color: Colors.grey.shade900),
                        ),
                        label: Text("  bank name"),
                        labelStyle: TextStyle(color: Colors.black),
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            // color: Colors.grey[400],
                            color: Colors.grey.shade500,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade500,
                            )),
                      ),
                    ),

                    SizedBox(height: 20,),
                    TextFormField(
                      readOnly: true,
                      controller: price,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter  bank name";
                        }
                        return null;
                      },
                      onSaved: (phone) {},
                      obscureText: false,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 2, color: Colors.grey.shade900),
                        ),
                        //label: Text("  bank name"),
                        labelStyle: TextStyle(color: Colors.black),
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            // color: Colors.grey[400],
                            color: Colors.grey.shade500,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade500,
                            )),
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      controller: product_name,
                      readOnly: true,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter  producr_name";
                        }
                        return null;
                      },
                      onSaved: (phone) {},
                      obscureText: false,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 2, color: Colors.grey.shade900),
                        ),
                        //label: Text("  bank name"),
                        labelStyle: TextStyle(color: Colors.black),
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            // color: Colors.grey[400],
                            color: Colors.grey.shade500,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade500,
                            )),
                      ),
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 17,
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            setState(() {

                              Buy_Function();

                            });
                          }
                        },
                        child: Text(
                          'CONTINUE',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),


                  ],
                ),

                //],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Future<void> Buy_Function() async {
  //
  //
  //   Map<String, dynamic> demodata = {
  //
  //     "name": name.text,
  //     "phone": phone.text,
  //     "account":account.text,
  //     "price":price.text,
  //     "bank":bank.text,
  //   };
  //
  //
  //
  //   CollectionReference collectionreference =
  //       FirebaseFirestore.instance.collection('Buy_Product');
  //   collectionreference.add(demodata).whenComplete(() {
  //     setState(() {
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => memberhome(),
  //         ),
  //       );
  //     });
  //
  //     Fluttertoast.showToast(
  //       msg: "Payment Successfull",
  //       toastLength: Toast.LENGTH_LONG,
  //     );
  //   });
  // }


  Future<void> Buy_Function() async {

    DocumentReference<Map<String, dynamic>> users = FirebaseFirestore.instance
        .collection('Buy_Product')
        .doc(Custom_memberId);
    var myjsonobj = {
          "name": name.text,
          "phone": phone.text,
          "account":account.text,
          "price":price.text,
          "bank":bank.text,
      "product_name":product_name.text,
      'Date': getCurrentDate(),

    };
    // users
    //     .set(myjsonobj)
    //     .then((value) =>
    //     Fluttertoast.showToast(
    //             msg: "Payment Successfull",
    //             toastLength: Toast.LENGTH_LONG,
    //           ))
    //     //print("user with customid added"))
    //     .catchError((error) => print("failed to add user: $error"));

    users.set(myjsonobj).then((value){
      Fluttertoast.showToast(
      msg: "Payment  Successfull",
      toastLength: Toast.LENGTH_LONG,
      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>memberhome()));

    }).catchError((error){
      Fluttertoast.showToast(
                      msg: "Payment Not  Successfull",
                      toastLength: Toast.LENGTH_LONG,
                    );
    });
  }

  String getCurrentDate() {
    var date = DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    return formattedDate.toString();
  }

  String getCurrentTime() {
    var time = DateTime.now().toString();

    var dateParse = DateTime.parse(time);

    var formattetime = "${dateParse.hour}-${dateParse.minute}";
    return formattetime.toString();
  }




}
