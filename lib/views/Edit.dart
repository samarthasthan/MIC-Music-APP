import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:micmusic/constants.dart';
import 'package:micmusic/controls/EditController.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Edit extends StatelessWidget {
  const Edit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit"),
        centerTitle: true,
        backgroundColor: Color(0xFF0E0B1F),
        elevation: 0.0,
      ),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xFF0E0B1F),
        padding: EdgeInsets.only(bottom: 70.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          TopPart(),
          TextButton(
              onPressed: () {
                print("Handle Change Password");
              },
              child: Text("Change password",style: textTheme.headlineSmall,))
        ]),
      ),
    );
  }
}

class TopPart extends StatelessWidget {
  final EditController _editController = EditController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Column(
          children: [
            SizedBox(
              height: 70.h,
            ),
            Display()
          ],
        ),
        ProfilePic()
      ],
    );
  }
}

class ProfilePic extends StatefulWidget {
  const ProfilePic({super.key});

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  final EditController _editController = EditController();

  File _image = File("assets");

  Future<void> _getImage() async {
    //Changing Image
    print(_image.path);
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        print(pickedFile.path);
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          
          boxShadow: [
            BoxShadow(
              color: Color(0xFF000000).withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          radius: 74.r,
          backgroundColor: Color(0xFFADB0C0),
          child: _image.path != "assets"
              ? CircleAvatar(radius: 71.r, backgroundImage: FileImage(_image))
              : CircleAvatar(
                  radius: 71.r,
                  backgroundImage: AssetImage(_editController.imagePath)),
        ),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(103.w, 103.h, 0, 0),
        
        child: CircleAvatar(
          radius: 20.r,
          backgroundColor: Color(0xFFCBFB5E),
          child: IconButton(
            icon: Icon(Icons.camera_alt_rounded, color: Color(0xFF0E0B1F)),
            onPressed: _getImage,
          ),
        ),
      )
    ]);
  }
}

class Display extends StatefulWidget {
  const Display({super.key});

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  final EditController _editController = EditController();
  final TextEditingController _textEditingController = TextEditingController();
  late String _name;

  @override
  void initState() {
    super.initState();
    _textEditingController.text = _editController.name;
    _name = _editController.name;
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _onTextTap() {
    setState(() {
      _textEditingController.text = _name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      decoration: BoxDecoration(
          color: Color(0xFF363942),
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
          boxShadow: [
            BoxShadow(
                color: Color(0xFFFFFFFF).withOpacity(0.22),
                blurRadius: 5,
                offset: Offset(5, 3)),
          ]),
      child: Column(children: [
        SizedBox(
          height: 143.h,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(17.w, 17.h, 17.w, 17.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Username",
                style: textTheme.bodySmall,
              ),
              Text(
                _editController.name,
                style: textTheme.bodyLarge,
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Divider(
            color: Colors.black,
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(17.w, 17.h, 17.w, 17.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Email",
                style: textTheme.bodySmall,
              ),
              Text(
                _editController.email,
                style: textTheme.bodyLarge,
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Divider(
            color: Colors.black,
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(17.w, 17.h, 17.w, 17.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Phone",
                style: textTheme.bodySmall,
              ),
              Text(
                _editController.phonenumber,
                style: textTheme.bodyLarge,
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Divider(
            color: Colors.black,
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(17.w, 17.h, 17.w, 17.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Gender",
                style: textTheme.bodySmall,
              ),
              Text(
                _editController.gender,
                style: textTheme.bodyLarge,
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Divider(
            color: Colors.black,
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(17.w, 17.h, 17.w, 30.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Date of birth",
                style: textTheme.bodySmall,
              ),
              Text(
                "${_editController.dob.day}/${_editController.dob.month}/${_editController.dob.year}",
                style: textTheme.bodyLarge,
              )
            ],
          ),
        ),
      ]),
    );
  }
}

// SizedBox(
//                 width: 110.w,
//                 child: GestureDetector(
//                   onTap: _onTextTap,
//                   child: TextField(
//                     style: textTheme.bodyLarge,
//                     controller: _textEditingController,
//                     autofocus: false,
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                     ),
//                     onChanged: (value) {
//                       setState(() {
//                         _name = value;
//                       });
//                     },
//                   ),
//                 ),
//               ),