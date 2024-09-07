import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'Auth/loginn.dart';

class animation_test extends StatefulWidget {
  const animation_test({Key? key}) : super(key: key);

  @override
  _animation_testState createState() => _animation_testState();
}

class _animation_testState extends State<animation_test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          SizedBox(height: 190,),
          Container(
            // margin: EdgeInsets.symmetric(horizontal: 20),
            padding:EdgeInsets.only(right: 50) ,
            height: 300,
            width: 500,
           // color: Colors.red,
            child: Center(
              child: Lottie.asset('animations/Animation - 1701935024706 (1).json',
                  fit: BoxFit.cover),
            ),
          ),

          SizedBox(
            width: 300,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Colors.red.shade900),
                    padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                    textStyle:
                    MaterialStateProperty.all(TextStyle(fontSize: 20))),
                onPressed: () async {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  });
                },
                child: Text("Start",style: TextStyle(color: Colors.white),)),
          )
        ],
      ),
    );
  }
}
