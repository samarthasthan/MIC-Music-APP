import 'package:flutter/material.dart';
import '/views/searchHome.dart';

class searchHomeModel {
  static final List<String> _historyButton = [
    'Fall out boy',
    'Good girl',
  ];
  static final List<String> _topButton = [
    'Button 1',
    'Button 2',
  ];
  static final List<Map<String, String>> _searchList = [
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
    {
      'title': 'Song Title 4',
      'artist': 'Artist Name 4',
      'imageUrl':
          'https://indiater.com/wp-content/uploads/2021/06/Free-Music-Album-Cover-Art-Banner-Photoshop-Template-1024x1024.jpg',
    },
    {
      'title': 'Song Title 5',
      'artist': 'Artist Name 5',
      'imageUrl':
          'https://indiater.com/wp-content/uploads/2021/06/Free-Music-Album-Cover-Art-Banner-Photoshop-Template-1024x1024.jpg',
    },
    {
      'title': 'Song Title 6',
      'artist': 'Artist Name 6',
      'imageUrl':
          'https://indiater.com/wp-content/uploads/2021/06/Free-Music-Album-Cover-Art-Banner-Photoshop-Template-1024x1024.jpg',
    },
    {
      'title': 'Song Title 7',
      'artist': 'Artist Name 7',
      'imageUrl':
          'https://indiater.com/wp-content/uploads/2021/06/Free-Music-Album-Cover-Art-Banner-Photoshop-Template-1024x1024.jpg',
    },
    {
      'title': 'Song Title 8',
      'artist': 'Artist Name 8',
      'imageUrl':
          'https://indiater.com/wp-content/uploads/2021/06/Free-Music-Album-Cover-Art-Banner-Photoshop-Template-1024x1024.jpg',
    },
  ];
  static final List<Map<String, String>> _allTopSearching = [
    {
      'title': 'Song Title 1',
      'artist': 'Artist Name 1',
      'imageUrl':
          "https://i.pinimg.com/736x/63/a0/08/63a008f631ae7492a75a001bd0791e8f.jpg",
    },
  ];
  static final List<Map<String, String>> _searchArtist = [
    {
      'title': 'Song Title 1',
      'artist': 'Artist Name 1',
      'imageUrl':
          "https://indiater.com/wp-content/uploads/2021/06/Free-Music-Album-Cover-Art-Banner-Photoshop-Template-1024x1024.jpg",
    },
    {
      'title': 'Song Title 2',
      'artist': 'Artist Name 2',
      'imageUrl':
          'https://media.istockphoto.com/id/1175435360/vector/music-note-icon-vector-illustration.jpg?s=612x612&w=0&k=20&c=R7s6RR849L57bv_c7jMIFRW4H87-FjLB8sqZ08mN0OU=',
    },
  ];
  static List<String> get historyButton => _historyButton;
  static List<String> get topButton => _topButton;
  static List<Map<String, String>> get searchList => _searchList;
  static List<Map<String, String>> get allTopList => _allTopSearching;
  static List<Map<String, String>> get SearchArtist => _searchArtist;
}
