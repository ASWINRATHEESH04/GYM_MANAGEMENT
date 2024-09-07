import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:intl/intl.dart';

import '../../main.dart';
import 'Member_Product_Buy_Page.dart';

class Member_Product_Payment_details_Page extends StatefulWidget {
  @override
  State<Member_Product_Payment_details_Page> createState() =>
      _Member_Product_Payment_details_PageState();
}

class _Member_Product_Payment_details_PageState
    extends State<Member_Product_Payment_details_Page> {
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      getDoc_name();
      member_pro_name;
      member_pro_Name;
      member_pro_date;
      member_pro_account;
      member_pro_bank;
      member_pro_phone;
      member_pro_price;
      print(member_pro_name);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: Colors.grey.shade600,
        title: Text(
          "Payment Details",
          style: TextStyle(fontSize: 25),
        ),
      ),
      // body: StreamBuilder(
      //   stream:
      //       FirebaseFirestore.instance.collection('Buy_Product').snapshots(),
      //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //     if (!snapshot.hasData) {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //
      //     return ListView(
      //       children: snapshot.data!.docs.map((document) {
      //         return Column(
      //           children: [
      //             custom_listtile(
      //                 member_pro_name,
      //                 member_pro_Name,
      //                 member_pro_date,
      //                 member_pro_account,
      //                 member_pro_bank,
      //                 member_pro_phone,
      //                 member_pro_price),
      //           ],
      //         );
      //       }).toList(),
      //     );
      //   },
      // ),
    );
  }


  custom_listtile(String name, var pro_name, var price, var bank, var phone,
      var account_no, var Date) {
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
            leading: Text(pro_name),
            title: Text(name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(price),
                Text(bank),
                Text(Date),
                Text(account_no),
              ],
            ),
            trailing: Text(phone),
          ),
        ));
  }

  Future getDoc_name() async {
    var a = await FirebaseFirestore.instance
        .collection('Buy_Product')
        .doc(email_get)
        .get();
    if (a.exists) {
      member_pro_name = a.get('name');
      member_pro_Name = a.get('product_name');
      member_pro_date = a.get('Date');
      member_pro_account = a.get('account');
      member_pro_bank = a.get('bank');
      member_pro_phone = a.get('phone');
      member_pro_price = a.get('price');

      return a;
    }
    if (!a.exists) {
      print('Not exists');
      print("no data");

      Fluttertoast.showToast(
        msg: "This account has no payment yet!",
        toastLength: Toast.LENGTH_LONG,
      );

      return null;
    }
  }
}
