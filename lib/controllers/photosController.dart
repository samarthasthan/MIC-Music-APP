import 'package:flutter/material.dart';
import '../models/photoModel.dart';

class PhotoController {
  final List<Photo> _photos = [
    Photo(
        name: "LoginPageBackground",
        url: "assets/images/loginPageBackground.png"),
    Photo(name: "background2", url: "assets/images/background2.png"),
    Photo(name: "facebook", url: "assets/images/facebook.png"),
    Photo(name: "google", url: "assets/images/google.png"),
    Photo(name: "twitter", url: "assets/images/twitter.png"),
  
  ];

  List<Photo> getPhotos() {
    return _photos;
  }

  AssetImage getPhotoAsset(String name) {
    Photo photo = _photos.firstWhere((photo) => photo.name == name);
    return AssetImage(photo.url);
  }
}
