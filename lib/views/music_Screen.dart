import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:mic_music_app/views/page1.dart';
import 'package:mic_music_app/views/page3.dart';


import '../constants.dart';

class SwappablePages extends StatefulWidget {
  @override
  _SwappablePagesState createState() => _SwappablePagesState();
}

class _SwappablePagesState extends State<SwappablePages> {
  final PageController _pageController = PageController(initialPage: 1);
  int _currentPageIndex = 1;
  final _controller = PageController();

  //int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: PageView(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        children: <Widget>[

          Page1(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
                width: 10.w,
              ),
              SizedBox(height: 48.h,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 80.h),
                  Center(
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('assets/image1.png'),
                    ),
                  ),
                  SizedBox(height: 30.sp),
                  Container(
                    child: Text(
                      'Come to me',
                      style: TextStyle(
                          color: iconColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.sp),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Container(
                    child: Text(
                      'One Republic',
                      style: TextStyle(
                          color: iconColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp),
                    ),
                  ),
                  SizedBox(height: 35.sp),
                  Text(
                    'It is a long established fact that a reader',
                    style: TextStyle(
                        color: Color(0xFFCBFB5E),
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp),
                  ),
                  SizedBox(
                    height: 35.sp,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            showModalBottomSheet(
                                constraints: BoxConstraints(
                                    maxWidth: double.infinity, maxHeight: 300),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (BuildContext context) {
                                  return BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text(
                                            'Share To',
                                            style: TextStyle(
                                                fontSize: 25.h,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        ListTile(
                                          leading: CircleAvatar(
                                            radius: 15,
                                            backgroundImage:
                                                AssetImage('assets/fbb.png'),
                                          ),
                                          title: Text('FaceBook'),
                                          onTap: () {},
                                        ),
                                        ListTile(
                                          leading: CircleAvatar(
                                            radius: 15,
                                            backgroundImage: AssetImage(
                                                'assets/googleplus.png'),
                                          ),
                                          title: Text('Google +'),
                                          onTap: () {},
                                        ),
                                        ListTile(
                                          leading: CircleAvatar(
                                            radius: 15,
                                            backgroundImage: AssetImage(
                                                'assets/twitter.png'),
                                          ),
                                          title: Text('Twitter'),
                                          onTap: () {},
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.share),
                                          title: Text('Copy Link'),
                                          onTap: () {},
                                        )
                                      ],
                                    ),
                                  );
                                });
                          });
                        },
                        icon: Icon(
                          Icons.share,
                          color: iconColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return PlayList();
                          }));
                        },
                        icon: Icon(
                          Icons.playlist_add,
                          color: iconColor,
                        ),
                      ),
                      IconButton(
                        highlightColor: Color(0xFFCBFB5E),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: 200,
                                    ),
                                    AlertDialog(
                                      backgroundColor: Color(0xFFCBFB5E),
                                      title: Text(
                                        'Add this song to My Playlist',
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        },
                        icon: Icon(
                          Icons.favorite_outline,
                          color: iconColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            showModalBottomSheet(
                                constraints: BoxConstraints(
                                    maxWidth: double.infinity, maxHeight: 300),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (BuildContext context) {
                                  return BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text(
                                            'Download To',
                                            style: TextStyle(
                                                fontSize: 25.h,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 25.h,
                                        ),
                                        ListTile(
                                          title: Text(
                                            'Free',
                                            style: TextStyle(
                                                fontSize: 20.h,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          subtitle: Row(
                                            children: [
                                              Text('128 Kbps'),
                                              SizedBox(
                                                width: 25.w,
                                              ),
                                              DownloadButton(
                                                colour1: Color(0xFFCBFB5E),
                                                colour2: Color(0xFF92b34b),
                                                text1: 'Free',
                                                text2:
                                                    'Downloading 128 Kbps for this song',
                                              )
                                            ],
                                          ),
                                        ),
                                        ListTile(
                                            title: Text('Vip Account'),
                                            subtitle: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text('320 Kbps'),
                                                    SizedBox(
                                                      width: 25.w,
                                                    ),
                                                    DownloadButton(
                                                      colour1:
                                                          Color(0xFFf2c94c),
                                                      colour2:
                                                          Color(0xFF92b34b),
                                                      text1: 'VIP',
                                                      text2:
                                                          'Downloading 320 Kbps for this song',
                                                    )
                                                    //ElevatedButton(style: ElevatedButton.styleFrom(foregroundColor: Colors.black, backgroundColor: Color(0xFFf2c94c)),onPressed: (){}, child: Text('VIP',style: TextStyle(fontSize: 16),))
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text('Loss less'),
                                                    SizedBox(
                                                      width: 25.w,
                                                    ),
                                                    DownloadButton(
                                                      colour1:
                                                          Color(0xFFf2c94c),
                                                      colour2:
                                                          Color(0xFF92b34b),
                                                      text1: 'VIP',
                                                      text2:
                                                          'Downloading Loss less for this song',
                                                    )
                                                    //ElevatedButton(style: ElevatedButton.styleFrom(foregroundColor: Colors.black, backgroundColor: Color(0xFFf2c94c)),onPressed: (){}, child: Text('VIP',style: TextStyle(fontSize: 16),))
                                                  ],
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),
                                  );
                                });
                          });
                        },
                        icon: Icon(
                          Icons.download_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35.sp,
                  ),
                  Container(
                      width: 300.sp,
                      child: ProgressBar(
                          timeLabelPadding: 10,
                          barHeight: 3,
                          thumbRadius: 6,
                          thumbGlowRadius: 8,
                          progressBarColor: Color(0xFFCBFB5E),
                          baseBarColor: Colors.grey,
                          thumbColor: Color(0xFFCBFB5E),
                          progress: Duration(),
                          total: Duration(minutes: 5))),

                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.shuffle,
                                color: iconColor, size: 30)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.skip_previous_outlined,
                                color: iconColor, size: 35)),
                        TextButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.play_circle,
                              color: Color(0xFFCBFB5E),
                              size: 70,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.skip_next_outlined,
                                color: iconColor, size: 35)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.loop,
                                color: iconColor, size: 35)),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          //Page3(),//page 2


          //Positioned(top:0,left:0,right:0,bottom:100,child: Container(color: Colors.white,child: Text("1dsgsgsgsd",style: TextStyle(color: Colors.white),))),
        ],

      ),
      

    );
  }
}


//Widgets

class DownloadButton extends StatelessWidget {
  const DownloadButton({
    super.key, required this.colour1, required this.colour2, required this.text1, required  this.text2,
  });
  final Color colour1;
  final Color colour2;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(style: ElevatedButton.styleFrom(foregroundColor: Colors.black, backgroundColor: colour1),
        onPressed: (){
          Navigator.of(context).pop();
          showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return Column(
                children: [
                  SizedBox(height: 200,),
                  AlertDialog(
                    //alignment: Alignment(0.1, -0.5.h),
                    buttonPadding: EdgeInsets.all(10),
                    backgroundColor: Color(0xFFCBFB5E),
                    title: Text(text2,style: TextStyle(fontSize: 16,color: Colors.black54,fontWeight: FontWeight.w500),),
                  ),
                ],
              );
            },
          );


        },

        child: Text(text1,));
  }
}



class PlayList extends StatefulWidget {
  const PlayList({Key? key}) : super(key: key);

  @override
  State<PlayList> createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  @override
  Widget build(BuildContext context) {
    List<Playlist> playlists = Playlist.playlists;
    return Scaffold(
      backgroundColor: Color(0xFF0E0B1F),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 65.h,
                  width: 10,
                ),
                IconButton(onPressed: () {
                  Navigator.pop(context);
                }, icon: Icon(Icons.west)),
                SizedBox(width: 100.w),
                Text(
                  'Playlist',
                  style:
                  TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Color(0xFF363942),
                  hintText: 'Search',
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  prefixStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            ListView.builder(
                shrinkWrap: true,
                //itemCount: playlists.length,  use wiht song_dart
                itemCount: 1,
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image.asset(
                                  'assets/playlist_image_1.png',
                                  height: 50.h,
                                  width: 50.w,
                                  fit: BoxFit.cover,
                                )),
                            SizedBox(
                              width: 20.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Rulia and Reme'), // from song data
                                SizedBox(
                                  height: 13.h,
                                ),
                                Text('Jeeny Benmy') // from song data
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                })),
            SizedBox(
              height: 47.h,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color((0xFFcbfb5e))),
                onPressed: () {
                  setState(() {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(),
                            backgroundColor: Color(0xFF292d39),
                            title: Text('CREATE PLAYLIST',
                                style: TextStyle(fontSize: 16)),
                            content: TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter your playlist name',
                              ),
                              showCursor: true,
                            ),
                            actions: <Widget>[

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(width: 93.w,
                                    child: TextButton(onPressed: (){
                                      Navigator.pop(context);
                                    }
                                        , child: Text('Cancle',style: TextStyle(color: Color(0xFFcbfb5e)),)),
                                  ),
                                  SizedBox(width: 93.w,child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFcbfb5e)),onPressed: (){}, child: Text('OK',style: TextStyle(color: Colors.black),)))
                                ],
                              )
                            ],
                          );
                        });
                  });
                },
                child: Text(
                  'Add New Playlist',
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}


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


class Playlist1 extends StatefulWidget {
  const Playlist1({Key? key}) : super(key: key);

  @override
  State<Playlist1> createState() => _Playlist1State();
}

class _Playlist1State extends State<Playlist1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0E0B1F),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 65.h,
                  width: 10,
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.west)),
                SizedBox(width: 100.w),
                Text(
                  'Playlist',
                  style:
                  TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Color(0xFF363942),
                  hintText: 'Search',
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  prefixStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),

          ],

        ),

      ),
    );
  }
}







