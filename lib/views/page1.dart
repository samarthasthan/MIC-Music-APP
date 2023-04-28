import 'package:flutter/material.dart';
import 'package:mic_music_app/views/page3.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class Page1 extends StatefulWidget {
  const Page1({
    super.key,
  });

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {

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

    return SafeArea(
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg2.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(top: 15,child: IconButton(onPressed: () {}, icon: Icon(Icons.west))),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 260.h,
                ),
                Text(
                  'Come to Me',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 36.sp),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Text(
                  'Shawn Mendes',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp),
                ),
                SizedBox(
                  height: 33.h,
                ),
                const ReadMoreText(
                  'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                  trimLines: 2,
                  preDataTextStyle: TextStyle(fontWeight: FontWeight.w400),
                  style: TextStyle(color: Colors.white),
                  colorClickableText: Color(0xFF71737B),
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '...Show more',
                  trimExpandedText: ' show less',
                ),


                // Text("Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) "),
                // Container(child: Align(alignment: Alignment.topRight,child: TextButton(onPressed: (){
                //   setState(() {
                //     Navigator.push(context, MaterialPageRoute(builder: (context){
                //       return Page3();
                //     }));
                //
                //   });
                // }, child: Text("...Show More",style: TextStyle(color: Colors.grey),)))),

                SizedBox(
                  height: 10.h,
                ),
                const Divider(
                  thickness: 1,
                  color: Color(0xFFa8a5a5),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'Suggestion',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp),
                ),
                Container(
                  height: 180.h,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: songs.length,
                    itemBuilder: (BuildContext context, int index) {
                      final song = songs[index];
                      return Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            height: 40.h,
                            width: double.infinity,
                            child: ListTile(
                              leading: Container(
                                width: 60.w,
                                height: 37.h,
                                child: Row(
                                  children: [
                                    Container(
                                        width: 20.w,
                                        child: Text(
                                          '${index + 1}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(
                                            color: Colors.white,
                                            fontSize: 14.sp,
                                          ),
                                        )),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5.w),
                                      child: Image.network(
                                        song['imageUrl']!,
                                        fit: BoxFit.cover,
                                      ),
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
                                  fontSize: 16.sp,
                                ),
                              ),
                              subtitle: Text(
                                song['artist']!,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                  color: Colors.grey,
                                  fontSize: 12.sp,
                                ),
                              ),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.more_horiz,
                                  color: Colors.white,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
