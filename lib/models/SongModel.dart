class SongModel {
  static final List<SongForm> _songList = <SongForm>[
    SongForm(
        id: 1,
        title: "Nice For What",
        creator: "Girl Generation",
        imagePath: "assets/images/Image1.png"),
    SongForm(
        id: 2,
        title: "Where can I get some ?",
        creator: "Suji Wong",
        imagePath: "assets/images/Image3.png"),
    SongForm(
        id: 3,
        title: "Why do we use it ?",
        creator: "Mercia",
        imagePath: "assets/images/Image9.png"),
    SongForm(
        id: 4,
        title: "Turn Off The Light",
        creator: "Mino",
        imagePath: "assets/images/Image6.png"),
    SongForm(
        id: 5,
        title: "Where are you now ?",
        creator: "Suji Wong",
        imagePath: "assets/images/Image14.png"),
    SongForm(
        id: 6,
        title: "W",
        creator: "DBSK",
        imagePath: "assets/images/Image10.png")
  ];

  static List<SongForm> get songList => _songList;

}

class SongForm {
  int id;
  String title;
  String creator;
  String imagePath;

  SongForm(
      {required this.id,
      required this.title,
      required this.creator,
      required this.imagePath});
}
