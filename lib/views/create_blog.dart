import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateBlog extends StatefulWidget {
  @override
  _CreateBlogState createState() => _CreateBlogState();
}

class _CreateBlogState extends State<CreateBlog> {
  String authorName, title, desc;

  File selectedImage;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        selectedImage = File(pickedFile.path);
      } else {
        print('No Image Selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Flutter",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            Text(
              "Blog",
              style: TextStyle(
                fontSize: 22,
                color: Colors.blue,
              ),
            )
          ],
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.file_upload),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                getImage();
              },
              child: selectedImage != null 
                  ? Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.file(
                          selectedImage,
                          fit: BoxFit.cover,
                        )
                      ),
                  )
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Icon(
                        Icons.add_a_photo,
                        color: Colors.black45,
                      ),
                  ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(hintText: "Author Name"),
                      onChanged: (value) {
                        authorName = value;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: "Title"),
                      onChanged: (value) {
                        title = value;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: "Description"),
                      onChanged: (value) {
                        desc = value;
                      },
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
