import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import '../controllers/searchHomeController.dart';
import 'dart:ui';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchHomeController controller = SearchHomeController();
  var widgetKey = UniqueKey();
  final TextEditingController _searchController = TextEditingController();
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _isEditing = _searchController.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: brand2,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(14.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 55.h,
                  width: 327.h,
                  child: TextField(
                    controller: _searchController,
                    style: TextStyle(
                      color: neutral1,
                      fontSize: 16.sp,
                    ),
                    cursorColor: brand1,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(
                        Icons.search,
                        size: 25.h,
                        color: neutral1,
                      ),
                      suffixIcon: _isEditing
                          ? IconButton(
                              icon: Icon(
                                Icons.highlight_remove,
                                color: neutral1,
                                size: 20.sp,
                              ),
                              onPressed: () {
                                _searchController.clear();
                              },
                            )
                          : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.w),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color(0xFF292D39),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                _isEditing
                    ? DefaultTabController(
                        length: 6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TabBar(
                              isScrollable: true,
                              tabs: const [
                                Tab(text: 'All'),
                                Tab(text: 'Artist'),
                                Tab(text: 'MV'),
                                Tab(text: 'Album'),
                                Tab(text: 'Song'),
                                Tab(text: 'Playlist'),
                              ],
                              labelColor: neutral1,
                              unselectedLabelColor: neutral2,
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight
                                          .bold), // set font size for selected tab
                              unselectedLabelStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                            ),
                            SingleChildScrollView(
                              child: Container(
                                height: MediaQuery.of(context).size.height,
                                width: double.infinity,
                                child: TabBarView(
                                  children: [
                                    SearchAll(),
                                    SearchArtist("Top Searching"),
                                    SearchMV("Top Searching"),
                                    SearchResult("Top Searching"),
                                    SearchResult("Top Searching"),
                                    SearchResult("Top Searching"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Text('History', style: Constants.subtitle),
                          SizedBox(height: 16.h),
                          HorizontalButtonScrollView(
                            buttonTexts: controller.historyButton,
                            color1: neutral3,
                            color2: brand1,
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Text('Top Searching', style: Constants.subtitle),
                          SizedBox(height: 16.h),
                          HorizontalButtonScrollView(
                            buttonTexts: controller.topButton,
                            color1: brand1,
                            color2: neutral3,
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchResult extends StatelessWidget {
  final SearchHomeController controller = SearchHomeController();
  SearchResult(this.title);
  final String title;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: NeverScrollableScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(
                title,
                style: Constants.extra,
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, index) {
          return SimpleList(index);
        }, childCount: controller.searchList.length))
      ],
    );
  }
}

class SimpleList extends StatelessWidget {
  final SearchHomeController controller = SearchHomeController();

  SimpleList(
    this.index, {
    super.key,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    final searchList = controller.searchList[index];
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 40.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.w),
                child: Image.network(
                  searchList['imageUrl']!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(searchList['title']!, style: Constants.subHead),
                  SizedBox(height: 8.h),
                  Text(searchList['artist']!,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: const Color(0xFF817A7A),
                            fontSize: 12.sp,
                          )),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Icon(
                  Icons.more_horiz,
                  color: neutral1,
                  size: 24.sp,
                ),
              ],
            ),
          ],
        ),
        Divider(height: 22.h, color: const Color(0xFF3E3C4C)),
      ],
    );
  }
}

class SearchAll extends StatelessWidget {
  final SearchHomeController controller = SearchHomeController();
  SearchAll();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Text(
            'TopSearch',
            style: Constants.extra,
          ),
          SizedBox(
            height: 20.h,
          ),
          SearchAllTile(
            controller: controller,
            itemLength: controller.allTopList.length,
            mapList: controller.allTopList,
            containerHeight: 80.h,
          ),
          Text(
            'Artist',
            style: Constants.extra,
          ),
          SizedBox(
            height: 20.h,
          ),
          SearchAllTile(
            controller: controller,
            itemLength: controller.searchArtist.length,
            mapList: controller.searchArtist,
            containerHeight: 125.h,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Songs',
            style: Constants.extra,
          ),
          SizedBox(
            height: 20.h,
          ),
          SearchAllTile(
            controller: controller,
            itemLength: controller.searchArtist.length,
            mapList: controller.searchArtist,
            containerHeight: 125.h,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text('Albums', style: Constants.extra),
          SizedBox(
            height: 20.h,
          ),
          SearchAllTile(
            controller: controller,
            itemLength: controller.searchArtist.length,
            mapList: controller.searchArtist,
            containerHeight: 125.h,
          ),
        ],
      ),
    );
  }
}

class SearchAllTile extends StatelessWidget {
  const SearchAllTile({
    super.key,
    required this.controller,
    required this.itemLength,
    required this.mapList,
    required this.containerHeight,
  });

  final SearchHomeController controller;
  final int itemLength;
  final List<Map<String, String>> mapList;
  final double containerHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: containerHeight,
      width: double.infinity,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: itemLength,
        itemBuilder: (BuildContext context, int index) {
          final music = mapList[index];
          return Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 40.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.w),
                      child: Image.network(
                        music['imageUrl']!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          music['artist']!,
                          style: Constants.subHead,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          music['artist']!,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Color(0xFF817A7A),
                                    fontSize: 12.sp,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Icon(
                        Icons.more_horiz,
                        color: neutral1,
                        size: 24.sp,
                      ),
                    ],
                  ),
                ],
              ),
              Divider(height: 22.h, color: neutral2),
            ],
          );
        },
      ),
    );
  }
}

class HorizontalButtonScrollView extends StatelessWidget {
  const HorizontalButtonScrollView({
    Key? key,
    required this.buttonTexts,
    required this.color1,
    required this.color2,
  }) : super(key: key);

  final List<String> buttonTexts;
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: buttonTexts.map((buttonText) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: neutral1,
                side: BorderSide(color: Color(0xFFCBFB5E), width: 1.w),
                backgroundColor: color1,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              child: Text(
                buttonText,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: color2,
                      fontSize: 14.sp,
                    ),
              ),
              onPressed: () {
                // Add your button onpressed action here
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}

class SearchArtist extends StatelessWidget {
  final SearchHomeController controller = SearchHomeController();
  SearchArtist(this.title, {super.key});
  final String title;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(
                title,
                style: Constants.extra,
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, index) {
          return SearchArtistTile(index);
        }, childCount: controller.searchArtist.length))
      ],
    );
  }
}

class SearchArtistTile extends StatelessWidget {
  final SearchHomeController controller = SearchHomeController();

  SearchArtistTile(
    this.index, {
    super.key,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    final searchList = controller.searchArtist[index];
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 40.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.w),
                child: Image.network(
                  searchList['imageUrl']!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 14.h,
                  ),
                  Text(searchList['artist']!, style: Constants.subHead),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Icon(
                  Icons.more_horiz,
                  color: neutral1,
                  size: 24.sp,
                ),
              ],
            ),
          ],
        ),
        Divider(height: 22.h, color: neutral2),
      ],
    );
  }
}

class SearchMV extends StatelessWidget {
  final SearchHomeController controller = SearchHomeController();
  SearchMV(this.title, {super.key});
  final String title;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: NeverScrollableScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(title, style: Constants.extra),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, index) {
          return SearchMVTile(index);
        }, childCount: controller.searchList.length))
      ],
    );
  }
}

class SearchMVTile extends StatelessWidget {
  final SearchHomeController controller = SearchHomeController();

  SearchMVTile(
    this.index, {
    super.key,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    final searchList = controller.searchList[index];
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 80.w,
              height: 56.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.w),
                child: Image.network(
                  searchList['imageUrl']!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(searchList['title']!, style: Constants.subHead),
                  SizedBox(height: 8.h),
                  Text(searchList['artist']!,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Color(0xFF817A7A),
                            fontSize: 12.sp,
                          )),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Icon(
                  Icons.more_horiz,
                  color: neutral1,
                  size: 24.sp,
                ),
              ],
            ),
          ],
        ),
        Divider(height: 25.h, color: neutral2),
      ],
    );
  }
}
