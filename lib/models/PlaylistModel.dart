class PlaylistModel {
  
  static final List<PlaylistForm> _playlistList = [
    PlaylistForm(
        id: 1,
        title: "Rulia and Remé",
        creator: "Jeeny Benmy",
        imagePath: "assets/images/Image1.png")
  ];

  static List<PlaylistForm> get playlistList => _playlistList;

}

class PlaylistForm {
  int id;
  String title;
  String creator;
  String imagePath;

  PlaylistForm(
      {required this.id,
      required this.title,
      required this.creator,
      required this.imagePath});
}
