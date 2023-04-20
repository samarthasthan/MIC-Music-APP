import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mic_music_app/views/search_home.dart';

import '../views/stackofCard.dart';

import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.albums});
  final List<String> albums;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> songs = [
    {
      'title': 'Song Title 1',
      'artist': 'Artist Name 1',
      'imageUrl':
          'https://99designs-blog.imgix.net/blog/wp-content/uploads/2017/12/attachment_68585523.jpg?auto=format&q=60&fit=max&w=930',
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
  late PageController _pageController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: _selectedIndex, viewportFraction: 0.35);
  }

  @override
  Widget build(BuildContext context) {
    // final metadata = _dataAudio();
    // print(metadata);
    final playing_title = 'Pray For You';
    final playing_artist = 'The Weekend';
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
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ),
                );
              },
              icon: Icon(Icons.search))
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(18),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Geez Weekly',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Card(
                    margin: const EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    clipBehavior: Clip.hardEdge,
                    elevation: 2,
                    child: InkWell(
                      onTap: () {},
                      child: Stack(children: [
                        FadeInImage(
                          placeholder: MemoryImage(kTransparentImage),
                          image: NetworkImage(
                              'https://i.pinimg.com/736x/63/a0/08/63a008f631ae7492a75a001bd0791e8f.jpg'),
                          fit: BoxFit.cover,
                          height: 165,
                          width: double.infinity,
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                playing_title,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Text(
                                playing_artist,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: Colors.white.withOpacity(1),
                                  width: 1,
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.play_arrow,
                                  size: 40,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  // handle play button press here
                                },
                              ),
                            ),
                          ),
                        ),
                      ]),
                    )),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Recently Music',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: songs.length,
                    itemBuilder: (BuildContext context, int index) {
                      final song = songs[index];
                      return Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 37,
                            width: double.infinity,
                            child: ListTile(
                              leading: Container(
                                width: 60,
                                height: 37,
                                child: Row(
                                  children: [
                                    Container(
                                        width: 20,
                                        child: Text(
                                          '${index + 1}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                        )),
                                    Image.network(
                                      song['imageUrl']!,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ),
                              title: Text(
                                song['title']!,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                              ),
                              subtitle: Text(
                                song['artist']!,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.more_horiz,
                                    color: Colors.white, size: 17),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ]),
        ),
      ),
      persistentFooterButtons: [
        ListTile(
          leading: CircleAvatar(
            radius: 30.0,
            child: ClipOval(
              child: Image(
                image: NetworkImage(
                    'https://indiater.com/wp-content/uploads/2021/06/Free-Music-Album-Cover-Art-Banner-Photoshop-Template-1024x1024.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Come Back Home",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                    ),
              ),
              IconButton(
                icon: Icon(
                  Icons.skip_previous_outlined,
                  size: 20,
                  color: Colors.white,
                ),
                onPressed: () {
                  // handle back button press here
                },
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.white.withOpacity(1),
                    width: 1,
                  ),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.play_arrow,
                    size: 20,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // handle play button press here
                  },
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.skip_next_outlined,
                  size: 20,
                  color: Colors.white,
                ),
                onPressed: () {
                  // handle next button press here
                },
              ),
            ],
          ),
        )
      ],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Fixed
        backgroundColor: Color(0xFF0E0B1F),
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
