import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Arms_videos_detail_page.dart';








class Arms_videos extends StatelessWidget {
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
                          Arms_Video_Detail_Page(
                            thumbnail: 'assets/workout/arms.jpg',
                            videoUrl: 'https://www.youtube.com/watch?v=prJ7vF2wx6A',
                            videoTitle: 'arms',)));
                },
                child: Video_Container_widget(
                    "arms", "assets/workout/arms.jpg"),),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          Arms_Video_Detail_Page(
                            thumbnail: 'assets/workout/arms.jpg',
                            videoUrl: 'https://www.youtube.com/watch?v=X6gWQ1Lcvjg',
                            videoTitle: 'arms',)));
                },
                child: Video_Container_widget(
                    "arms", "assets/workout/arms.jpg"),),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          Arms_Video_Detail_Page(
                            thumbnail: 'assets/workout/arms.jpg',
                            videoUrl: 'https://www.youtube.com/watch?v=T_JqZlCFnvI',
                            videoTitle: 'arms',)));
                },
                child: Video_Container_widget(
                    "arms", "assets/workout/arms.jpg"),),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          Arms_Video_Detail_Page(
                            thumbnail: 'assets/workout/arms.jpg',
                            videoUrl: 'https://www.youtube.com/watch?v=T_JqZlCFnvI',
                            videoTitle: 'arms',)));
                },
                child: Video_Container_widget(
                    "arms", "assets/workout/arms.jpg"),),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          Arms_Video_Detail_Page(
                            thumbnail: 'assets/workout/arms.jpg',
                            videoUrl: 'https://www.youtube.com/watch?v=UY6-JzdnHUM',
                            videoTitle: 'arms',)));
                },
                child: Video_Container_widget(
                    "arms", "assets/workout/arms.jpg"),),


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
