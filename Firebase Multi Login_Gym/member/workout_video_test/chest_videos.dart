import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Chest_video_detail_page.dart';




class Chest_videos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            "Chest Workout",
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Chest_Video_Detail_Page(thumbnail: 'assets/workout/chest.jpg', videoUrl: 'https://www.youtube.com/watch?v=4o1YzksPuqg', videoTitle: 'chest',)));
              },
                child:  Video_Container_widget("Leg","assets/workout/chest.jpg") ,),
              GestureDetector(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Chest_Video_Detail_Page(thumbnail: 'assets/workout/chest.jpg', videoUrl: 'https://www.youtube.com/watch?v=XoTXuZQ4SaU', videoTitle: 'chest',)));
              },
                child:  Video_Container_widget("Leg","assets/workout/chest.jpg") ,),
              GestureDetector(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Chest_Video_Detail_Page(thumbnail: 'assets/workout/chest.jpg', videoUrl: 'https://www.youtube.com/watch?v=Epit6DSq_ww', videoTitle: 'chest',)));
              },
                child:  Video_Container_widget("Leg","assets/workout/chest.jpg") ,),
              GestureDetector(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Chest_Video_Detail_Page(thumbnail: 'assets/workout/chest.jpg', videoUrl: 'https://www.youtube.com/watch?v=azYIRKLOGto', videoTitle: 'chest',)));
              },
                child:  Video_Container_widget("Leg","assets/workout/chest.jpg") ,),
              GestureDetector(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Chest_Video_Detail_Page(thumbnail: 'assets/workout/chest.jpg', videoUrl: 'https://www.youtube.com/watch?v=XoxswLMCkgs', videoTitle: 'chest',)));
              },
                child:  Video_Container_widget("Leg","assets/workout/chest.jpg") ,),







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