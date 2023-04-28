import 'package:flutter/material.dart';
class DownloadButton extends StatelessWidget {
  const DownloadButton({
    super.key, required this.colour1, required this.colour2, required this.text1, required  this.text2,
  });
  final Color colour1;
  final Color colour2;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(style: ElevatedButton.styleFrom(foregroundColor: Colors.black, backgroundColor: colour1),
        onPressed: (){
          Navigator.of(context).pop();
          showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return Column(
                children: [
                  SizedBox(height: 200,),
                  AlertDialog(
                    //alignment: Alignment(0.1, -0.5.h),
                    buttonPadding: EdgeInsets.all(10),
                    backgroundColor: Color(0xFFCBFB5E),
                    title: Text(text2,style: TextStyle(fontSize: 16,color: Colors.black54,fontWeight: FontWeight.w500),),
                  ),
                ],
              );
            },
          );


        },

        child: Text(text1,));
  }
}

