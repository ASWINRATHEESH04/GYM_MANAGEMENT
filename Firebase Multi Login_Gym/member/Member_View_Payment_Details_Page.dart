
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Member_Product_Payment_Details_Page.dart';




class Member_Payment_Details_Page extends StatefulWidget {
  const Member_Payment_Details_Page({Key? key}) : super(key: key);

  @override
  _Member_Payment_Details_PageState createState() => _Member_Payment_Details_PageState();
}

class _Member_Payment_Details_PageState extends State<Member_Payment_Details_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      appBar: AppBar(
        toolbarHeight: 90,

        elevation: 0,backgroundColor: Colors.transparent,
      title: Text("Payment Details",style: GoogleFonts.cookie(


          color: Colors.grey.shade600,fontSize: 40),),),
      body: SingleChildScrollView(
        child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
                onTap: () {
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Member_Product_Payment_details_Page()));

                  });

//Member_Product_Payment_details_Page
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                  child: Card(
                    // semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/payment/product_Payment.jpg',
                          height: 220,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.contain,
                        ),
                        Positioned(
                            top: 15,
                            left: 30,
                            child: Text(
                              "Product Payment Details",
                              style: GoogleFonts.courgette(
                                  fontSize: 20, color: Colors.blueGrey.shade900),
                            )),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    shadowColor: Colors.purple.shade900,
                    elevation: 9,
                    margin: EdgeInsets.all(10),
                  ),
                )),
            InkWell(
                onTap: () {

                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Card(
                    // semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/payment/fee_payment.jpg',
                          height: 220,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.contain,
                        ),
                        Positioned(
                            top: 15,
                            left: 30,
                            child: Text(
                              "Fee Payment Details",
                              style: GoogleFonts.courgette(
                                  fontSize: 20, color: Colors.deepOrange.shade500),
                            )),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    shadowColor: Colors.purple.shade900,
                    elevation: 9,
                    margin: EdgeInsets.all(10),
                  ),
                )),



          ],
        ),
      ),
    );
  }
}
