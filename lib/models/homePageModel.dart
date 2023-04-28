import 'package:flutter/material.dart';

class HomePageModel {
  static const int _numberOfRecentMusic = 4;
  // Note if you are fetching image using internet or server, then change the image from Image.asset in View/Accounts under GridView
  static final List<String> _imageUrlNewAlbums = [
    "https://99designs-blog.imgix.net/blog/wp-content/uploads/2017/12/attachment_68585523.jpg?auto=format&q=60&fit=max&w=930",
    "https://indiater.com/wp-content/uploads/2021/06/Free-Music-Album-Cover-Art-Banner-Photoshop-Template-1024x1024.jpg",
    "https://images.pexels.com/photos/2170729/pexels-photo-2170729.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://media.istockphoto.com/id/1175435360/vector/music-note-icon-vector-illustration.jpg?s=612x612&w=0&k=20&c=R7s6RR849L57bv_c7jMIFRW4H87-FjLB8sqZ08mN0OU=",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz7S1EU5P-iu3lUHBAO0w6BKU08w_TsCPVmke-aJeDOnQgzq-0kTtEGXDvrdSXIjJeoVTB3qBd58I&usqp=CAU&ec=48665698",
    "https://lh3.googleusercontent.com/w8QDcpITg-64iylxia0Z4oWzbmlkHdSeSNyGslc_0ZcJgCtgLHkhugunsDRh_t87UQadn_si6-gPpvI=w226-h226-l90-rj",
    "https://i.pinimg.com/736x/63/a0/08/63a008f631ae7492a75a001bd0791e8f.jpg",
  ];
  static final List<Map<String, String>> _Weekly = [
    {
      'title': 'Pray For You',
      'artist': 'The Weekend',
      'imageUrl':
          "https://i.pinimg.com/736x/63/a0/08/63a008f631ae7492a75a001bd0791e8f.jpg",
    }
  ];
  static final List<Map<String, String>> _recentMusic = [
    {
      'title': 'Pray For You',
      'artist': 'The Weekend',
      'imageUrl':
          "https://i.pinimg.com/736x/63/a0/08/63a008f631ae7492a75a001bd0791e8f.jpg",
    },
    {
      'title': 'Song Title 2',
      'artist': 'Artist Name 2',
      'imageUrl':
          'https://i.pinimg.com/736x/63/a0/08/63a008f631ae7492a75a001bd0791e8f.jpg',
    },
    {
      'title': 'Song Title 3',
      'artist': 'Artist Name 3',
      'imageUrl':
          'https://indiater.com/wp-content/uploads/2021/06/Free-Music-Album-Cover-Art-Banner-Photoshop-Template-1024x1024.jpg',
    },
  ];
  static final String _imageUrlWeekly =
      "https://i.pinimg.com/736x/63/a0/08/63a008f631ae7492a75a001bd0791e8f.jpg";
  static int _numberOfNewAlumbs = _imageUrlNewAlbums.length;

  static int get numberOfNewAlumbs => _numberOfNewAlumbs;
  static int get numberOfRecentMusic => _numberOfRecentMusic;
  static List<String> get imageUrl => _imageUrlNewAlbums;
  static String get imageUrlWeekly => _imageUrlWeekly;
  static List<Map<String, String>> get weekly => _Weekly;

  static List<Map<String, String>> get recentMusic => _recentMusic;
}
