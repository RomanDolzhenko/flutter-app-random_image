import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;
  ImageList(this.images);

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, int index){
        return buildImage(images[index]);
      }
    );
  }

  Widget buildImage(ImageModel image){
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.yellow.withOpacity(0.4),
              spreadRadius: 4,
              blurRadius: 3,
              offset: Offset(1, 1),
            ),
          ],
          border: Border(
              left: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
              bottom: BorderSide(width: 1.0, color: Color(0xFFFF000000))
          )
      ),
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: 3.0,
              bottom: 13.0
            ),
            child: new Text(
              'Author: ${image.author}',
              style: new TextStyle(
                fontSize: 21.0,
                color: Colors.red,
              ),
            ),
          ),
          Image.network(image.url)
        ],
      ),
    );
  }
}
