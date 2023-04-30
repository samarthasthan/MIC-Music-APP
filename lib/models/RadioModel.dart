import 'package:flutter/material.dart';

class RadioModel {
  static final List<RadioImageForm> _radioImageList = <RadioImageForm>[
    RadioImageForm(
        id: 1, imagePath: "assets/images/RadioImage1.png", onPress: () {}),
    RadioImageForm(
        id: 2, imagePath: "assets/images/RadioImage2.png", onPress: () {}),
    RadioImageForm(
        id: 3, imagePath: "assets/images/RadioImage3.png", onPress: () {})
  ];

  static final List<RadioPopularForm> _radioPopularList = <RadioPopularForm>[
    RadioPopularForm(
        id: 1,
        title: "Geez Radio Weekly",
        description:
            "Collection of the best Radio stations of RLING, constantly updated weekly.",
        imagePath: "assets/images/RadioPopular1.png",
        onPress: (context) {
          Navigator.pushNamed(context, '/radio/play',
              arguments: RadioPlayArgs(
                  id: 1,
                  title: "Boney Radio",
                  subTitle: "GeezFM 98Hz",
                  imagePath: "assets/images/RadioPlay1.png",
                  duration: const Duration(seconds: 185),
                  backGroundImagePath:
                      "assets/images/RadioDetailsBackground.png",
                  description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac magna vitae velit lobortis bibendum. Fusce non nunc augue. Aliquam ac pharetra velit, ut tempor nisi is that it",
                  program: "Boney Radio",
                  schedule: "9AM - 11AM",
                  producer: "Howard Lawence",
                  category: "R&B"
                  ));
        }),
    RadioPopularForm(
        id: 2,
        title: "Live peep show",
        description:
            "Collection of the best Radio stations of RLING, constantly updated weekly.",
        imagePath: "assets/images/RadioPopular2.png",
        onPress: (context) {
          Navigator.pushNamed(context, '/radio/play',
              arguments: RadioPlayArgs(
                  id: 2,
                  title: "Live peep show",
                  subTitle: "Geez Radio 99Hz",
                  imagePath: "assets/images/RadioPlay1.png",
                  duration: const Duration(seconds: 180),
                  backGroundImagePath:
                      "assets/images/RadioDetailsBackground.png",
                      description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac magna vitae velit lobortis bibendum. Fusce non nunc augue. Aliquam ac pharetra velit, ut tempor nisi is that it",
                  program: "Boney Radio",
                  schedule: "9AM - 11AM",
                  producer: "Howard Lawence",
                  category: "R&B"));
        }),
    RadioPopularForm(
        id: 3,
        title: "Live peep show",
        description:
            "Collection of the best Radio stations of RLING, constantly updated weekly.",
        imagePath: "assets/images/RadioPopular3.png",
        onPress: (context) {
          Navigator.pushNamed(context, '/radio/play',
              arguments: RadioPlayArgs(
                  id: 3,
                  title: "Live peep show",
                  subTitle: "Geez Radio 97Hz",
                  imagePath: "assets/images/RadioPlay1.png",
                  duration: const Duration(seconds: 150),
                  backGroundImagePath:
                      "assets/images/RadioDetailsBackground.png",
                      description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac magna vitae velit lobortis bibendum. Fusce non nunc augue. Aliquam ac pharetra velit, ut tempor nisi is that it",
                  program: "Boney Radio",
                  schedule: "9AM - 11AM",
                  producer: "Howard Lawence",
                  category: "R&B"));
        }),
    RadioPopularForm(
        id: 4,
        title: "Geez Radio Weekly",
        description:
            "Collection of the best Radio stations of RLING, constantly updated weekly.",
        imagePath: "assets/images/RadioPopular1.png",
        onPress: (context) {
          Navigator.pushNamed(context, '/radio/play',
              arguments: RadioPlayArgs(
                  id: 4,
                  title: "Geez Radio Weekly",
                  subTitle: "Geez Radio 96Hz",
                  imagePath: "assets/images/RadioPlay1.png",
                  duration: const Duration(seconds: 165),
                  backGroundImagePath:
                      "assets/images/RadioDetailsBackground.png",
                      description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac magna vitae velit lobortis bibendum. Fusce non nunc augue. Aliquam ac pharetra velit, ut tempor nisi is that it",
                  program: "Boney Radio",
                  schedule: "9AM - 11AM",
                  producer: "Howard Lawence",
                  category: "R&B"));
        }),
  ];

  static List<RadioImageForm> get radioImageList => _radioImageList;
  static List<RadioPopularForm> get radioPopularList => _radioPopularList;
}

class RadioImageForm {
  int id;
  String imagePath;
  Function onPress;

  RadioImageForm(
      {required this.id, required this.imagePath, required this.onPress});
}

class RadioPopularForm {
  int id;
  String imagePath;
  String title;
  String description;
  Function onPress;

  RadioPopularForm(
      {required this.id,
      required this.title,
      required this.description,
      required this.imagePath,
      required this.onPress});
}

class RadioPlayArgs {
  String title;
  String subTitle;
  String imagePath;
  int id;
  Duration duration;
  String backGroundImagePath;
  String description;
  String program;
  String schedule;
  String producer;
  String category;
  RadioPlayArgs(
      {required this.id,
      required this.title,
      required this.subTitle,
      required this.imagePath,
      required this.duration,
      required this.backGroundImagePath,
      required this.description,
      required this.program,
      required this.schedule,
      required this.producer,
      required this.category
      });
}
