import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImageDetailWidget extends StatelessWidget {
  const CustomImageDetailWidget(
      {Key? key, required this.movieId, required this.imagePost})
      : super(key: key);
  final int movieId;
  final CachedNetworkImage imagePost;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Hero(
        tag: movieId,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(70),
          child: imagePost,
        ),
      ),
    );
  }
}
