import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Back_videos_detail_page.dart';






class Back_videos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            "Back Workout",
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
                          Back_Video_Detail_Page(
                            thumbnail: 'assets/workout/back.jpg',
                            videoUrl: 'https://www.youtube.com/watch?v=P9cnQAfhwIM',
                            videoTitle: 'Back',)));
                },
                child: Video_Container_widget(
                    "Back", "assets/workout/back.jpg"),),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          Back_Video_Detail_Page(
                            thumbnail: 'assets/workout/back.jpg',
                            videoUrl: 'https://www.youtube.com/watch?v=Sa0sBKUiOvU',
                            videoTitle: 'Back',)));
                },
                child: Video_Container_widget(
                    "Back", "assets/workout/back.jpg"),),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          Back_Video_Detail_Page(
                            thumbnail: 'assets/workout/back.jpg',
                            videoUrl: 'https://www.youtube.com/watch?v=zgfcOWuTeYA',
                            videoTitle: 'Back',)));
                },
                child: Video_Container_widget(
                    "Back", "assets/workout/back.jpg"),),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          Back_Video_Detail_Page(
                            thumbnail: 'assets/workout/back.jpg',
                            videoUrl: 'https://www.youtube.com/watch?v=8LJ3Q3Fsrzs',
                            videoTitle: 'Back',)));
                },
                child: Video_Container_widget(
                    "Back", "assets/workout/back.jpg"),),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          Back_Video_Detail_Page(
                            thumbnail: 'assets/workout/back.jpg',
                            videoUrl: 'https://www.youtube.com/watch?v=QjJbfBq2SRs',
                            videoTitle: 'Back',)));
                },
                child: Video_Container_widget(
                    "Back", "assets/workout/back.jpg"),),


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
