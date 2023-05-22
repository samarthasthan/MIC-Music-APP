

import 'package:flutter/material.dart';
import 'package:mic_geezo_explore/models/ExploreChartsModel.dart';

import '../main.dart';
import '../models/Topics.dart';
import '../models/TrendingModel.dart';
import 'SubTopics.dart';

class Explore extends State<MyApp> {

  int _index=0;

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) { 
    return  MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        backgroundColor: const Color(0x0020242f),
      
        appBar: AppBar(backgroundColor: Colors.black),
      
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Explore', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.search, color: Colors.white,), iconSize: 45)
                ], 
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 20, 0, 0),
                child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  const [
                    Text('Geez Chart', style: TextStyle(color: Colors.white, fontSize: 20),),
                    // TextButton(onPressed: (){}, child: const Text('View all', textAlign: TextAlign.right, style: TextStyle(fontSize: 12, color: Colors.white),)),
                    
                  ],
                ),
              
              ),
              
              ListView.builder(
              scrollDirection: Axis.vertical, shrinkWrap: true,
               padding: const EdgeInsets.all(15),
                 itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                       height: 60,
                        color: const Color.fromARGB(255, 19, 18, 47),
                          // child: Center(child: Text('Entry ${entries[index]}')),
                          
                          child:  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [Row(
                                children : [
                                //ImageIcon(chart_assets[index] as ImageProvider<Object>?),
                                Text('${index+1}   ', style: const TextStyle(color: Colors.white)),
                                IconButton(onPressed: (){}, icon: Image.asset(chart_assets[index]), iconSize: 30),
                                Column(
                                  children: [
                                    Text(charts[index], style: const TextStyle(color: Colors.white)),
                                    Text(chart_artists[index], style: const TextStyle(color: Color.fromARGB(255, 201, 196, 178,), fontSize: 12))
                                  ],
                                ),]),
                                 IconButton(onPressed: (){}, icon: const Icon(Icons.more_horiz, color: Colors.white,))
                              ],
                            ),
                          ),
                    );
                  }
              ),
              
              Row(
                children:const  [
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child:  Text('Top Trending', style: TextStyle(color: Colors.white, fontSize: 20,))
                  ),
                ],
              ),
              

              SizedBox(
                height: 150, // card height
                child: PageView.builder( 
                  itemCount: 3,
                  controller: PageController(viewportFraction: 0.7),
                  onPageChanged: (int index) => setState(() => _index = index),
                  itemBuilder: (_, i) {
                    return Transform.scale( 
                      scale: i == _index ? 1 : 0.9,
                      child: Stack(
                        children: [Container(
                          alignment: Alignment.center,
                          child: Image.asset(trending_assets[_index], fit: BoxFit.cover, width: double.infinity,),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border, color: Colors.white,))
                        ), 
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Column( 
                            children: [
                              Text(trending_songs[_index], style: const TextStyle(color: Colors.white)),
                              Text(trending_artists[_index], style: const TextStyle(color: Color.fromARGB(255, 201, 196, 178,), fontSize: 12))
                            ],
                          )
                        )
                        ],
                      )
                      );
                },
                ),
              ),

              // IconButton(onPressed: (){}, icon: Image.asset(trending_assets[_index]))
             
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox( height: 10,width: 10, child: ColoredBox(color: (_index == 0 ? Colors.blue: Colors.black26)),),
                  const SizedBox(width: 20,),
                  SizedBox( height: 10,width: 10, child: ColoredBox(color: (_index == 1 ? Colors.blue: Colors.black26)),),
                  const SizedBox(width: 20,),
                  SizedBox( height: 10,width: 10, child: ColoredBox(color: (_index == 2 ? Colors.blue: Colors.black26)),),
                ],
              ),
              
              
            Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Topic', style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ],
              ),
            

            GridView.count(crossAxisCount: 3,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
            shrinkWrap: true,
            children: List.generate(6, (index){
              return Padding(padding: const EdgeInsets.all(5.0),
              child: IconButton(onPressed: (){ 
                Navigator.push(
                context, MaterialPageRoute(builder: (context) => const SubTopics()));
                }
                , icon: Stack(
                  children: [
                    Container(alignment: Alignment.center,
                    child: Image.asset(topics[index]),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(topic_genres[index], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),)
                    )
                  ],
                )
                )
                );
            }))

            ],
          ),
        ),

        bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Fixed
        backgroundColor: const Color(0xFF0E0B1F),
        selectedItemColor: const Color(0xFFCBFB5E),
        unselectedItemColor: const Color(0xFF71737B),
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place_outlined),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.radio_outlined),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Account',
          ),
        ],
      ),
      
      ),
    );
}
}