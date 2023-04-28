import 'package:flutter/material.dart';

class AccountsModel {
  static const int _numberOfPlaylists = 22;
  static const  String _numberOfFollowers = "360K";
  static const int _numberOfFollowing = 56;
  // Note if you are fetching image using internet or server, then change the image from Image.asset in View/Accounts under GridView
  static final List<RecentActivity> _imagePath = <RecentActivity>[
    RecentActivity(imagePath: "assets/img/Image1.png", handleClick: () {}),
    RecentActivity(imagePath: "assets/img/Image2.png", handleClick: () {}),
    RecentActivity(imagePath: "assets/img/Image3.png", handleClick: () {}),
    RecentActivity(imagePath: "assets/img/Image4.png", handleClick: () {}),
    RecentActivity(imagePath: "assets/img/Image5.png", handleClick: () {}),
    RecentActivity(imagePath: "assets/img/Image6.png", handleClick: () {}),
    RecentActivity(imagePath: "assets/img/Image7.png", handleClick: () {}),
    RecentActivity(imagePath: "assets/img/Image8.png", handleClick: () {}),
  ];

  static int get numberOfPlaylists => _numberOfPlaylists;
  static String get numberOfFollowers => _numberOfFollowers;
  static int get numberOfFollowing => _numberOfFollowing;
  static List<RecentActivity> get imagePath => _imagePath;
}

class RecentActivity {
  String imagePath;
  Function handleClick;

  RecentActivity({required this.imagePath, required this.handleClick});
}
