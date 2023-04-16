import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
import '../views/stackofCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.albums});
  final List<String> albums;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: _selectedIndex, viewportFraction: 0.35);
  }

  // Future<Metadata> _dataAudio() async {
  //   final metadata = await MetadataRetriever.fromFile(File(
  //       '../controllers/In The End Best Song Download(SongsZilla.Net).mp3'));
  //   print(metadata.albumArtistName);
  //   print(metadata.trackDuration);
  //   print(object)
  //   return metadata;
  // }

  @override
  Widget build(BuildContext context) {
    // final metadata = _dataAudio();
    // print(metadata);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: Text(
          'Geez',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Container(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'New Album',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'View all',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ),
              ],
            ),
            Container(
              height: 148,
              width: double.infinity,
              child: PageView.builder(
                itemCount: widget.albums.length,
                controller: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  double scale = 1 - (_selectedIndex - index).abs() * 0.2;
                  return Transform.scale(
                    scale: scale,
                    child: StackOfCards(
                      child: Container(height: 148),
                      url: widget.albums[index],
                      num: 2,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Fixed
        backgroundColor: Color(0x20242F),
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.grey,
        onTap: (_) {},
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place_outlined),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.radio_outlined),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
