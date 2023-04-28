import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:micmusic/Controls/AccountsController.dart';
import 'package:micmusic/constants.dart';
import '../custom_icons_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class Account extends StatelessWidget {
  final AccountsController _accountsController = AccountsController();

  Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Account",
          style: textTheme.displayLarge,
        ),
        backgroundColor: backGroundColor,
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              icon: Icon(
                Icons.settings_outlined,
                size: 24.w,
              ))
        ],
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: backGroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/img/DP.png',
                      height: 80.h,
                      width: 80.h,
                    ),
                    SizedBox(
                      width: 40.w,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 80.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 41.h,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _accountsController.numberOfPlayLists
                                            .toString(),
                                        style: textTheme.headlineLarge,
                                      ),
                                      Text(
                                        "Playlist",
                                        style: textTheme.headlineMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 41.h,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          _accountsController.numberOfFollowers,
                                          style: textTheme.headlineLarge),
                                      Text(
                                        "Follower",
                                        style: textTheme.headlineMedium,
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 41.h,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          _accountsController.numberOfFollowing
                                              .toString(),
                                          style: textTheme.headlineLarge),
                                      Text(
                                        "Following",
                                        style: textTheme.headlineMedium,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 28.h,
                              width: 78.w,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/edit');
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xFFCBFB5E)),
                                  ),
                                  child: Text(
                                    "Edit",
                                    style: GoogleFonts.roboto(
                                      fontSize: 16.sp,
                                      color: Color(0xFF20242F)
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "Library",
                  style: textTheme.displayMedium,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Column(
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context, '/accounts/playlist'),
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(
                                      CustomIcons.playlist,
                                      color: const Color(0xFFEEEEEE),
                                      size: 24.h,
                                    ),
                                    const Spacer(
                                      flex: 1,
                                    ),
                                    Text(
                                      "My playlist",
                                      style: textTheme.displaySmall,
                                    ),
                                    Spacer(flex: 22),
                                    Icon(Icons.chevron_right,
                                        color: Color(0xFFEEEEEE), size: 24.h)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const Divider(
                          color: Color(0xFFFFFFFF),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, '/accounts/album'),
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(
                                      CustomIcons.album,
                                      color: Color(0xFFEEEEEE),
                                      size: 24.h,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(),
                                    ),
                                    Text(
                                      "Album",
                                      style: textTheme.displaySmall,
                                    ),
                                    Expanded(flex: 22, child: Container()),
                                    Icon(Icons.chevron_right,
                                        color: Color(0xFFEEEEEE), size: 24.h)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const Divider(
                          color: Color(0xFFFFFFFF),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Icon(
                                    CustomIcons.video_library,
                                    color: Color(0xFFEEEEEE),
                                    size: 24.h,
                                  ),
                                  const Spacer(
                                    flex: 1,
                                  ),
                                  Text(
                                    "MV",
                                    style: textTheme.displaySmall,
                                  ),
                                  const Spacer(flex: 22),
                                  Icon(Icons.chevron_right,
                                      color: Color(0xFFEEEEEE), size: 24.h)
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const Divider(
                          color: Color(0xFFFFFFFF),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Icon(
                                    CustomIcons.artist,
                                    color: Color(0xFFEEEEEE),
                                    size: 24.h,
                                  ),
                                  const Spacer(
                                    flex: 1,
                                  ),
                                  Text(
                                    "Artist",
                                    style: textTheme.displaySmall,
                                  ),
                                  const Spacer(flex: 22),
                                  Icon(Icons.chevron_right,
                                      color: Color(0xFFEEEEEE), size: 24.h)
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const Divider(
                          color: Color(0xFFFFFFFF),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Icon(
                                    CustomIcons.download,
                                    color: Color(0xFFEEEEEE),
                                    size: 24.h,
                                  ),
                                  const Spacer(
                                    flex: 1,
                                  ),
                                  Text(
                                    "Download",
                                    style: textTheme.displaySmall,
                                  ),
                                  Spacer(flex: 22),
                                  Icon(Icons.chevron_right,
                                      color: Color(0xFFEEEEEE), size: 24.h)
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const Divider(
                          color: Color(0xFFFFFFFF),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Recent Activity",
                  style: textTheme.displayMedium,
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 88.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            GestureDetector(
                                onTap: _accountsController.imagePath[index]
                                    .handleClick(),
                                child: Image.asset(
                                  _accountsController
                                      .imagePath[index].imagePath,
                                  height: 88.h,
                                  width: 88.h,
                                )),
                            SizedBox(
                              width: 16.w,
                            )
                          ],
                        );
                      }),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 88.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: _accountsController.imagePath[index + 4]
                                  .handleClick(),
                              child: Image.asset(
                                _accountsController
                                    .imagePath[index + 4].imagePath,
                                height: 88.h,
                                width: 88.h,
                              ),
                            ),
                            SizedBox(
                              width: 16.w,
                            )
                          ],
                        );
                      }),
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 0.0,
          color: Color(0xFF0E0B1F),
          child: SizedBox(
            height: 60.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: SizedBox(
                    height: 40.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.home_outlined,
                          size: 20.h,
                          color: Color(0xFF71737B),
                        ),
                        Text(
                          "Home",
                          style: textTheme.bodyMedium,
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    //Navigate to Home
                  },
                ),
                GestureDetector(
                  child: SizedBox(
                    height: 40.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 20.h,
                          color: Color(0xFF71737B),
                        ),
                        Text(
                          "Explore",
                          style: textTheme.bodyMedium,
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    // Mavigate to explore
                  },
                ),
                GestureDetector(
                  child: SizedBox(
                    height: 40.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          CustomIcons.radio,
                          size: 20.h,
                          color: Color(0xFF71737B),
                        ),
                        Text(
                          "Radio",
                          style: textTheme.bodyMedium,
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    // Mavigate to Radio
                  },
                ),
                GestureDetector(
                  child: SizedBox(
                    height: 40.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          CustomIcons.single,
                          size: 20.h,
                          color: Color(0xFFCBFB5E),
                        ),
                        Text(
                          "Account",
                          style: GoogleFonts.quicksand(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFCBFB5E),
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    // Mavigate to Radio
                  },
                )
              ],
            ),
          )),
    );
  }
}
