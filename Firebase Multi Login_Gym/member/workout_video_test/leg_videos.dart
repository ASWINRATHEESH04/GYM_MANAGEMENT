

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Leg_video_detail_Page.dart';


class Leg_videos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            "Leg Workout",
            style: TextStyle(color: Colors.white),
          ),
          elevation: 0,
          backgroundColor: Color(0xFF282828),
        ),
        body:
        SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Leg_Video_Detail_Page(thumbnail: 'assets/workout/leg.jpg', videoUrl: 'https://www.youtube.com/watch?v=GHhGCo4Moy0', videoTitle: 'Leg',)));
              },
              child:  Video_Container_widget("Leg","assets/workout/leg.jpg") ,),
              GestureDetector(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Leg_Video_Detail_Page(thumbnail: 'assets/workout/leg.jpg', videoUrl: 'https://www.youtube.com/watch?v=W_JqEj3nga4', videoTitle: 'Leg',)));
              },
                child:  Video_Container_widget("Leg","assets/workout/leg.jpg") ,),
              GestureDetector(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Leg_Video_Detail_Page(thumbnail: 'assets/workout/leg.jpg', videoUrl: 'https://www.youtube.com/watch?v=FpJMjqJh08o', videoTitle: 'Leg',)));
              },
                child:  Video_Container_widget("Leg","assets/workout/leg.jpg") ,),
              GestureDetector(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Leg_Video_Detail_Page(thumbnail: 'assets/workout/leg.jpg', videoUrl: 'https://www.youtube.com/watch?v=GHhGCo4Moy0', videoTitle: 'Leg',)));
              },
                child:  Video_Container_widget("Leg","assets/workout/leg.jpg") ,),
              GestureDetector(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Leg_Video_Detail_Page(thumbnail: 'assets/workout/leg.jpg', videoUrl: 'https://www.youtube.com/watch?v=GHhGCo4Moy0', videoTitle: 'Leg',)));
              },
                child:  Video_Container_widget("Leg","assets/workout/leg.jpg") ,),







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


        ],
      ),
    );

  }
}