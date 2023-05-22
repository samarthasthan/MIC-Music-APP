import 'package:flutter/material.dart';

import '../models/TopicPlaylistModel.dart';

class TopicPlaylist extends StatefulWidget {
  const TopicPlaylist({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TopicPlaylist createState() => _TopicPlaylist();
}



class _TopicPlaylist extends State<TopicPlaylist> {

  _getRequests()async{

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: const Color(0x0020242f),
      //appBar: AppBar(elevation: 0.0, backgroundColor: Colors.transparent,),

      body: SafeArea(
        child: Stack(
          children: [
            //AppBar(elevation: 0.0, backgroundColor: Colors.transparent,),
            SingleChildScrollView(
              child: DecoratedBox(
                decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('images/playlist_background.png'), fit: BoxFit.cover)
              ), 
              child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 0, 20),
              child: IconButton(onPressed: ()=>
                    Navigator.pop(context), icon: const Icon(Icons.arrow_back, color: Colors.white, size: 24,)),
            ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      IconButton(onPressed: (){}, icon: const Icon(Icons.shuffle), color: Colors.white,),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.fast_rewind), color: Colors.white,),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.play_arrow), color: Colors.white,),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.fast_forward), color: Colors.white,),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.repeat), color: Colors.white,)
                      ]
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(5, 30, 10, 10),
                    child: Text("Rap Soul", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 10, 20),
                    child: Text("Playlist", style: TextStyle(color: Colors.white),),
                  ),
                   Padding(
                    padding: const EdgeInsets.fromLTRB(5, 10, 20, 20),
                    child: Text(playlist_description[0], textAlign: TextAlign.justify, style: const TextStyle(color: Colors.white),),
                  ),
                  Padding(
                    padding:const EdgeInsets.fromLTRB(10, 30, 10, 20),
                    child:Container(
                    height:1.0, width:double.infinity, color:Colors.white,),),
            
                  ListView.builder(
                      scrollDirection: Axis.vertical, shrinkWrap: true,
                       padding: const EdgeInsets.all(15),
                         itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                               height: 60,
                                  
                                  child:  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        //ImageIcon(chart_assets[index] as ImageProvider<Object>?),
                                        Text('${index+1}', style: const TextStyle(color: Colors.white)),
                                        IconButton(onPressed: (){}, icon: Image.asset(playlist_song_icons[index]), iconSize: 30),
                                        Column(
                                          children: [
                                            Text(playlist_songs[index], style: const TextStyle(color: Colors.white)),
                                            Text(artist_names[index], style: const TextStyle(color: Color.fromARGB(255, 201, 196, 178,), fontSize: 12))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                            );
                          }
                      ),
                ],
              ),
              ),
            ),
          ],
        ),
      )



    );


  }



}
