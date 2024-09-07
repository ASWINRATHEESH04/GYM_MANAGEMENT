import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../main.dart';
import '../About_Us.dart';
import '../Owner/View_Member_Attendance.dart';
import '../Owner/View_Member_details.dart';
import 'View_Member_physics.dart';
import '../member/Diet_Plan_videos/Diet_PLans_video_entry_page.dart';
import '../member/member_slider.dart';
import '../member/workout_video_test/workout_video_entry_page.dart';
import 'Edit_Profile_Trainer.dart';
import 'Trainer_Mark_Attendance_Page.dart';
import 'Trainer_chatpage.dart';


class trainerrhome extends StatefulWidget {
  const trainerrhome({Key? key}) : super(key: key);

  @override
  State<trainerrhome> createState() => _trainerrhomeState();
}

class _trainerrhomeState extends State<trainerrhome> {
  final Future<String> _calculation = Future<String>.delayed(
    const Duration(milliseconds: 5),
    () => 'Data Loaded',
  );

  // final CollectionReference _reference =
  //     FirebaseFirestore.instance.collection("Trainer_Add_Data");
  // final _auth = FirebaseAuth.instance;
  //
  // String? _email() {
  //   if (_auth.currentUser == null) {
  //     return "no current user";
  //   } else {
  //     return _auth.currentUser!.email;
  //   }
  // }

  @override
  void initState() {
    setState(() {
      email_get;
      _calculation;
      trainer_name;
      trainer_Image;
    });
    getDoc_name();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: FutureBuilder<String>(
          future: _calculation, // a previously-obtained Future<String> or null
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              children = <Widget>[
                Text(
                  "${trainer_name}",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 18,
                    backgroundImage: NetworkImage(trainer_Image)),
              ];
            } else if (snapshot.hasError) {
              children = <Widget>[
                SizedBox(),
              ];
            } else {
              children = const <Widget>[];
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: children,
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green

              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                accountName: FutureBuilder<String>(
                  future: _calculation,
                  // a previously-obtained Future<String> or null
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    List<Widget> children;
                    if (snapshot.hasData) {
                      children = <Widget>[
                        Text(
                          "${trainer_name}",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ];
                    } else if (snapshot.hasError) {
                      children = <Widget>[
                        SizedBox(),
                      ];
                    } else {
                      children = const <Widget>[];
                    }
                    return Row(
                      children: children,
                    );
                  },
                ),

                // Text('${trainer_name}',style: TextStyle(fontSize: 20),),

                // accountName:StreamBuilder(
                //   stream: FirebaseFirestore.instance.collection('Trainer_Add_Data').snapshots(),
                //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                //     if (!snapshot.hasData) {
                //       return CircularProgressIndicator();
                //     }
                //
                //     return Column(
                //       children:
                //       snapshot.data!.docs.map((document) {
                //
                //         return Padding(
                //           padding: const EdgeInsets.only(top: 28),
                //           child: Text('${trainer_name}',style: TextStyle(fontSize: 20),),
                //         );
                //
                //
                //
                //       }).toList(),
                //     );
                //   },
                // ),
                accountEmail: Text("${email_get.toString()}"),
                currentAccountPictureSize: Size.square(40),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(trainer_Image), radius: 25,


                  // currentAccountPicture: StreamBuilder(
                  //   stream: FirebaseFirestore.instance.collection('Trainer_Add_Data').snapshots(),
                  //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  //     if (!snapshot.hasData) {
                  //       return CircularProgressIndicator();
                  //     }
                  //
                  //     return Column(
                  //       children:
                  //       snapshot.data!.docs.map((document) {
                  //
                  //         return CircleAvatar(backgroundImage: NetworkImage(document['image']),radius: 25,
                  //         );
                  //
                  //
                  //
                  //       }).toList(),
                  //     );
                  //   },
                  // ),
                  // currentAccountPicture: CircleAvatar(
                  //   backgroundColor: Color.fromARGB(255, 165, 255, 137),
                  //   child: Text(
                  //     "A",
                  //     style: TextStyle(fontSize: 30.0, color: Colors.blue),
                  //   ), //Text
                  // ), //circleAvatar
                ), //UserAccountDrawerHeader
              ),
            ), //DrawerHeader



            ListTile(
              leading: Icon(Icons.logout),
              title: Text('LogOut'),
              onTap: () {
                logout(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit Profile'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Edit_Profile_Trainer(
                              name: trainer_name,
                              image: trainer_Image,
                              id: email_get,
                              phone: trainer_phone,
                              address: trainer_address,
                              gender: trainer_gender,
                              age: trainer_age,
                            )));
              },
            ),
            ListTile(
              leading: Icon(Icons.menu_book_outlined),
              title: Text('About Us'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => About_Us(
                        )));
              },
            ),

          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            admin_slider_page(),
            SizedBox(
              height: 20,
            ),

            ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    minimumSize: MaterialStateProperty.all(Size(350, 50))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => View_Member_Attendance()));
                },
                child: Text("Member Attandance")),
            SizedBox(
              height: 30,
            ),

            ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    minimumSize: MaterialStateProperty.all(Size(350, 50))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Trainer_Mark_Attendance_Page()));
                },
                child: Text("Mark Attandance")),
            SizedBox(
              height: 30,
            ),
          ElevatedButton(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  minimumSize: MaterialStateProperty.all(Size(350, 50))),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => View_Member_details()));
              },
              child: Text("Member Details")),

          SizedBox(
              height: 30,
          ),
            ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    minimumSize: MaterialStateProperty.all(Size(350, 50))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => View_Member_physics()));
                },
                child: Text("Member physical")),

            SizedBox(
              height: 30,
            ),


            ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    minimumSize: MaterialStateProperty.all(Size(350, 50))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  video_Entry_page()));
                },
                child: Text("Workout Video")),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    minimumSize: MaterialStateProperty.all(Size(350, 50))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  Diet_Plans_video_Entry_page()));
                },
                child: Text("Diet Plans")),
            SizedBox(
              height: 30,
            ),


            ElevatedButton(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  minimumSize: MaterialStateProperty.all(Size(350, 50))),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Trainer_Chatpage(
                          email: email_get,
                        )));
              },
              child: Text("Chat")),
          SizedBox(
            height: 30,
          ),



            //  TextButton(onPressed: (){
            //    Navigator.push(context, MaterialPageRoute(builder: (context)=>view_image()));
            //  }, child: Text("Test  ")),
            //
            //  TextButton(onPressed: (){
            // //   Navigator.push(context, MaterialPageRoute(builder: (context)=>edit_image(name: trainer_name, image: trainer_Image, id: email_get,)));
            //  }, child: Text("Test 1 ")),
            //
            //
            //
            //  TextButton(onPressed: (){
            //    Navigator.push(context, MaterialPageRoute(builder: (context)=>Edit_Profile_Trainer(name: trainer_name, image: trainer_Image,
            //      id: email_get, phone: trainer_phone, address: trainer_address, gender: trainer_gender, age:  trainer_age,)));
            //  }, child: Text("Test 1 ")),
          ]),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => LoginPage(),
    //   ),
    // );
  }

  Future getDoc_name() async {
    var a = await FirebaseFirestore.instance
        .collection('Trainer_add_data')
        .doc(email_get)
        .get();
    if (a.exists) {
      trainer_name = a.get('name');
      trainer_Image = a.get('image');
      trainer_address = a.get('address');
      trainer_age = a.get('age');
      trainer_gender = a.get('gender');
      trainer_phone = a.get('phone');
      trainer_id = email_get;
      //print(member_name);

      return a;
    }
    if (!a.exists) {
      print('Not exists');

      return null;
    }
  }



}
