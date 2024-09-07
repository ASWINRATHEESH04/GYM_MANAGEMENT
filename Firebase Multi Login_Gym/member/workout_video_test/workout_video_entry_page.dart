

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_management/Firebase%20Multi%20Login_Gym/member/workout_video_test/back_videos.dart';
import 'package:gym_management/Firebase%20Multi%20Login_Gym/member/workout_video_test/chest_videos.dart';
import 'package:gym_management/Firebase%20Multi%20Login_Gym/member/workout_video_test/shoulder_videos.dart';


import 'Arms_videos.dart';
import 'leg_videos.dart';


class video_Entry_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Workout Videos",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: Color(0xFF282828),
      ),
    body:
    SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>Leg_videos()));
            },
            child:  Video_Container_widget("Leg","assets/workout/leg.jpg") ,
          ),
          SizedBox(height: 30,),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Chest_videos()));
            },
            child:  Video_Container_widget("chest","assets/workout/chest.jpg") ,
          ),
          SizedBox(height: 30,),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Shoulder_videos()));
            },
            child:  Video_Container_widget("shoulder","assets/workout/shoulder.jpg") ,
          ),
          SizedBox(height: 30,),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Back_videos()));
            },
            child:  Video_Container_widget("back","assets/workout/back.jpg") ,
          ),
          SizedBox(height: 30,),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Arms_videos()));
            },
            child:  Video_Container_widget("arms","assets/workout/arms.jpg") ,
          ),


          //Video_Container_widget("Shoulder","assets/workout/shoulder.jpg"),
          //Video_Container_widget("Back","assets/workout/back.jpg"),
          //Video_Container_widget("Arms","assets/workout/arms.jpg"),

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
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(url),
                  fit: BoxFit.cover,
                ),
              ),
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 100,
              ),
            ),
          ),
          SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Video Description: ",style:TextStyle(fontSize: 15,color: Colors.black),),
              Text(description,
                style: TextStyle(
                    fontSize: 15, color: Colors.red.shade200),
              ),
            ],
          ),
        ],
      ),
    );

  }
}