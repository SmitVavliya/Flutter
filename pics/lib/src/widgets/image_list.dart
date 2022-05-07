import "package:flutter/material.dart";
import 'package:pics/src/model/image_mode.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> _images;

  const ImageList(this._images, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _images.length,
      itemBuilder: (BuildContext context, int index) =>
          buildImage(_images[index]),
    );
  }

  Widget buildImage(ImageModel image) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Image.network(image.url),
          ),
          Text(image.title),
        ],
      ),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
    );
  }
}
