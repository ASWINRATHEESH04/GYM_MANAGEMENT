import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_management/Firebase%20Multi%20Login_Gym/member/video_main_page.dart';
import 'package:gym_management/Firebase%20Multi%20Login_Gym/member/workout_video_test/workout_video_entry_page.dart';

import '../../main.dart';
import '../About_Us.dart';
import '../Auth/loginn.dart';
import 'Diet_Plan_videos/Diet_PLans_video_entry_page.dart';
import 'Edit_profile_member.dart';
import 'Member_Buy_Product_Display_page.dart';
import 'Member_Fee_Payment.dart';
import 'Member_Mark_Attendance_Page_Test2.dart';
import 'Member_View_Payment_Details_Page.dart';
import 'Member_physic.dart';
import 'chatpage_Member.dart';
import 'member_slider.dart';

class memberhome extends StatefulWidget {
  const memberhome({Key? key}) : super(key: key);

  @override
  State<memberhome> createState() => _memberhomeState();
}

class _memberhomeState extends State<memberhome> {
  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 1),
    () => 'Data Loaded',
  );

  @override
  void initState() {
    setState(() {
      member_name = '';
      member_Image = '';
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
                  "${member_name}",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 18,
                    backgroundImage: NetworkImage(member_Image)),
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
                color: Colors.green,
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
                          "${member_name}",
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

                accountEmail: Text("${email_get.toString()}"),
                currentAccountPictureSize: Size.square(40),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(member_Image),
                  radius: 25,
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
                        builder: (context) => Edit_Profile_Member(
                              name: member_name,
                              image: member_Image,
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => About_Us()));
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 00,
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
                          builder: (context) =>
                              Member_Mark_Attendance_Test2()));
                },
                child: Text("Mark Attndance")),
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
                          builder: (context) => Member_add_physical_details()));
                },
                child: Text("Add Physical Details")),
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
                          builder: (context) => video_Entry_page()));
                },
                child: Text("Workout Videos")),
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
                          builder: (context) => Diet_Plans_video_Entry_page()));
                },
                child: Text("Diet Plans Videos")),
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
                          builder: (context) =>
                              Member_Buy_Product_Display_Page()));
                },
                child: Text("Product Buying")),
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
                          builder: (context) => Member_Fee_Payment()));
                },
                child: Text("Fee Payment")),
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
                          builder: (context) =>
                              chatpage_Member(email: email_get)));
                },
                child: Text("Chat")),
          ]),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  Future getDoc_name() async {
    var a = await FirebaseFirestore.instance
        .collection('Member_Add_Data')
        .doc(email_get)
        .get();
    if (a.exists) {
      member_name = a.get('name');
      member_Image = a.get('image');
      return a;
    }
    if (!a.exists) {
      print('Not exists');
      return null;
    }
  }
}
