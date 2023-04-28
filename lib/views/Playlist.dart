import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:micmusic/constants.dart';
import 'package:micmusic/controls/PlaylistController.dart';
import 'package:micmusic/models/PlaylistModel.dart';

class Playlist extends StatelessWidget {
  const Playlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Playlist"),
        centerTitle: true,
        backgroundColor: const Color(0xFF0E0B1F),
        elevation: 0.0,
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _searchController = TextEditingController();
  final PlaylistController _playlistController = PlaylistController();
  late List<PlaylistForm> playList;

  @override
  void initState() {
    playList = _playlistController.playlistList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      height: double.infinity,
      width: double.infinity,
      color: const Color(0xFF0E0B1F),
      padding: EdgeInsets.symmetric(horizontal: 21.w),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                  hintStyle: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xFF71737B)),
                  contentPadding: EdgeInsets.zero,
                  hintText: 'Search',
                  prefixIcon: Icon(
                    Icons.search,
                    color: const Color(0xFFEEEEEE),
                    size: 20.h,
                  ),
                  filled: true,
                  fillColor: Color(0xFF292D39),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: const BorderSide(color: Color(0xFF363942)))),
              onChanged: (value) {
                setState(() {
                  playList = _playlistController.playlistList
                      .where((playlist) =>
                          (playlist.title
                              .toLowerCase()
                              .contains(value.toLowerCase())) ||
                          (playlist.creator
                              .toLowerCase()
                              .contains(value.toLowerCase())))
                      .toList();
                });
              },
            ),
            SizedBox(
              height: 30.h,
            ),
            PlaylistList(playlistList: playList),
            TextButton(
                onPressed: () {
                  //Handle Add Playlist
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFFCBFB5E)),
                ),
                child: Text(
                  "Add New Playlist",
                  style: TextStyle(
                      fontSize: 16.sp, color: const Color(0xFF20242F), fontWeight: FontWeight.normal, ),
                ))
          ],
        ),
      ),
    ));
  }
}

class PlaylistList extends StatefulWidget {
  final List<PlaylistForm> playlistList;
  const PlaylistList({super.key, required this.playlistList});

  @override
  State<PlaylistList> createState() => _PlaylistListState();
}

class _PlaylistListState extends State<PlaylistList> {
  @override
  Widget build(BuildContext context) {
    return (widget.playlistList.length !=0 ) ?ListView.builder(
        shrinkWrap: true,
        itemCount: widget.playlistList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      widget.playlistList[index].imagePath,
                      height: 40.h,
                      width: 40.w,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.playlistList[index].title,
                          style: textTheme.bodyLarge,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          widget.playlistList[index].creator,
                          style: creatorStyle,
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          );
        })
        :
        Container(
          height: 50.h,
          child: Text("No results found"),
        )
        ; 
    ;
  }
}
