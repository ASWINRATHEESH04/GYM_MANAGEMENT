

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Weight_loss_video_detail_Page.dart';



class Weight_loss_videos extends StatelessWidget {
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Weight_Loss_Video_Detail_Page(thumbnail: 'assets/workout/leg.jpg', videoUrl: 'https://www.youtube.com/watch?v=ahnl7GaV_rU', videoTitle: 'Weight Loss',)));
              },
              child:  Video_Container_widget("Leg","assets/Diet_plan/weight_loss.jpg") ,),
              GestureDetector(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Weight_Loss_Video_Detail_Page(thumbnail: 'assets/workout/leg.jpg', videoUrl: 'https://www.youtube.com/watch?v=q42n27oCOUM', videoTitle: 'Weight Loss',)));
              },
                child:  Video_Container_widget("Leg","assets/Diet_plan/weight_loss.jpg") ,),
              GestureDetector(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Weight_Loss_Video_Detail_Page(thumbnail: 'assets/workout/leg.jpg', videoUrl: 'https://www.youtube.com/watch?v=KqN4Lh8305c', videoTitle: 'Weight Loss',)));
              },
                child:  Video_Container_widget("Leg","assets/Diet_plan/weight_loss.jpg") ,),
              GestureDetector(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Weight_Loss_Video_Detail_Page(thumbnail: 'assets/workout/leg.jpg', videoUrl: 'https://www.youtube.com/watch?v=5Pqrq4iOjOM', videoTitle: 'Weight Loss',)));
              },
                child:  Video_Container_widget("Leg","assets/Diet_plan/weight_loss.jpg") ,),
              GestureDetector(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Weight_Loss_Video_Detail_Page(thumbnail: 'assets/workout/leg.jpg', videoUrl: 'https://www.youtube.com/watch?v=lyg6XfP5r0M', videoTitle: 'Weight Loss',)));
              },
                child:  Video_Container_widget("Leg","assets/Diet_plan/weight_loss.jpg") ,),







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
                color: Colors.blueGrey.shade300,
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