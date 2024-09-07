import 'dart:convert';
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
import 'trainer_home_page.dart';



class Edit_Profile_Trainer extends StatefulWidget {

  final  name,image,id,phone,address,gender,age;
  const Edit_Profile_Trainer({Key? key,
    required this.name, required this.image,
    required this.id,required this.phone, required this.address,
    required this.gender,required this.age}) : super(key: key);


  @override
  _Edit_Profile_TrainerState createState() => _Edit_Profile_TrainerState();
}

class _Edit_Profile_TrainerState extends State<Edit_Profile_Trainer> {

  TextEditingController _name=TextEditingController();
  TextEditingController _phone=TextEditingController();
  TextEditingController _address=TextEditingController();
  TextEditingController age = TextEditingController();
  String dropdownValue = 'Male';

  var _image;
  var docId;
  var img;
  var img_url;
  final picker = ImagePicker();



  late bool status;

  late String message;

  File? get filePath => null;


  @override
  void initState() {

    _name=TextEditingController(text: widget.name);
    _phone=TextEditingController(text: widget.phone);
    _address=TextEditingController(text: widget.address);
    age=TextEditingController(text: widget.age);
    docId=email_get;
    img=widget.image;
    dropdownValue=widget.gender;



    status = false;
    message = "";

    super.initState();
  }

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Future choose_image_gallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this._image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future choose_image_camera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this._image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green.shade50,

      appBar: AppBar(
        title: Text('Edit Form'),
        backgroundColor: Colors.green.shade800,
      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       // SizedBox(
      //       //   height : 240,
      //       //
      //       //   child:  Image.asset('assets/images/c8.avif'),),
      //       Container(
      //         // margin: EdgeInsets.all(30),
      //         padding: EdgeInsets.symmetric(horizontal: 20),
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           // border:Border.all(width:2,color: Colors.green.shade600),
      //           // borderRadius: BorderRadius.all(Radius.circular(20))
      //         ),
      //         // height: MediaQuery.of(context).size.height,
      //         // width: double.infinity,
      //         child: Form(
      //           key: formkey,
      //           child: Column(
      //
      //             children: [
      //               SizedBox(height: 40,),
      //               TextFormField(
      //                 controller: _name,
      //                 keyboardType: TextInputType.text,
      //                 validator: (value) {
      //                   if (value!.isEmpty) {
      //                     return "Please enter a Name";
      //                   }
      //                   return null;
      //                 },
      //                 onSaved: (name) {},
      //                 obscureText: false,
      //                 decoration: InputDecoration(
      //                   focusedBorder: OutlineInputBorder(
      //                     borderSide: BorderSide(width: 2, color: Colors.green.shade300),
      //                   ),
      //                   label: Text("Name"),
      //                   labelStyle: TextStyle(color: Colors.green.shade900),
      //                   contentPadding:
      //                   EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      //                   enabledBorder: OutlineInputBorder(
      //                     borderSide: BorderSide(
      //                       // color: Colors.grey[400],
      //                       color: Colors.grey.shade500,
      //                     ),
      //                   ),
      //                   border: OutlineInputBorder(
      //                       borderSide: BorderSide(
      //                         color: Colors.grey.shade500,
      //                       )),
      //                 ),
      //               ),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Text(
      //                     "Choose Image",
      //                     style: GoogleFonts.hindVadodara(
      //                       fontSize: 20,
      //                       color: Colors.green.shade900,
      //                     ),
      //                   ),
      //                   IconButton(
      //                     icon: Icon(
      //                       Icons.photo_outlined,
      //                       size: 35,
      //                       color: Colors.green.shade600,
      //                     ),
      //                     onPressed: () {
      //                       choose_image_gallery();
      //                     },
      //                   ),
      //                   IconButton(
      //                     icon: Icon(
      //                       Icons.camera_alt_outlined,
      //                       size: 35,
      //                       color: Colors.green.shade600,
      //                     ),
      //                     onPressed: () {
      //                       choose_image_camera();
      //                     },
      //                   ),
      //                 ],
      //               ),
      //               Center(
      //                 child: Container(
      //                     height: 100,
      //                     width: 200,
      //                     //decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),  color: Colors.grey,
      //                     //),
      //
      //                     child: ClipRRect(
      //                         borderRadius: BorderRadius.circular(15),
      //                         child: _image != null
      //                             ?
      //                         Image.file(
      //                           _image,
      //                           fit: BoxFit.cover,
      //                         )
      //                             :
      //                         Image.network(
      //                           widget.image,
      //                           fit: BoxFit.cover,
      //                         )
      //                     )),
      //               ),
      //               SizedBox(height: 20,),
      //               SizedBox(
      //                 height: MediaQuery.of(context).size.height / 17,
      //                 width: MediaQuery.of(context).size.width / 1.1,
      //                 child: ElevatedButton(
      //                   style: ElevatedButton.styleFrom(
      //                     backgroundColor: Colors.green.shade800,
      //                     shape: RoundedRectangleBorder(
      //                         borderRadius: BorderRadius.circular(10)
      //                     ),
      //                   ),
      //                   onPressed: () {
      //                     if (formkey.currentState!.validate()) {
      //                       setState(()  {
      //
      //                         update_img();
      //
      //                         // uploadImage();
      //                         // String fileName = _image.path.split('/').last;
      //                         // var snapshot = await FirebaseStorage.instance.ref()
      //                         //     .child('images/$fileName')
      //                         //     .putFile(_image)
      //                         // .whenComplete(() {
      //                         //
      //                         //   Fluttertoast.showToast(
      //                         //     msg: "Image Uploaded successfully",
      //                         //     // // toastLength: Toast.LENGTH_SHORT,
      //                         //     // backgroundColor: Colors.teal,
      //                         //     // textColor: Colors.white
      //                         //   );
      //                         // })
      //                         //     .catchError((e) {
      //                         //
      //                         // });
      //
      //                       });
      //                     }
      //                   },
      //                   child: Text(
      //                     'UPDATE',
      //                     style: TextStyle(color: Colors.white, fontSize: 25),
      //                   ),
      //                 ),
      //
      //               ),
      //               SizedBox(height: 20,),
      //
      //               // Text(widget.id),
      //
      //               ElevatedButton(
      //                   style: ElevatedButton.styleFrom(
      //                     backgroundColor: Colors.indigo.shade500,
      //                     shape: RoundedRectangleBorder(
      //                         borderRadius: BorderRadius.circular(10)
      //                     ),
      //                   ),onPressed: (){
      //                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>view_image()));
      //
      //               }, child: Text("View Images")),
      //               SizedBox(height:80,)
      //               // Text(
      //               //   status ? message : message,
      //               //   style: GoogleFonts.lato(
      //               //       fontSize: 12,
      //               //       color: Colors.red.shade900,
      //               //       fontWeight: FontWeight.bold),
      //               // ),
      //
      //             ],
      //           ),
      //
      //           //],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),

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
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _name,
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter a Name";
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
                      height: 30,
                    ),
                    TextFormField(
                      controller: _phone,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter  Phone Number";
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
                        label: Text("phone"),
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
                      height: 30,
                    ),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 2, color: Colors.grey.shade900),
                        ),
                        enabledBorder: OutlineInputBorder(
                          //<-- SEE HERE
                          // borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        // focusedBorder: OutlineInputBorder(
                        //   //<-- SEE HERE
                        //   borderSide: BorderSide(color: Colors.black, width: 2),
                        // ),
                        filled: true,
                        //fillColor: Colors.greenAccent,
                      ),
                      dropdownColor: Colors.white,
                      value: dropdownValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>['Male', 'Female']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 20),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: age,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter a Age";
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
                        label: Text("Age"),
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
                      height: 30,
                    ),
                    TextFormField(
                      controller: _address,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter  Address";
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
                        label: Text("Address"),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Choose Image",
                          style: GoogleFonts.hindVadodara(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.photo_outlined,
                            size: 35,
                            color: Colors.black87,
                          ),
                          onPressed: () {
                            choose_image_gallery();
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            size: 35,
                            color: Colors.black87,
                          ),
                          onPressed: () {
                            choose_image_camera();
                          },
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                          height: 100,
                          width: 200,
                          //decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),  color: Colors.grey,
                          //),

                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: _image != null
                                  ?
                              Image.file(
                                _image,
                                fit: BoxFit.cover,
                              )
                                  :
                              Image.network(
                                widget.image,
                                fit: BoxFit.cover,
                              )
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                            setState(()  {
                              update_img();
                              //print("member name is ${member_name}");

                              // Navigator.pushReplacement(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => memberhome(),
                              //   ),
                              // );
                            });
                          }
                        },
                        child: Text(
                          'CONTINUE',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
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

  Future<void> update_img()  async {
    if (_image != null) {

      String fileName = _image.path.split('/').last;

      var snapshot = await FirebaseStorage.instance.ref().child('My_images/$fileName').putFile(_image);

      var url = await snapshot.ref.getDownloadURL();

      img_url = url.toString();
    }
    else {
      img_url =img;
    }
    Map<String, dynamic> demodata = {
      "image": img_url,
      "name": _name.text,
      "address": _address.text,
      "phone": _phone.text,
      "age": age.text,
      "gender":  dropdownValue,
    };
    CollectionReference collectionreference =
    FirebaseFirestore.instance.collection('Trainer_add_data');
    collectionreference.doc(docId).update(demodata)
        .whenComplete(() async {

      Fluttertoast.showToast(
        msg: "Updated successfully",
        // // toastLength: Toast.LENGTH_SHORT,
        // backgroundColor: Colors.teal,
        // textColor: Colors.white
      );


      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>trainerrhome()));
    })
        .catchError((e) {

    });
  }




}

