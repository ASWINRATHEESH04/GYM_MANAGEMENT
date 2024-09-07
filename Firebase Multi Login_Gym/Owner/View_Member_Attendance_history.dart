import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';

class View_Attendance_history extends StatefulWidget {
  @override
  State<View_Attendance_history> createState() => _View_Attendance_historyState();
}

class _View_Attendance_historyState extends State<View_Attendance_history> {

  CollectionReference users = FirebaseFirestore.instance.collection('Mark_Member_attendance');

var current ;
var notcurrent;
@override
  void initState() {
    // TODO: implement initState
  current =false;
  notcurrent =false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: Colors.grey.shade400,
        title: Text(
          "Member Attendance History",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: StreamBuilder(

       stream: FirebaseFirestore.instance.collection('Mark_Member_attendance').orderBy("Date").snapshots(),
      //stream: users.snapshots(),

        //.collection("Mark_Member_attendance")
        // .orderBy("", "asc")

        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

          var doc = users.doc('id').get();


          if (!snapshot.hasData) {

            return Center(
              child: CircularProgressIndicator(),
            );

          }

          return ListView(
            children: snapshot.data!.docs.map((document) {
              return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                      NetworkImage(document['image']),
                    ),
                    title: Text(document['Name']) ,
                    trailing:Text(document['Date'],style: TextStyle(color: Colors.teal),) ,
                  ),
                  Divider(thickness: 2,),
                ],
              );
            }).toList(),

          );






        },

      ),

    );
  }

  Future getDoc() async {
    var orderref =
        FirebaseFirestore.instance.collection("Mark_Member_attendance");
    var docsanpshots = await orderref.get();
    docsanpshots.docs.forEach((doc) {
      if (doc.get('Date') == '${getCurrentDate()}') {
        print("current date");
        current =true;

      } else {
        notcurrent =true;
      }
    });
  }

  String getCurrentDate() {
    var date = DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    return formattedDate.toString();
  }


}
