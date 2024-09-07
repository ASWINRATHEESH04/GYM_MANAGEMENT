import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'Owner_Home_Page.dart';

class Owner_add_Product extends StatefulWidget {
  const Owner_add_Product({Key? key}) : super(key: key);

  @override
  _Member_add_DataState createState() => _Member_add_DataState();
}

class _Member_add_DataState extends State<Owner_add_Product> {
  var _image;
  final picker = ImagePicker();

  TextEditingController Product_name = TextEditingController();
  TextEditingController Product_Price = TextEditingController();

  late bool status;

  late String message;

  File? get filePath => null;

  get ref => null;

  @override
  void initState() {
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
        title: Text('Add Product'),
        backgroundColor: Colors.blue,
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
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: Product_name,
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter product Name";
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
                        label: Text("Product Name"),
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
                      controller: Product_Price,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter  product prrice";
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
                        label: Text(" Product prrice"),
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
                                ? Image.file(
                                    _image,
                                    fit: BoxFit.cover,
                                  )
                                : Center(
                                    child: Text(
                                    "No image selected",
                                    style: GoogleFonts.hindVadodara(
                                        fontSize: 13,
                                        color: Colors.red.shade900),
                                  )),
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
                            setState(() {
                              uploadimage();
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

  Future<void> uploadimage() async {
    // print(_image);

    String fileName = _image.path.split('/').last;

    var snapshot = await FirebaseStorage.instance
        .ref()
        .child('My_images/$fileName')
        .putFile(_image);

    var url = await snapshot.ref.getDownloadURL();

    var image_url = url.toString();

    Map<String, dynamic> demodata = {
      "image": image_url,
      "name": Product_name.text,
      "price": Product_Price.text,
    };

    //member_Image =image_url;

    CollectionReference collectionreference =
        FirebaseFirestore.instance.collection('Product Data');
    collectionreference.add(demodata).whenComplete(() {
      setState(() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Owner(),
          ),
        );
      });

      Fluttertoast.showToast(
        msg: "Inserted successfully",
      );
    });
  }
}
