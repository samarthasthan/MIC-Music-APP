import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:micmusic/controls/SongController.dart';
import 'package:micmusic/models/SongModel.dart';

import '../constants.dart';

class Song extends StatelessWidget {
  const Song({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Song"),
        centerTitle: true,
        backgroundColor: Color(0xFF0E0B1F),
        elevation: 0.0,
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _searchController = TextEditingController();
  final SongController _songController = SongController();
  late List<SongForm> songList;

  @override
  void initState() {
    songList = _songController.songList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      height: double.infinity,
      width: double.infinity,
      color: const Color(0xFF0E0B1F),
      padding: EdgeInsets.symmetric(horizontal: 24.w),
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
                  fillColor: const Color(0xFF292D39),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: const BorderSide(color: Color(0xFF363942)))),
              onChanged: (value) {
                setState(() {
                  songList = _songController.songList
                      .where((song) =>
                          (song.title
                              .toLowerCase()
                              .contains(value.toLowerCase())) ||
                          (song.creator
                              .toLowerCase()
                              .contains(value.toLowerCase())))
                      .toList();
                });
              },
            ),
            SizedBox(
              height: 30.h,
            ),
            SongList(songList: songList),
          ],
        ),
      ),
    ));
  }
}

class SongList extends StatefulWidget {
  final List<SongForm> songList;
  const SongList({super.key, required this.songList});

  @override
  State<SongList> createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  @override
  Widget build(BuildContext context) {
    return (widget.songList.isNotEmpty ) ? ListView.builder(
        shrinkWrap: true,
        itemCount: widget.songList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      index < 10 ? "0${index + 1}" : "${index + 1}",
                      style: serialNo,
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Image.asset(
                      widget.songList[index].imagePath,
                      height: 32.h,
                      width: 32.w,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.songList[index].title,
                          style: textTheme.bodyLarge,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          widget.songList[index].creator,
                          style: creatorStyle,
                        )
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          //handle OnPress
                        },
                        icon: Icon(Icons.more_horiz,
                            size: 24.h, color: Color(0xFFFFFFFF)))
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 79.w,
                    ),
                    Expanded(
                      child: Container(
                        color: const Color(0xFFFFFFFF),
                        height: 0.5.h,
                      ),
                    )
                  ],
                )
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
  }
}
