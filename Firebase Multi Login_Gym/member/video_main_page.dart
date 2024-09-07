import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_management/Firebase%20Multi%20Login_Gym/member/videotiles.dart';



class video_Main_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Videos",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: Color(0xFF282828),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Color(0xFF282828),
        ),
        child: ListView(
          children: [
            VideoTiles(),
          ],
        ),
      ),
    );
  }
}