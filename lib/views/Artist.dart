import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:micmusic/constants.dart';
import 'package:micmusic/controls/ArtistController.dart';
import 'package:micmusic/models/ArtistModel.dart';

class Artist extends StatelessWidget {
  const Artist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Artist"),
        centerTitle: true,
        backgroundColor: const Color(0xFF0E0B1F),
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
  final ArtistController _artistController = ArtistController();
  late List<ArtistForm> artistList;

  @override
  void initState() {
    artistList = _artistController.artistList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      height: double.infinity,
      width: double.infinity,
      color: const Color(0xFF0E0B1F),
      padding: EdgeInsets.symmetric(horizontal: 25.w),
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
                  artistList = _artistController.artistList
                      .where((album) => (album.name
                          .toLowerCase()
                          .contains(value.toLowerCase())))
                      .toList();
                });
              },
            ),
            SizedBox(
              height: 30.h,
            ),
            ArtistList(artistList: artistList)
          ],
        ),
      ),
    ));
  }
}

class ArtistList extends StatefulWidget {
  final List<ArtistForm> artistList;
  const ArtistList({super.key, required this.artistList});

  @override
  State<ArtistList> createState() => _ArtistListState();
}

class _ArtistListState extends State<ArtistList> {
  @override
  Widget build(BuildContext context) {
    return (widget.artistList.isNotEmpty)
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: widget.artistList.length,
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
                          widget.artistList[index].imagePath,
                          height: 48.h,
                          width: 48.h,
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Text(
                          widget.artistList[index].name,
                          style: textTheme.bodyLarge,
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
        : SizedBox(
            height: 50.h,
            child: const Text("No results found"),
          );
  }
}
