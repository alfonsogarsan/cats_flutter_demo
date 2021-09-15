import 'package:cats/presentation/entities/positioned_cat.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

const catPhotoHeight = 200.0;
const catPhotoWidth = 200.0;

class CatWidget extends StatelessWidget {
  final PositionedCat positionedCat;

  const CatWidget({required this.positionedCat});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          child: CachedNetworkImage(
            fadeInDuration: const Duration(milliseconds: 50),
            fit: BoxFit.cover,
            imageUrl: positionedCat.cat.url,
            height: catPhotoHeight,
            width: catPhotoWidth,
            placeholder: (context, url) => Container(color: Colors.grey),
            errorWidget: (context, url, error) => Container(
              color: Colors.grey,
              height: catPhotoHeight,
              width: catPhotoWidth,
              child: Icon(Icons.image),
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          child: Container(
            width: catPhotoWidth,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              positionedCat.cat.title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
