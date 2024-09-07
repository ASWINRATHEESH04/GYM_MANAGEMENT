class VideoModel {
  final String thumbnail, videoUrl,videoTitle;

  VideoModel({
    required this.thumbnail,
    required this.videoUrl,
    required this.videoTitle,

  });
}

List<VideoModel> dummyData = [
  VideoModel(
    thumbnail: "assets/workout/leg.jpg",
    videoUrl: "https://www.youtube.com/watch?v=GHhGCo4Moy0",
    videoTitle: "Leg",
  ),
  VideoModel(
    thumbnail: "assets/workout/chest.jpg",
    videoUrl: "https://www.youtube.com/watch?v=lnDZnMmIO8I",
    videoTitle: "Chest",
  ),
  VideoModel(
    thumbnail: "assets/workout/Back.jpg",
    videoUrl: "https://www.youtube.com/watch?v=pxiu58V1_I4",
    videoTitle: "Back",
  ),
  VideoModel(
    thumbnail: "assets/workout/shoulder.jpg",
    videoUrl: "https://www.youtube.com/watch?v=mNnyBG8agxg",
    videoTitle: "Shoulder",
  ),
  VideoModel(
    thumbnail: "assets/workout/arms.jpg",
    videoUrl: "https://www.youtube.com/watch?v=mcuFTrNDLkg",
    videoTitle: "Arms",
  ),

];
