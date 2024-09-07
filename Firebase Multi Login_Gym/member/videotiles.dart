




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_management/Firebase%20Multi%20Login_Gym/member/video_models.dart';

import 'Videodetail.dart';

class VideoTiles extends StatefulWidget {
  @override
  _VideoTilesState createState() => _VideoTilesState();
}

class _VideoTilesState extends State<VideoTiles> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        dummyData.length,
        (index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => VideoDetailScreen(
                          thumbnail: dummyData[index].thumbnail,
                          videoUrl: dummyData[index].videoUrl,
                          videoTitle: dummyData[index].videoTitle,
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
                          image: AssetImage(dummyData[index].thumbnail),
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
                      dummyData[index].videoTitle,
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

