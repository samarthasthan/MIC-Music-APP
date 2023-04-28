import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Playlist {
  final String title;
  final String title2;
  final Image image;

  Playlist({required this.image,required this.title,required this.title2,});

  static List<Playlist> playlists = [
    Playlist(
      title: 'aaf',
      title2: 'abc',
      image: Image.asset('assets/playlist_image_1.png')
    ),
    Playlist(
        title: 'aaf',
        title2: 'abc',
        image: Image.asset('assets/playlist_image_1.png')
    ),
  ];
}

