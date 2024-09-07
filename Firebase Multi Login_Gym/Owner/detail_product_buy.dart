import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';




class Product_bill extends StatefulWidget {
  @override
  State<Product_bill> createState() => Product_billState();
}

class Product_billState extends State<Product_bill> {

  CollectionReference users = FirebaseFirestore.instance.collection(
      'Buy_Product');

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
          "Sold product ",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: StreamBuilder(

        stream: FirebaseFirestore.instance.collection('Buy_Product')
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


                  ListTile(
                    // leading: CircleAvatar(
                    //   radius: 50,
                    //   backgroundImage:
                    //   NetworkImage(document['image']),
                    // ),


                    title: Column(
                      children: [
                        Row(
                          children: [
                            Text("Product Name:"),
                            Text(document['product_name'],style: TextStyle(
                      color: Colors.teal),),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Name:"),
                            Text(document['name'],style: TextStyle(
              color: Colors.teal),),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Date:"),
                            Text(document['Date'],style: TextStyle(
              color: Colors.teal),),
                          ],
                        ),

                        Row(
                          children: [
                            Text("Phone:"),
                            Text(document['phone'],style: TextStyle(
              color: Colors.teal),),
                          ],
                        ),
                      ],
                    ),
                    trailing: Text(document['price'], style: TextStyle(
                        color: Colors.red,fontSize: 25),),
                  ),
                  // custom_listtile(
                  //   document['bp'],
                  //   document['image'],
                  //   document['name'],
                  //  document['hieght'],
                  //  document['weight'],
                  //   //document['image'],
                  //
                  //
                  // ),

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
    FirebaseFirestore.instance.collection("Buy_Product");
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
            leading: Container(
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
            title: Text(name

            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    email
                ),
                Text(
                    address
                ),
              ],
            ),
            trailing:Text(
                phone

            ),
          ),
        )

    );
  }


}




