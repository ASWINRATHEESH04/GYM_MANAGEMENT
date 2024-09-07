import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';

import 'View_Member_Attendance_history.dart';
import 'View_Trainer_Attendance_history.dart';

class View_Trainer_Attendance extends StatefulWidget {
  @override
  State<View_Trainer_Attendance> createState() => _View_Trainer_AttendanceState();
}

class _View_Trainer_AttendanceState extends State<View_Trainer_Attendance> {
  CollectionReference users =
      FirebaseFirestore.instance.collection('Mark_Trainer_attendance');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: Colors.grey.shade400,
        title: Text(
          "Trainer Attendance List",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          Flexible(
            child: StreamBuilder(
              stream: users.snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                var doc = users.doc('id').get();

                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Today",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ":",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          getCurrentDate(),
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    Flexible(
                      child: ListView(
                        children: snapshot.data!.docs.map((document) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              document['Date'] == getCurrentDate()
                                  ?
                                  // Padding(
                                  //   padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                                  //   child: Row(
                                  //     mainAxisAlignment: MainAxisAlignment.start,
                                  //     children: [
                                  //
                                  //      // Icon(Icons.check,color: Colors.green,),
                                  //       Image.asset("assets/check.png",height: 40,),
                                  //
                                  //       SizedBox(width: 10,),
                                  //       CircleAvatar(
                                  //         backgroundImage:NetworkImage(document['image']),
                                  //
                                  //       ),
                                  //
                                  //       SizedBox(width: 30,),
                                  //       Text(document['Name']),
                                  //
                                  //
                                  //     ],
                                  //   ),
                                  // )
                                  ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(document['image']),
                                      ),
                                    subtitle: Text("Present",style: TextStyle(fontSize: 13,color: Colors.teal,),),
                                    title:  Text(document['Name'],style: TextStyle(fontSize: 25),),
                                    trailing: Image.asset("assets/check.png",height: 40,) ,
                                    )
                                   : SizedBox(),
                                  // :  Text("No member attended today"),
                              Divider(),

                            ],
                          );
                        }).toList(),
                      ),
                    ),

                    // Flexible(
                    //   child: ListView(
                    //     children: snapshot.data!.docs.map((document) {
                    //       return Column(
                    //         children: [
                    //
                    //
                    //           Row(
                    //             children: [
                    //               Text("Date:"),
                    //               Text(document['Date']),
                    //             ],
                    //           ),
                    //
                    //           Row(
                    //             children: [
                    //               Text("Member Email:"),
                    //               Text(document['email']),
                    //             ],
                    //           ),
                    //           Divider(thickness: 2,),
                    //         ],
                    //       );
                    //     }).toList(),
                    //   ),
                    // ),
                  ],
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=>View_Trainer_Attendance_history()));
                },
                child: Container(
                  height: 50,
                  width: 400,
                  color: Colors.orange.shade100,
                  child:Center(
                    child: Text("Attendance History",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
                  ),
                ),
              ),
            )
          )
        ],
      ),
    );
  }

  Future getDoc() async {
    var orderref =
        FirebaseFirestore.instance.collection("Mark_Trainer_attendance");
    var docsanpshots = await orderref.get();
    docsanpshots.docs.forEach((doc) {
      if (doc.get('Date') == '${getCurrentDate()}') {
        print("current date");
      } else {}
    });
  }

  String getCurrentDate() {
    var date = DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    return formattedDate.toString();
  }
}
