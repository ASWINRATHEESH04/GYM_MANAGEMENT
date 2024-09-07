import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_management/Firebase%20Multi%20Login_Gym/member/workout_video_test/shoulder_video_detil_page.dart';

import 'Chest_video_detail_page.dart';




class Shoulder_videos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            "Shoulder Workout",
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
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          Shoulder_Video_Detail_Page(
                            thumbnail: 'assets/workout/shoulder.jpg',
                            videoUrl: 'https://www.youtube.com/watch?v=-Jx0rsq4IIw',
                            videoTitle: 'shoulder',)));
                },
                child: Video_Container_widget(
                    "shoulder", "assets/workout/shoulder.jpg"),),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          Shoulder_Video_Detail_Page(
                            thumbnail: 'assets/workout/shoulder.jpg',
                            videoUrl: 'https://www.youtube.com/watch?v=QQ5kX8BBmw4',
                            videoTitle: 'shoulder',)));
                },
                child: Video_Container_widget(
                    "shoulder", "assets/workout/shoulder.jpg"),),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          Shoulder_Video_Detail_Page(
                            thumbnail: 'assets/workout/shoulder.jpg',
                            videoUrl: 'https://www.youtube.com/watch?v=mCmojndsXeg',
                            videoTitle: 'shoulder',)));
                },
                child: Video_Container_widget(
                    "shoulder", "assets/workout/shoulder.jpg"),),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          Shoulder_Video_Detail_Page(
                            thumbnail: 'assets/workout/shoulder.jpg',
                            videoUrl: 'https://www.youtube.com/watch?v=YlISf4U52t0',
                            videoTitle: 'shoulder',)));
                },
                child: Video_Container_widget(
                    "shoulder", "assets/workout/shoulder.jpg"),),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          Shoulder_Video_Detail_Page(
                            thumbnail: 'assets/workout/shoulder.jpg',
                            videoUrl: 'https://www.youtube.com/watch?v=ZIECTD0ju9k',
                            videoTitle: 'shoulder',)));
                },
                child: Video_Container_widget(
                    "shoulder", "assets/workout/shoulder.jpg"),),


            ],
          ),
        )


    );
  }


  Video_Container_widget(var description, var url) {
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
