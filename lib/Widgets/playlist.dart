import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mic_music_app/Widgets/song_data.dart';

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
