import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:micmusic/constants.dart';
import 'package:micmusic/controls/AlbumController.dart';
import 'package:micmusic/models/AlbumModel.dart';

class Album extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Album"),
        centerTitle: true,
        backgroundColor: Color(0xFF0E0B1F),
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

  final AlbumController _albumController = AlbumController();

  late List<AlbumForm> _albumList;

  @override
  void initState() {
    _albumList = _albumController.albumList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 21.w),
      color: const Color(0xFF0E0B1F),
      child: SingleChildScrollView(
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
                  _albumList = _albumController.albumList
                      .where((album) => (album.title
                          .toLowerCase()
                          .contains(value.toLowerCase())) || (album.creator.toLowerCase().contains(value.toLowerCase())))
                      .toList();
                });
              },
            ),
            SizedBox(
              height: 30.h,
            ),
            AlbumList(
              listAlbum: _albumList,
            ),
          ],
        ),
      ),
    ));
  }
}

class AlbumList extends StatefulWidget {
  final List<AlbumForm> listAlbum;
  AlbumList({super.key, required this.listAlbum});

  @override
  State<AlbumList> createState() => _AlbumListState();
}

class _AlbumListState extends State<AlbumList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.listAlbum.length,
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
                      widget.listAlbum[index].imagePath,
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
                          widget.listAlbum[index].title,
                          style: textTheme.bodyLarge,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          widget.listAlbum[index].creator,
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
        });
  }
}

// Column(
//           children: [
//             Row(
//               children: [
//                 Text(
//                   "01",
//                   style: serialNo,
//                 ),
//                 SizedBox( width: 20.w,),
//                 Image.asset(
//                   'assets/images/Image3.png',
//                   height: 32.h,
//                   width: 32.w,
//                 ),
//                 SizedBox( width: 16.w,),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "No 9",
//                       style: textTheme.bodyLarge,
//                     ),
//                     SizedBox(
//                       height: 2.h,
//                     ),
//                     Text(
//                       "Girl Generation",
//                       style: creatorStyle,
//                     )
//                   ],
//                 ),
//                 const Spacer(),
//                 IconButton(onPressed: () {
//                   //handle OnPress
//                 }, icon: Icon(Icons.more_horiz, size: 24.h, color: Color(0xFFFFFFFF)))
//               ],
//             ),
//           SizedBox( height: 16.h,),
//           Row(
//             children: [
//               SizedBox( width: 79.w,),
//               Expanded(
//                 child: Container(               
//                   color: const Color(0xFFFFFFFF),
//                   height: 0.5.h,
//                 ),
//               )
//             ],
//           )
//           ],
//         )