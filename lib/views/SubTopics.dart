
import 'package:flutter/material.dart';

import '../models/SubTopicsModel.dart';
import 'TopicPlaylist.dart';


class SubTopics extends StatefulWidget {
  const SubTopics({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SubTopics createState() => _SubTopics();
}

class _SubTopics extends State<SubTopics> {

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Colors.black,
      appBar: AppBar( backgroundColor: Colors.black,
        title: const Text('Sub Topic'),
      ),
      body:  Center(
        child: GridView.count(crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
            shrinkWrap: true,
            children: List.generate(8, (index){
              return Padding(padding: const EdgeInsets.all(5.0),
              child: IconButton(onPressed: (){ 
                Navigator.push(
                context, MaterialPageRoute(builder: (context) => const TopicPlaylist()));
                }
                , icon: Stack(
                  children: [
                    Container(alignment: Alignment.center,
                    child: Image.asset(subtopicImages[index]),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(genres[index], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),)
                    )
                  ],
                )
                )
                );
            }))
      ),
    );
  }
}

             
//icon: Image.asset(hiphop[index]))