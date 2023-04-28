class ArtistModel {
  static final List<ArtistForm> _artistList = <ArtistForm>[
    ArtistForm(
        id: 1, name: "Maria Lucil", imagePath: "assets/images/Image5.png"),
    ArtistForm(id: 2, name: "Suzy Bae", imagePath: "assets/images/Image13.png"),
    ArtistForm(
        id: 3, name: "Mercia Luu", imagePath: "assets/images/Image12.png"),
    ArtistForm(id: 4, name: "Mino", imagePath: "assets/images/Image14.png"),
    ArtistForm(
        id: 5, name: "David Lamber", imagePath: "assets/images/Image11.png"),
    ArtistForm(id: 6, name: "Winner", imagePath: "assets/images/Image10.png"),
  ];

  static List<ArtistForm> get artistList => _artistList;
}

class ArtistForm {
  int id;
  String name;
  String imagePath;

  ArtistForm({required this.id, required this.name, required this.imagePath});
}
