import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var widgetKey = UniqueKey();
  final List<String> songNames = [
    "Sledgehammer",
    "Umbrella",
  ];
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
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: _isEditing
                        ? IconButton(
                            icon: Icon(
                              Icons.highlight_remove,
                              color: Color(0xFF71737B),
                              size: 20,
                            ),
                            onPressed: () {
                              _searchController.clear();
                            },
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                SizedBox(height: 16),
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
                              labelColor: Colors.white,
                              unselectedLabelColor: Color(0xFF71737B),
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 22,
                                      fontWeight: FontWeight
                                          .bold), // set font size for selected tab
                              unselectedLabelStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                            ),
                            SingleChildScrollView(
                              child: Container(
                                height: MediaQuery.of(context).size.height,
                                width: double.infinity,
                                child: TabBarView(
                                  children: [
                                    ExampleScreen(),
                                    search_result("Top Searching"),
                                    search_result("Top Searching"),
                                    search_result("Top Searching"),
                                    search_result("Top Searching"),
                                    search_result("Top Searching"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'History',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 16),
                          HorizontalButtonScrollView(
                            buttonTexts: [
                              'Fall out boy',
                              'Good girl',
                            ],
                            color1: Color(0x00000000),
                            color2: Color(0xFFCBFB5E),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            'Top Searching',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 16),
                          HorizontalButtonScrollView(
                            buttonTexts: [
                              'Button 1',
                              'Button 2',
                            ],
                            color1: Color(0xFFCBFB5E),
                            color2: Colors.black,
                          ),
                        ],
                      ),
                //  Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       SizedBox(
                //         height: 20,
                //       ),
                //       Text(
                //         'History',
                //         style: Theme.of(context)
                //             .textTheme
                //             .titleLarge!
                //             .copyWith(
                //               color: Colors.white,
                //               fontSize: 22,
                //               fontWeight: FontWeight.bold,
                //             ),
                //       ),
                //       SizedBox(
                //         height: 10,
                //       ),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         children: [
                //           for (var songName in songNames)
                //             Row(
                //               children: [
                //                 OutlinedButton(
                //                   // key: widgetKey,
                //                   onPressed: () {
                //                     // do something when the button is pressed
                //                   },
                //                   style: OutlinedButton.styleFrom(
                //                     primary: Color(0xFFCBFB5E),
                //                     side: const BorderSide(
                //                         color: (Color(0xFFCBFB5E)),
                //                         width: 1),
                //                     shape: const RoundedRectangleBorder(
                //                         borderRadius: BorderRadius.all(
                //                             Radius.circular(10))),
                //                   ),
                //                   child: Text(
                //                     songName,
                //                     style: Theme.of(context)
                //                         .textTheme
                //                         .titleMedium!
                //                         .copyWith(
                //                           color: (Color(0xFFCBFB5E)),
                //                           fontSize: 14,
                //                         ),
                //                   ),
                //                 ),
                //                 SizedBox(
                //                   width: 10,
                //                 ),
                //               ],
                //             ),
                //         ],
                //       ),
                //       SizedBox(
                //         height: 25,
                //       ),
                //       Text(
                //         'Top Searching',
                //         style: Theme.of(context)
                //             .textTheme
                //             .titleLarge!
                //             .copyWith(
                //               color: Colors.white,
                //               fontSize: 22,
                //               fontWeight: FontWeight.bold,
                //             ),
                //       ),
                //       SizedBox(
                //         height: 15,
                //       ),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         children: [
                //           for (var songName in songNames)
                //             Row(
                //               children: [
                //                 OutlinedButton(
                //                   // key: widgetKey,
                //                   onPressed: () {
                //                     // do something when the button is pressed
                //                   },
                //                   style: OutlinedButton.styleFrom(
                //                     primary: Colors.black,
                //                     backgroundColor: Color(0xFFCBFB5E),
                //                     side: const BorderSide(
                //                         color: (Color(0xFFCBFB5E)),
                //                         width: 1),
                //                     shape: const RoundedRectangleBorder(
                //                         borderRadius: BorderRadius.all(
                //                             Radius.circular(10))),
                //                   ),
                //                   child: Text(
                //                     songName,
                //                     style: Theme.of(context)
                //                         .textTheme
                //                         .titleMedium!
                //                         .copyWith(
                //                           color: Colors.black,
                //                           fontSize: 14,
                //                         ),
                //                   ),
                //                 ),
                //                 SizedBox(
                //                   width: 10,
                //                 ),
                //               ],
                //             ),
                //         ],
                //       )
                //     ],
                //   ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class search_result extends StatelessWidget {
  const search_result(this.title);
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
                height: 20,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, index) {
          return SimpleList(index);
        }, childCount: 20))
      ],
    );
  }
}

class search_all extends StatelessWidget {
  const search_all({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(
                            'https://picsum.photos/seed/$index/50/50',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Song Title $index',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: Colors.white,
                                      fontSize: 16,
                                    )),
                            SizedBox(height: 4),
                            Text('Artist Name $index',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: Colors.white,
                                      fontSize: 16,
                                    )),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Divider(color: Color(0xFF3E3C4C)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class SimpleList extends StatelessWidget {
  const SimpleList(
    this.index, {
    super.key,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 45,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  'https://picsum.photos/seed/$index/50/50',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Song Title $index',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white,
                            fontSize: 16,
                          )),
                  SizedBox(height: 4),
                  Text('Artist Name $index',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white,
                            fontSize: 16,
                          )),
                ],
              ),
            ),
            Icon(
              Icons.more_horiz,
              color: Colors.white,
            ),
          ],
        ),
        Divider(color: Color(0xFF3E3C4C)),
      ],
    );
  }
}

class ExampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Expanded(
          child: search_result('Top Searching'),
        ),
        Expanded(
          child: search_result('Artist'),
        ),
        Expanded(
          child: search_result('Songs'),
        ),
      ],
    );
  }
}

// class HorizontalButtonScrollView extends StatefulWidget {
//   final List<String> buttonTexts;

//   HorizontalButtonScrollView({required this.buttonTexts});

//   @override
//   _HorizontalButtonScrollViewState createState() =>
//       _HorizontalButtonScrollViewState();
// }

class HorizontalButtonScrollView extends StatelessWidget {
  const HorizontalButtonScrollView({
    super.key,
    required this.buttonTexts,
    required this.color1,
    required this.color2,
  });
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
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.white,
                side: BorderSide(color: Color(0xFFCBFB5E), width: 1),
                backgroundColor: color1,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              child: Text(buttonText,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: color2,
                        fontSize: 14,
                      )),
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
