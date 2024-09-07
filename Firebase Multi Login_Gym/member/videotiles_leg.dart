
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_management/Firebase%20Multi%20Login_Gym/member/video_models.dart';


import 'Videodetail.dart';

class VideoTiles_leg extends StatefulWidget {
  @override
  _VideoTiles_legState createState() => _VideoTiles_legState();
}

class _VideoTiles_legState extends State<VideoTiles_leg> {
  @override





  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        Leg_Data.length,
        (index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => VideoDetailScreen(
                          thumbnail: Leg_Data[index].thumbnail,
                          videoUrl: Leg_Data[index].videoUrl,
                          videoTitle: Leg_Data[index].videoTitle,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(Leg_Data[index].thumbnail),
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
                ),
                SizedBox(height: 8),
                Container(
             margin: EdgeInsets.only(bottom: 15,),
                  width: 350,
                  height: 35,
                 // color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Video Description: ",style: GoogleFonts.fredoka(fontSize: 15,color: Colors.white70),),
                  Text(
                    Leg_Data[index].videoTitle,
                      style: GoogleFonts.varelaRound(
                          fontSize: 15, color: Colors.red.shade200),
                    ),
                    ],
                  ),

                ),
              ],
            ),
          );
        },
      ),
    );
  }
}



List<VideoModel> Leg_Data = [
  VideoModel(
    thumbnail: "assets/workout/leg.jpg",
    videoUrl: "https://www.youtube.com/watch?v=GHhGCo4Moy0",
    videoTitle: "Leg",
  ),
  VideoModel(
    thumbnail: "assets/workout/leg.jpg",
    videoUrl: "https://www.youtube.com/watch?v=GHhGCo4Moy0",
    videoTitle: "Leg",
  ),
  VideoModel(
    thumbnail: "assets/workout/leg.jpg",
    videoUrl: "https://www.youtube.com/watch?v=GHhGCo4Moy0",
    videoTitle: "Leg",
  ),
  VideoModel(
    thumbnail: "assets/workout/leg.jpg",
    videoUrl: "https://www.youtube.com/watch?v=GHhGCo4Moy0",
    videoTitle: "Leg",
  ),
  VideoModel(
    thumbnail: "assets/workout/leg.jpg",
    videoUrl: "https://www.youtube.com/watch?v=GHhGCo4Moy0",
    videoTitle: "Leg",
  ),

];


