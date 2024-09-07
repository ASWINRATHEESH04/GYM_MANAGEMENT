import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:full_screen_image/full_screen_image.dart';




class View_Member_physics extends StatefulWidget {
  @override
  State<View_Member_physics> createState() => _View_Member_physicsState();
}

class _View_Member_physicsState extends State<View_Member_physics> {

  CollectionReference users = FirebaseFirestore.instance.collection(
      'Member_Add_Data');

  var current;

  var notcurrent;

  @override
  void initState() {
    // TODO: implement initState
    current = false;
    notcurrent = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: Colors.blue.shade300,
        title: Text(
          "Member Details",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: StreamBuilder(

        stream: FirebaseFirestore.instance.collection('Member_Physical_data')
            .snapshots(),

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


              //     ListTile(
              //       leading: CircleAvatar(
              //         radius: 50,
              //         backgroundImage:
              //         NetworkImage(document['image']),
              //       ),
              //
              //
              //       title: Column(
              //         children: [
              //           Row(
              //             children: [
              //               Text("Name:"),
              //               Text(document['name'],style: TextStyle(
              //                   color: Colors.teal),),
              //             ],
              //           ),
              //           Row(
              //             children: [
              //               Text("Height:"),
              //               Text(document['hieght'],style: TextStyle(
              // color: Colors.teal),),
              //             ],
              //           ),
              //           Row(
              //             children: [
              //               Text("Weight:"),
              //               Text(document['weight'],style: TextStyle(
              // color: Colors.teal),),
              //             ],
              //           ),
              //           Row(
              //             children: [
              //               Text("Bp:"),
              //               Text(document['bp'],style: TextStyle(
              // color: Colors.teal),),
              //             ],
              //           ),
              //         ],
              //       ),
              //       // trailing: Text(document['bp'], style: TextStyle(
              //       //     color: Colors.teal),),
              //     ),
                  custom_listtile(
                    document['name'],
                    document['image'],
                    document['bp'],
                   document['hieght'],
                   document['weight'],
                    //document['image'],


                  ),

                //  Divider(thickness: 2,),
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
    FirebaseFirestore.instance.collection("Member_Physical_data");
    var docsanpshots = await orderref.get();
    docsanpshots.docs.forEach((doc) {
      if (doc.get('Date') == '${getCurrentDate()}') {
        print("current date");
        current = true;
      } else {
        notcurrent = true;
      }
    });
  }

  String getCurrentDate() {
    var date = DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    return formattedDate.toString();
  }


  custom_listtile(String name,var image,var email,var address,var phone) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF7090B0).withOpacity(0.2),
              blurRadius: 20.0,
              offset: const Offset(0, 10.0),
            )
          ],
        ),
        child: Card(
          color: Colors.white,
          child: ListTile(
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.5),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
            leading: FullScreenWidget(
              disposeLevel: DisposeLevel.High,
              child: Container(
                width: 70.0,
                height: 70.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(image),
                  ),
                ),
              ),
            ),
            title: Row(
              children: [
                Text("Name:",style: TextStyle(
                color: Colors.teal),),


                Text(name

                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                        "BP:",style: TextStyle(
                color: Colors.teal),),

                    Text(
                        email
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                        "Height:",style: TextStyle(
                    color: Colors.teal),),

                    Text(
                        address
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                        "Weight:",style: TextStyle(
                    color: Colors.teal),),

                    Text(
                        phone
                    ),
                  ],
                ),
              ],
            ),

          ),
        )

    );
  }


}




