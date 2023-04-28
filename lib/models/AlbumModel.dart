class AlbumModel {
  static final List<AlbumForm> _albumList = <AlbumForm>[
    AlbumForm(
        title: 'No 9',
        creator: 'Girl Generation',
        imagePath: 'assets/images/Image1.png'),
    AlbumForm(
        title: "Help XX",
        creator: "Suji Wong",
        imagePath: "assets/images/Image9.png"),
    AlbumForm(
        title: "IZZYI",
        creator: "Mercia",
        imagePath: "assets/images/Image3.png"),
    AlbumForm(
        title: "Turn Off",
        creator: "Mino",
        imagePath: "assets/images/Image6.png"),
    AlbumForm(
        title: "Where are you now ?",
        creator: "Suji Wong",
        imagePath: "assets/images/Image10.png"),
    AlbumForm(
        title: "W", creator: "DBSK", imagePath: "assets/images/Image11.png"),
    AlbumForm(
        title: "That ZZ",
        creator: "Mino",
        imagePath: "assets/images/Image12.png"),
    AlbumForm(
        title: "Studio 09",
        creator: "Suji Wong",
        imagePath: "assets/images/Image13.png"),
  ];

  static List<AlbumForm> get albumList => _albumList;
}

class AlbumForm {
  String title;
  String creator;
  String imagePath;

  AlbumForm(
      {required this.title, required this.creator, required this.imagePath});
}
