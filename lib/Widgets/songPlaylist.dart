import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mic_music_app/Widgets/song_data.dart';

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
