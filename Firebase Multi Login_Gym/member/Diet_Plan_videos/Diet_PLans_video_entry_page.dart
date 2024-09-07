

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_management/Firebase%20Multi%20Login_Gym/member/Diet_Plan_videos/stred_videos.dart';

import 'Weight_gain_videos.dart';
import 'Weight_loss_videos.dart';



class Diet_Plans_video_Entry_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Diet Plans",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: Color(0xFF282828),
      ),
    body:
    SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 30,),
          GestureDetector(
            onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>Weight_loss_videos()));
            },
            child:  Video_Container_widget("Weight Loss","assets/Diet_plan/weight_loss.jpg") ,
          ),
          SizedBox(height: 30,),
          GestureDetector(
            onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>Weight_gain_videos()));
            },
            child:  Video_Container_widget("Weight Gain","assets/Diet_plan/weight_gain.jpg") ,
          ),

          SizedBox(height: 30,),
          GestureDetector(
            onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>stred_videos()));
            },
            child:  Video_Container_widget("Stred","assets/Diet_plan/stred.jpeg") ,
          ),



        ],
      ),
    )


     );
  }


  Video_Container_widget(var description,var url){
    return Container(
      child: Column(
        children: [
          SizedBox(height: 20,),
          Card(
            margin: EdgeInsets.only(left: 25, right: 25),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            child: Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(url),
                  fit: BoxFit.fitWidth,
                ),
              ),

            ),
          ),
          SizedBox(height: 10,),


          Text(description,
            style: TextStyle(
                fontSize: 15, color: Colors.red.shade200),
          ),
        ],
      ),
    );

  }
}