import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class Chest_Video_Detail_Page extends StatefulWidget {
  final String thumbnail,videoUrl,videoTitle;
  Chest_Video_Detail_Page({
    required this.thumbnail,required this.videoUrl,required this.videoTitle
  });




  @override
  _Leg_Video_Detail_PageState createState() => _Leg_Video_Detail_PageState();
}

class _Leg_Video_Detail_PageState extends State<Chest_Video_Detail_Page> {
  late YoutubePlayerController _playerController;
  // static String videoId = videoUrl;

  void runYoutubePlayer() {
    _playerController = YoutubePlayerController(
      // initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl),
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl)!,
      flags: YoutubePlayerFlags(
        enableCaption: false,
        isLive: false,
        autoPlay: true,
      ),

    );
  }

  @override
  void initState() {
    super.initState();
    runYoutubePlayer();
  }

  @override
  void deactivate() {
    _playerController.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
    _playerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        showVideoProgressIndicator: true,

        controller: _playerController,
      ),
      builder: (context, player) {
        return Scaffold(

          backgroundColor: Color(0xFF282828),
          appBar: AppBar(
            title: Text(
              "Videos",
              style: TextStyle(color: Colors.white),
            ),
            elevation: 0,
            backgroundColor: Color(0xFF282828),
            leading: IconButton(
              onPressed: () {
                // Navigator.pop(
                //     context, MaterialPageRoute(builder: (_) => VideoTiles()));
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),),),
          body: SafeArea(
            child: Column(
              children: [
                player,
                Expanded(
                  child: Container(

                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, right: 20, left: 20),
                          ),
                          SizedBox(height: 20),
                          Text(widget.videoTitle,style: TextStyle(color: Colors.white),),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
