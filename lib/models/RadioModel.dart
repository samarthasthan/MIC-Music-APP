class RadioModel {
  static final List<RadioImageForm> _radioImageList = <RadioImageForm>[
    RadioImageForm(
        id: 1, imagePath: "assets/images/RadioImage1.png", onPress: () {}),
    RadioImageForm(id: 2, imagePath: "assets/images/RadioImage2.png", onPress: (){}),
    RadioImageForm(id: 3, imagePath: "assets/images/RadioImage3.png", onPress: (){})
  ];

  static List<RadioImageForm> get radioImageList => _radioImageList;
}

class RadioImageForm {
  int id;
  String imagePath;
  Function onPress;

  RadioImageForm(
      {required this.id, required this.imagePath, required this.onPress});
}
