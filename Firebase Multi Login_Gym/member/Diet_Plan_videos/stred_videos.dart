

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Weight_loss_video_detail_Page.dart';



class stred_videos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            "stred",
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
              },
              child:  Video_Container_widget("Leg","assets/Diet_plan/stred.jpeg") ,),
              GestureDetector(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Weight_Loss_Video_Detail_Page(thumbnail: 'assets/Diet_plan/stred.jpeg', videoUrl: 'https://www.youtube.com/watch?v=VUX-gBgw5I0', videoTitle: 'stred',)));
              },
                child:  Video_Container_widget("Leg","assets/Diet_plan/stred.jpeg") ,),
              GestureDetector(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Weight_Loss_Video_Detail_Page(thumbnail: 'assets/Diet_plan/stred.jpeg', videoUrl: 'https://www.youtube.com/watch?v=ZJluik9NmB4', videoTitle: 'stred ',)));
              },
                child:  Video_Container_widget("Leg","assets/Diet_plan/stred.jpeg") ,),
              GestureDetector(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Weight_Loss_Video_Detail_Page(thumbnail: 'assets/Diet_plan/stred.jpeg', videoUrl: 'https://www.youtube.com/watch?v=m5pAyu-GuKg', videoTitle: ' stred',)));
              },
                child:  Video_Container_widget("Leg","assets/Diet_plan/stred.jpeg") ,),
              GestureDetector(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Weight_Loss_Video_Detail_Page(thumbnail: 'assets/Diet_plan/stred.jpeg', videoUrl: 'https://www.youtube.com/watch?v=o4Y4fAi-Hfo', videoTitle: 'stred',)));
              },
                child:  Video_Container_widget("Leg","assets/Diet_plan/stred.jpeg") ,),







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