import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/constants.dart';
import '/controllers/homepageController.dart';
import '/views/searchHome.dart';

import 'package:transparent_image/transparent_image.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});
  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final HomePageController homecontroller = HomePageController();

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
    return Scaffold(
      backgroundColor: brand2,
      appBar: AppBar(
        title: Text(
          'Geez',
          style: Constants.title,
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
              icon: Icon(
                Icons.search,
              ))
        ],
        backgroundColor: brand2,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.w),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'New Album',
                      style: Constants.subtitle,
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text('View all', style: Constants.sub),
                    ),
                  ],
                ),
                Container(
                  height: 148.h,
                  width: double.infinity,
                  child: PageView.builder(
                    itemCount: homecontroller.numberOfNewAlumbs,
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
                          child: Container(height: 148.h),
                          url: homecontroller.imageUrl[index],
                          num: 2,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text('Geez Weekly', style: Constants.subtitle),
                SizedBox(
                  height: 15.h,
                ),
                Card(
                    margin: EdgeInsets.all(8.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.w),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: InkWell(
                      onTap: () {},
                      child: Stack(children: [
                        FadeInImage(
                          placeholder: MemoryImage(kTransparentImage),
                          image: NetworkImage(
                            homecontroller.weekly[0]['imageUrl']!,
                          ),
                          fit: BoxFit.cover,
                          height: 188.h,
                          width: 337.w,
                        ),
                        Positioned(
                          top: 10.w,
                          left: 10.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(homecontroller.weekly[0]['title']!,
                                  style: Constants.musicTitle),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(homecontroller.weekly[0]['artist']!,
                                  style: Constants.musicSubTitle),
                            ],
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 60.w,
                              height: 60.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: neutral1.withOpacity(1),
                                  width: 1.w,
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.play_arrow,
                                  size: 40.w,
                                  color: neutral1,
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
                SizedBox(
                  height: 15.h,
                ),
                Text('Recently Music', style: Constants.subtitle),
                Container(
                  height: 200.h,
                  width: double.infinity,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      final music = homecontroller.recentMusic[index];
                      return Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            height: 37.h,
                            width: double.infinity,
                            child: ListTile(
                              leading: Container(
                                width: 60.w,
                                height: 37.h,
                                child: Row(
                                  children: [
                                    Container(
                                        width: 20.w,
                                        child: Text('${index + 1}',
                                            style: Constants.subHead)),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5.w),
                                      child: Image.network(
                                        music['imageUrl']!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              title:
                                  Text(music['title']!, style: Constants.head),
                              subtitle: Text(music['artist']!,
                                  style: Constants.musicSubTitle),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.more_horiz,
                                  color: neutral1,
                                  size: 17.sp,
                                ),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 50.h,
              width: 50.w,
              child: CircleAvatar(
                child: ClipOval(
                  child: Image(
                    image: NetworkImage(
                        'https://indiater.com/wp-content/uploads/2021/06/Free-Music-Album-Cover-Art-Banner-Photoshop-Template-1024x1024.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text("Come Back Home", style: Constants.head),
            IconButton(
              icon: Icon(
                Icons.skip_previous_outlined,
                size: 20.w,
                color: neutral1,
              ),
              onPressed: () {
                // handle back button press here
              },
            ),
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: neutral1.withOpacity(1),
                  width: 1.w,
                ),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.play_arrow,
                  size: 20.w,
                  color: neutral1,
                ),
                onPressed: () {
                  // handle play button press here
                },
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.skip_next_outlined,
                size: 20.w,
                color: neutral1,
              ),
              onPressed: () {
                // handle next button press here
              },
            ),
          ],
        )
      ],
      
    );
  }
}

class StackOfCards extends StatelessWidget {
  final int num;
  final Widget child;
  final double offset;
  final String url;

  const StackOfCards(
      {int num = 1, required this.child, this.offset = 10.0, required this.url})
      : this.num = num > 0 ? num : 1,
        assert(offset != null);

  @override
  Widget build(BuildContext context) => Stack(
        children: List<Widget>.generate(
          num - 1,
          (val) => Positioned(
            bottom: (val * offset).w,
            right: (val * offset).w,
            top: ((num - val - 1) * offset).w,
            left: ((num - val - 1) * offset).w,
            child: Card(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0.w),
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 3.w, sigmaY: 3.w),
                  child: Image.network(url, fit: BoxFit.fill),
                ),
              ),
            ),
          ),
        ).toList()
          ..add(
            Padding(
              padding: EdgeInsets.only(
                bottom: ((num - 1) * offset).w,
                right: ((num - 1) * offset).w,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0.w),
                child: Image.network(url, fit: BoxFit.fill),
              ),
            ),
          ),
      );
}
